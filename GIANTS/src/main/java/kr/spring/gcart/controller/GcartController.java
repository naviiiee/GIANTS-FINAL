package kr.spring.gcart.controller;

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
import org.springframework.web.servlet.ModelAndView;


//import com.sun.tools.javac.util.StringUtils;

import kr.spring.gcart.service.GcartService;
import kr.spring.gcart.vo.GcartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GcartController {
	@Autowired
	private GcartService cartService;

	/*
	 * ======================== 자바빈(VO) 초기화 ========================
	 */
	/*@ModelAttribute
	public GcartVO initCommand() {
		return new GcartVO();
	}*/


	
	/*
	 * ======================== 장바구니 목록 조회 ========================
	 */
	@RequestMapping("/gorder/goods_cart.do")
	public String cart (HttpSession session, Model model){
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인 후 이용가능
			return "redirect:/member/loginForm.do";
		}
		int all_total = cartService.getTotalByMem_num(user.getMem_num());
		
		
		List<GcartVO> list = null;
		if(all_total > 0) {
			list = cartService.getListCart(user.getMem_num());
		}
		model.addAttribute("all_total", all_total);
		model.addAttribute("list", list);
		
		return "goods_cart";

	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// end Controller
