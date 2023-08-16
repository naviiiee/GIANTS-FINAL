package kr.spring.food.controller;

import java.util.ArrayList;
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

import kr.spring.food.service.FoodService;
import kr.spring.food.vo.F_cartVO;
import kr.spring.food.vo.FoodVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.CompanyDetailVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private MemberService memberService;
	
	
	@ModelAttribute
	public FoodVO initCommand() {
		return new FoodVO();
	}
	
	/*	====================
	 *		이미지 출력
	 * 	====================*/
	@RequestMapping("/food/imageView.do")
	public ModelAndView viewImage(@RequestParam int food_num,
			                      @RequestParam int food_type) {
		
		FoodVO foodVO = 
				foodService.selectFood(food_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		if(food_type==1) {//photo1
			mav.addObject("imageFile", foodVO.getFood_photo1());
			mav.addObject("filename", foodVO.getFood_photo1_name());
		}else if(food_type==2) {//photo2
			mav.addObject("imageFile", foodVO.getFood_photo2());
			mav.addObject("filename", foodVO.getFood_photo2_name());
		}
		return mav;
	}
	
	/*	=======================
	 *		매장 목록 페이지 
	 * 	=======================*/
	@RequestMapping("/food/foodList.do")
	@ResponseBody
	public ModelAndView foodList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
								 @RequestParam(value = "comp_cate", defaultValue = "1") int comp_cate,
								 @RequestParam(value = "sort", defaultValue = "1") String sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("comp_cate", comp_cate);
		map.put("sort", sort);
		int count = foodService.selectCompRowCount(map);
		
		//log.debug("매장 목록페이지 진입 >> : comp_cate : " + comp_cate + " sort : " + sort);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 5, 5, "foodList.do");
		
		List<CompanyDetailVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = foodService.selectCompList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("foodList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		mav.addObject("sort", sort);
		mav.addObject("comp_cate", comp_cate);
		return mav;
	}
	
	/*	============================
	 *		기업 상세페이지 - 식품 메뉴
	 * 	============================*/
	@RequestMapping("/food/foodCompDetailMenu.do")
	public ModelAndView foodCompDetail(@RequestParam String comp_num,
									   @RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
									   HttpSession session) {
		//log.debug("기업상세 페이지 진입 >>> comp_num : " + comp_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		//log.debug("유저 정보 에서 기업정보 추출 >> : "+ user);
		
		CompanyDetailVO comp = foodService.selectComp(comp_num);
		int count = foodService.selectRowCount(comp_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		PagingUtil page = new PagingUtil(currentPage, count, 8, 5, "foodCompDetailMenu.do");
		
		List<FoodVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			map.put("comp_num", comp_num);
			
			list = foodService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("foodCompDetailMenu");
		mav.addObject("comp", comp);
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		return mav;
	}
	
	/*	============================
	 *		기업 상세페이지 - 기업 리뷰
	 * 	============================*/
	@RequestMapping("/food/foodCompDetailReview.do")
	public ModelAndView foodCompDetailReview(@RequestParam String comp_num,
									   @RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {
		//log.debug("기업상세 페이지 진입 >>> comp_num : " + comp_num);
		CompanyDetailVO comp = foodService.selectComp(comp_num);
		int count = foodService.selectRowCount(comp_num);
		
		PagingUtil page = new PagingUtil(currentPage, count, 5, 5, "foodCompDetailReview.do");
		
		List<FoodVO> list = null;
		if (count > 0) {
			//map.put("start", page.getStartRow());
			//map.put("end", page.getEndRow());
			
			//list = foodService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("foodCompDetailReview");
		mav.addObject("comp", comp);
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		return mav;
	}
	
	/*	========================================
	 *		기업 상세 -> 기업 수정 페이지 
	 * 	========================================*/
	@RequestMapping("/food/fixCompFoodList.do")
	public ModelAndView foodFixCompDetail(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
										  HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		CompanyDetailVO comp = foodService.selectComp(user.getCompanyDetailVO().getComp_num());
		int count = foodService.selectRowCount(comp.getComp_num());
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 5, 5, "fixCompFoodList.do");
		
		List<FoodVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			map.put("comp_num", comp.getComp_num());
			
			list = foodService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("fixCompFoodList");
		mav.addObject("comp", comp);
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/*	==========================
	 *		식품 추가/등록 페이지
	 * 	==========================*/
	@GetMapping("/food/addNewFood.do")
	public String formAddNewFood() {
		return "addNewFood";
	}
	
	@PostMapping("/food/addNewFood.do")
	public String submitAddNewFood(@Valid FoodVO vo, BindingResult result,
									Model model, HttpServletRequest request,
									HttpSession session) {
		//log.debug("<< 식품 추가/등록 POST 작동 >> : " + vo);
		
		
		//상품 이미지 유효성 체크
		//MultipartFIle -> byte[]로 변환한 경우, 파일을 업로드 하지 않으면
		//byte[]은 생성되고 length는 0이 됨. 즉, null이 아니다.
		if (vo.getFood_photo1().length == 0) 
			result.rejectValue("food_photo1", "required");
		if (vo.getFood_photo2().length == 0) 
			result.rejectValue("food_photo2", "required");
		
		if(vo.getFood_photo1().length >= 10*1024*1024) 
			result.rejectValue("food_photo1", "limitUploadSize", new Object[] {"10MB"}, null);
		if(vo.getFood_photo2().length >= 10*1024*1024) 
			result.rejectValue("food_photo2", "limitUploadSize", new Object[] {"10MB"}, null);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			return formAddNewFood();
		}
		
		//log.debug("<< 사업자 등록번호 세팅 전 >>");
		//사업자 등록 번호 VO에 세팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		vo.setComp_num(user.getCompanyDetailVO().getComp_num());
		
		//log.debug("<< 사업자 등록번호 완료 상품 등록 시작 >>");
		
		//상품 등록 sql 시작
		foodService.insertFood(vo);
		
		//View에 표시할 메세지
		model.addAttribute("message", "새 식품등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/food/fixCompFoodList.do");
		
		return "common/resultView";
	}
	
	/*	==========================
	 *		식품 수정 페이지
	 * 	==========================*/
	@GetMapping("/food/fixFood.do")
	public String formFixFood(@RequestParam int food_num, Model model) {
		
		FoodVO foodVO = foodService.selectFood(food_num);
		model.addAttribute("foodVO", foodVO);
		
		return "fixFood";
	}
	@PostMapping("/food/fixFood.do")
	public String submitFixFood(@Valid FoodVO vo, BindingResult result,
								 Model model, HttpServletRequest request,
								 HttpSession session) {
		
		if (vo.getFood_photo1().length == 0) 
			result.rejectValue("food_photo1", "required");
		if (vo.getFood_photo2().length == 0) 
			result.rejectValue("food_photo2", "required");
		
		if(vo.getFood_photo1().length >= 10*1024*1024) 
			result.rejectValue("food_photo1", "limitUploadSize", new Object[] {"10MB"}, null);
		if(vo.getFood_photo2().length >= 10*1024*1024) 
			result.rejectValue("food_photo2", "limitUploadSize", new Object[] {"10MB"}, null);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			return formFixFood(vo.getFood_num(), model);
		}
		//upload 이미지 파일들이 모두 동일할 경우 기존 데이터로 세팅
		FoodVO db_foodVO = foodService.selectFood(vo.getFood_num());
		if (vo.getFood_photo1_name()==db_foodVO.getFood_photo1_name()) {
			vo.setFood_photo1(db_foodVO.getFood_photo1());
			vo.setFood_photo1_name(db_foodVO.getFood_photo1_name());
		}
		if (vo.getFood_photo2_name()==db_foodVO.getFood_photo2_name()) {
			vo.setFood_photo2(db_foodVO.getFood_photo1());
			vo.setFood_photo2_name(db_foodVO.getFood_photo1_name());
		}
		
		log.debug("푸드 업데이트 수행");
		foodService.fixFood(vo);
		
		//View에 표시할 메세지
		model.addAttribute("message", "수정이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/food/fixCompFoodList.do");
				
		return "common/resultView";
	}
	
	/*	==========================
	 *		식품 삭제 페이지
	 * 	==========================*/
	@PostMapping("/food/deleteFood.do")
	public String submitDeleteFood(@RequestParam int food_num) {
		//log.debug("<< 식품 삭제 수행중 >> : " + food_num);
		
		//식품 삭제
		foodService.deleteFood(food_num);
		
		return "redirect:/food/fixCompFoodList.do";
	}
	
	
	/*	==========================
	 *		식품 상세 페이지
	 * 	==========================*/
	//폼 호출
	@RequestMapping("/food/foodDetail.do")
	public String formFoodDetail(@RequestParam int food_num,
							 @RequestParam String comp_num,
							 Model model) {
		FoodVO food = foodService.selectFood(food_num);
		CompanyDetailVO comp = memberService.selectCompanyDetail(comp_num);
		model.addAttribute("food", food);
		model.addAttribute("comp", comp);
		
		return "foodDetail";
	}
	
	/*	==========================
	 *		장바구니 담기 (foodDetail.js)스크립트
	 * 	==========================*/
	//장바구니 아이템 체크
	@RequestMapping("/food/foodCartCheck.do")
	@ResponseBody
	public Map<String,Object> foodCartCheck(@RequestParam int food_num,
											@RequestParam String comp_num,
											HttpSession session){
		//log.debug("<< 장바구니 아이템 체크 동작중 >> ");
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			List<F_cartVO> db_cart = new ArrayList<F_cartVO>();
			boolean check = false;
			//1.현재 로그인한 회원의 장바구니에 아이템이 존재하는지 조회
			db_cart = foodService.selectF_cartList(user.getMem_num());
			//log.debug("장바구니 리스트 크기"+db_cart.size());
			if (db_cart.size() != 0) {
				//  2.장바구니에 아이템이 있으면 해당 아이템의 comp_num이 
				//	  현재 등록해야 하는 식품의 comp_num과 다른지 확인
				for (F_cartVO cart : db_cart) {
					//장바구니에 담겨있는 아이템들과 현재 넣을 아이템의 매장번호가 다를경우
					log.debug("DB내에 저장된 식품의 comp_num : " +cart.getFoodVO().getComp_num() + 
							",\n     유저가 선택한 식품의 comp_num : " + comp_num);
					if (!cart.getFoodVO().getComp_num().equals(comp_num)) {
						check = true;
						break;
					}
				}// end of for()----
			}
			if (check) {
				//장바구니 안에 다른 매장의 아이템이 있음을 알림
				mapJson.put("result", "MismatchCompany");
			}else {
				//장바구니가 비워져 있거나 동일상품임을 알림
				log.debug("장바구니 체크 Empty 진입");
				mapJson.put("result", "Empty");
			}
		}
		return mapJson;
	}
	//장바구니 모두 비우기
	@RequestMapping("/food/foodEmptyCart.do")
	@ResponseBody
	public Map<String,Object> foodEmptyCart(HttpSession session){
		//log.debug("<< 장바구니 모두 비우기 동작중 >> ");
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//모두 비우기 진행
			foodService.deleteF_cart(user.getMem_num());
			mapJson.put("result", "success");
		}
		return mapJson;
	}
	//장바구니 아이템 추가
	@RequestMapping("/food/foodAddCart.do")
	@ResponseBody
	public Map<String,Object> foodAddCart(F_cartVO f_cartVO,
										  //@RequestParam String comp_num,
										  HttpSession session){
		//log.debug("<< 장바구니 아이템 추가 동작중 >> :" + f_cartVO);
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			f_cartVO.setMem_num(user.getMem_num());
			F_cartVO db_cart = foodService.selectF_cart(f_cartVO);
			
			if (db_cart==null) {
				//등록된 동일 상품이 없는 경우
				//장바구니에 상품 등록
				foodService.insertF_cart(f_cartVO);
				mapJson.put("result", "success");
			}else {
				//등록된 동일 상품이 있음
				//재고수를 구하기 위해서 상품 정보 호출
				FoodVO db_food = foodService.selectFood(db_cart.getFood_num());
				
				//구매수량 합산
				int order_quantity = db_cart.getF_cart_quantity() + f_cartVO.getF_cart_quantity();
				
				if (db_food.getFood_quantity() < order_quantity) {
					//재고 수량보다 장바구니에 담을 수량이 더 많을 경우
					mapJson.put("result", "overquantity");
				}else {
					//기존 장바구니 상품 업데이트
					f_cartVO.setF_cart_quantity(order_quantity);
					//기존 장바구니 업데이트
					foodService.updateF_cartByFood_num(f_cartVO);
					mapJson.put("result", "success");
				}
			}
		}
		return mapJson;
	}
	
	/*	==========================
	 *		장바구니 페이지
	 * 	==========================*/
	//폼 호출
	@RequestMapping("/food/fcart/foodUserCartList.do")
	public ModelAndView formFoodUserCartList(HttpSession session,
									   Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//카트 목록을 mem_num을 통해서 조회하여 담아 넘김
		List<F_cartVO> list = null;
		list = foodService.selectF_cartList(user.getMem_num());
		
		//log.debug("내 장바구니 목록 확인하기 >>> " + list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("foodUserCartList");
		
		return mav;
	}
	
	//장바구니 수량 변경
	@RequestMapping("/food/fcart/changeCartQuantity.do")
	@ResponseBody
	public Map<String,Object> changeCartQuantity(F_cartVO f_cartVO,
										  HttpSession session){
		//log.debug("<< 장바구니 수량 변경 진행중 >> :" + f_cartVO);
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//구매하고자 하는 상품의 재고 확인하기
			FoodVO food = foodService.selectFood(f_cartVO.getFood_num());
			if (food.getFood_status()==1) {
				//판매중지 상품
				mapJson.put("result", "stopSell");
			}else if (food.getFood_quantity() < f_cartVO.getF_cart_quantity()) {
				//재고가 부족함
				mapJson.put("result", "noQuantity");
			}else {
				//장바구니 수량 변경 진행
				log.debug("<< 장바구니 수량 변경 진행중 >> :" + f_cartVO);
				f_cartVO.setMem_num(user.getMem_num());
				foodService.updateF_cartByFood_num(f_cartVO);
				mapJson.put("result", "success");
			}
		}
		return mapJson;
	}

	
	//장바구니 삭제버튼
	@RequestMapping("/food/fcart/deleteOneCart.do")
	@ResponseBody
	public Map<String,Object> deleteOneCart(@RequestParam int cart_num,
										  HttpSession session){
		log.debug("<< 장바구니 삭제 수행중 >> :" + cart_num);
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			foodService.deleteOneF_cart(cart_num);
			mapJson.put("result", "success");
		}
		return mapJson;
	}
	
	
	
	
	
	
	
	
}
