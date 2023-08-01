package kr.spring.trading.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.trading.service.TradingService;
import kr.spring.trading.vo.TradingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TradingController {
	@Autowired
	private TradingService tradingService;
	
	/*=================
	 * 자바빈(VO) 초기화
	 * ===============*/
	@ModelAttribute
	public TradingVO initCommand() {
		return new TradingVO();
	}
	
	/*=================
	 * 게시판 글 등록
	 * ===============*/
	//등록 폼
	@GetMapping("/trading/tradingWrite.do")
	public String form() {
		return "tradingWrite";  //tiles 설정의 식별자
	}
	
	/*=================
	 * 게시판 목록
	 * ===============*/
	@RequestMapping("/trading/tradingList.do")
	public ModelAndView getList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tradingList"); //tiles 설정의 식별자
		
		return mav;
	}
	

}
