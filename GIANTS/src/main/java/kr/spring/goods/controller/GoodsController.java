package kr.spring.goods.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.goods.service.GoodsService;
import kr.spring.goods.vo.GoodsFavVO;
import kr.spring.goods.vo.GoodsOptionVO;
import kr.spring.goods.vo.GoodsVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	/*==========================
	 * 자바빈(VO) 초기화
	 *==========================*/
	@ModelAttribute
	public GoodsVO initCommand() {
		return new GoodsVO();
	}
	
	/*==========================
	 * 굿즈 등록
	 *==========================*/
	//등록 폼
	@GetMapping("/goods/registerGoods.do")
	public String form() {
		return "goodsRegister";
	}
	
	//전송된 데이터 처리
	@PostMapping("/goods/registerGoods.do")
	public String submit(@Valid GoodsVO goodsVO, BindingResult result, Model model,
							HttpServletRequest request, HttpSession session) {
		log.debug("<<상품등록>> : " + goodsVO);
		log.debug("<<goods_photo().length>> : " + goodsVO.getGoods_photo().length);
		
		if(goodsVO.getGoods_photo().length == 0) {
			result.rejectValue("goods_photo", "required");
		}
		if(goodsVO.getGoods_photo().length >= 5*1024*1024) {//5MB
			result.rejectValue("goods_photo", "limitUploadSize", new Object[] {"5MB"}, null);
		}
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		goodsService.insertGoods(goodsVO);
		
		model.addAttribute("message", "상품등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/goods/admin_goodsList.do");

		return "common/resultView";
	}
	
	/*==========================
	 * 이미지 출력
	 *==========================*/
	@RequestMapping("/goods/imageView.do")
	public ModelAndView viewImage(@RequestParam int goods_num) {
		
		GoodsVO goodsVO = goodsService.selectGoods(goods_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		mav.addObject("imageFile", goodsVO.getGoods_photo());
		mav.addObject("filename", goodsVO.getGoods_photoname());
		
		return mav;
	}
		
	/*==========================
	 * [관리자] 굿즈 목록
	 *==========================*/
	@RequestMapping("/goods/admin_goodsList.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체|검색 레코드 수
		int count = goodsService.selectGoodsRowCount(map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 20, 10, "admin_goodsList.do");
		
		List<GoodsVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = goodsService.selectGoodsList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/*==========================
	 * [일반회원] 굿즈 목록
	 *==========================*/
	@RequestMapping("/goods/goodsList.do")
	public ModelAndView getGoodsList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
									 @RequestParam(value="order", defaultValue="1") int order,
									 String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("status", 0); //status가 0이면 판매중(1), 판매중지(2) 모두 체크
		
		//전체|검색 레코드 수
		int count = goodsService.selectGoodsRowCount(map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 20, 10, "goodsList.do");
		 
		List<GoodsVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = goodsService.selectGoodsList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("goodsList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/*==========================
	 * 굿즈 상세페이지
	 *==========================*/
	@RequestMapping("/goods/goodsDetail.do")
	public ModelAndView getGoodsDetail(@RequestParam int goods_num) {
		log.debug("<<굿즈 상세 - goods_num>> : " + goods_num);
		
		//상품 상세
		GoodsVO goods = goodsService.selectGoods(goods_num);
		
		List<GoodsOptionVO> list = null;
		list = goodsService.selectOptionList(goods_num);
		
		//상품명에 태그를 허용하지 않음
		goods.setGoods_name(StringUtil.useNoHtml(goods.getGoods_name()));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("goodsView");
		mav.addObject("goods", goods);
		mav.addObject("option", list);
		
		return mav;
	}

	/*==========================
	 * [관리자] 굿즈 정보 수정
	 *==========================*/
	//수정 폼 호출
	@GetMapping("/goods/goodsUpdate.do")
	public String formUpdate(@RequestParam int goods_num, Model model) {
		 
		GoodsVO goodsVO = goodsService.selectGoods(goods_num);
		
		List<GoodsOptionVO> list = goodsService.selectOptionList(goods_num);
		
		model.addAttribute("goodsVO", goodsVO);
		model.addAttribute("list", list);
		
		return "goodsModify";	
	}
	
	//전송된 데이터 처리
	@PostMapping("/goods/goodsUpdate.do")
	public String submitUpdate(@Valid GoodsVO goodsVO, @Valid GoodsOptionVO goodsOptionVO,
								BindingResult result, HttpServletRequest request, Model model)	{
		log.debug("<<상품 정보 수정 - GoodsVO>> : " + goodsVO);
		log.debug("<<상품 재고 수정 - GoodsOptionVO>> : " + goodsOptionVO);
			
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "goodsModify";
		}
		
		GoodsVO db_goods = goodsService.selectGoods(goodsVO.getGoods_num());
		
		if(goodsVO.getGoods_photoname().isEmpty()) {
			goodsVO.setGoods_photo(db_goods.getGoods_photo());
		 	goodsVO.setGoods_photoname(db_goods.getGoods_photoname()); 
		 }
		
		log.debug("<<로그찍기 - goodsVO.getGoods_photo()>> : " + goodsVO.getGoods_photo());
		log.debug("<<로그찍기 - goodsVO.getGoods_photoname()>> : " + goodsVO.getGoods_photoname());
		
		//상품 정보 수정
		goodsService.updateGoods(goodsVO);
		
		model.addAttribute("message", "상품 수정 완료!");
		model.addAttribute("url", request.getContextPath() + "/goods/goodsDetail.do?goods_num=" + goodsVO.getGoods_num());
		
		return "common/resultView";
	}
	
	/*======굿즈 찜하기=======*/
	//굿즈 좋아요 읽기
	@RequestMapping("/goods/getFav.do")
	@ResponseBody
	public Map<String, Object> getFav(GoodsFavVO fav, HttpSession session){
		
		log.debug("<<상품 찜하기 읽기>> : " + fav);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) { //로그인 되지 않은 상태
			mapJson.put("status", "noFav");
		}else { //로그인 된 상태
			//로그인 된 회원번호 셋팅
			fav.setMem_num(user.getMem_num());
			
			GoodsFavVO goodsFav = goodsService.selectGoodsFav(fav);
			if(goodsFav != null) {
				mapJson.put("status", "yesFav");
			}else {
				mapJson.put("status", "noFav");
			}
			mapJson.put("count", goodsService.selectGoodsFavCount(fav.getGoods_num()));			
		}
		return mapJson;
	}
	
	//굿즈 찜하기 등록|취소
	@RequestMapping("/goods/writeFav.do")
	@ResponseBody
	public Map<String, Object> writeFav(GoodsFavVO fav, HttpSession session){
		log.debug("<<상품 찜하기 등록/삭제 - GoodsFavVO>> : " + fav);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			mapJson.put("result", "logout");
		}else {
			//로그인 된 회원번호 셋팅
			fav.setMem_num(user.getMem_num());
			
			GoodsFavVO goodsFav = goodsService.selectGoodsFav(fav);
			if(goodsFav != null) { //등록한 찜하기가 있으면 삭제
				goodsService.deleteGoodsFav(goodsFav.getFav_num());
				
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
			}else { //등록한 찜하기가 없으면 등록
				goodsService.insertGoodsFav(fav);
				
				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
			}
			mapJson.put("count", goodsService.selectGoodsFavCount(fav.getGoods_num()));
		}
		return mapJson;
	}
	
	
	
	
	
}
