package kr.spring.goods.controller;

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
import kr.spring.goods.vo.GoodsVO;
import kr.spring.util.PagingUtil;
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
	public String submit(@Valid GoodsVO goodsVO, BindingResult result, 
							HttpServletRequest request, HttpSession session, Model model) {
		log.debug("<<상품등록>> : " + goodsVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		goodsService.insertGoods(goodsVO);
		
		model.addAttribute("accessMsg", "상품등록이 완료되었습니다.");
		model.addAttribute("accessUrl", request.getContextPath() + "/goods/goodsList.do");
		
		return "common/notice";
	}
	
	/*==========================
	 * 굿즈 이미지
	 *==========================*/
	//이미지 등록
	@RequestMapping("/goods/updateGoodsPhoto.do")
	@ResponseBody
	public Map<String, String> updateGoodsPhoto(GoodsVO goodsVO){
		Map<String, String> mapJson = new HashMap<String, String>();
		
		goodsService.updateGoods(goodsVO);
		mapJson.put("result", "success");
		
		return mapJson;
	}
	
	/*==========================
	 * 굿즈 목록
	 *==========================*/
	@RequestMapping("/goods/goodsList.do")
	public ModelAndView getGoodsList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
									 @RequestParam(value="order", defaultValue="1") int order,
									 String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체|검색 레코드 수
		int count = goodsService.selectGoodsRowCount(map);
		
		log.debug("<<Goods - count>> : " + count);
		
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
	
}
