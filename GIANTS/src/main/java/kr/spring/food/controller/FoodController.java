package kr.spring.food.controller;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.food.service.FoodService;
import kr.spring.food.vo.FoodVO;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@ModelAttribute
	public FoodVO initCommand() {
		return new FoodVO();
	}
	
	/*	====================
	 *		목록 페이지 
	 * 	====================*/
	@RequestMapping("/food/foodList.do")
	public ModelAndView foodList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			 						String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("foodList");
		return mav;
	}
	
	/*	====================
	 *		기업 상세페이지
	 * 	====================*/
	@RequestMapping("/food/foodCompDetail.do")
	public String foodCompDetail() {
		return "foodCompDetail";
	}
	
	/*	========================================
	 *		기업 상세 -> 기업 수정 페이지 
	 * 	========================================*/
	@RequestMapping("/food/fixCompFoodList.do")
	public String foodFixCompDetail() {
		return "fixCompFoodList";
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
		log.debug("<< 식품 추가/등록 POST 작동 >> : " + vo);
		
		
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
		
		//사업자 등록 번호 VO에 세팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		vo.setComp_num(user.getCompanyDetailVO().getComp_num());
		
		//상품 등록 sql 시작
		foodService.insertFood(vo);
		
		//View에 표시할 메세지
		model.addAttribute("message", "새 식품등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/food/fixCompFoodList.do");
		
		return "common/resultView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
