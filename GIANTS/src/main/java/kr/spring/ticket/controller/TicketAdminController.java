package kr.spring.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import kr.spring.ticket.service.TicketService;
import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;
import kr.spring.ticket.vo.SeatVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketAdminController {
	@Autowired
	private TicketService ticketService;
	
	// javaBean(VO) 초기화
	@ModelAttribute
	public GameVO initGame() { return new GameVO(); }
	@ModelAttribute
	public GradeVO initGrade() { return new GradeVO(); }
	
	/* ----- [Grade] 좌석등급 목록 -----*/
	@RequestMapping("/ticket/gradeList.do")
	public String gradeList(GradeVO gradeVO, Model model) {
		int count = ticketService.selectGradeCount(gradeVO);
		
		List<GradeVO> list = ticketService.selectGradeList(gradeVO);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "gradeList";
	}
	
	/* ----- [Grade] 좌석등급 등록 -----*/
	// 등록 form
	@GetMapping("/ticket/gradeWrite.do")
	public String gradeForm() { return "gradeWrite"; }
	
	// 전송된 데이터 처리
	@PostMapping("/ticket/gradeWrite.do")
	public String gradeSubmit(@Valid GradeVO gradeVO, BindingResult result) {
		log.debug("<<등급등록>> : " + gradeVO);
		
		if(result.hasErrors()) { return gradeForm(); }
		
		ticketService.insertGrade(gradeVO);
		
		return "redirect:/ticket/gradeList.do";
	}
	
	/* ----- [Grade] 좌석등급 수정 -----*/
	// 수정 form
	@GetMapping("/ticket/gradeUpdate.do")
	public String gradeUpdateForm(@RequestParam int grade_num, Model model) {
		GradeVO gradeVO = ticketService.selectGrade(grade_num);
		model.addAttribute(gradeVO);
		
		return "gradeUpdate";
	}
	
	// 전송된 데이터 처리
	@PostMapping("/ticket/gradeUpdate.do")
	public String gradeUpdateSubmit(@Valid GradeVO gradeVO, BindingResult result, HttpServletRequest request, Model model) {
		log.debug("<<경기상태 수정>> : " + gradeVO);
		
		if(result.hasErrors()) { return "gradeUpdate"; }
		
		ticketService.updateGrade(gradeVO);
		
		model.addAttribute("message", "수정 완료");
		model.addAttribute("url", request.getContextPath() + "/ticket/gradeList.do");
		
		return "common/resultView"; 
	}
	
	/* ----- [Grade] 좌석등급 삭제 -----*/
	@RequestMapping("/ticket/gradeDelete.do")
	public String gradeDelete(@RequestParam int grade_num) {
		log.debug("<<등급 삭제>> : " + grade_num);
		
		ticketService.deleteGrade(grade_num);
		
		return "redirect:/ticket/gradeList.do";
	}
	
	/* ----- [Seat] 좌석정보 등록 ----- */
	@PostMapping("/ticket/seatWrite.do")
	public String seatSubmit(SeatVO seatVO, @RequestParam int grade_num) {
		log.debug("<<좌석정보등록>> : " + seatVO);
		
		seatVO.setGrade_num(grade_num);
		
		ticketService.insertSeat(seatVO);
		
		return "redirect:/ticket/seatList.do?grade_num=" + grade_num;
	}
	
	/* ----- [Seat] 좌석정보 상세 -----*/
	@RequestMapping("/ticket/seatList.do")
	public ModelAndView seatList(@RequestParam int grade_num, SeatVO seatVO) {
		log.debug("<<등급상세>> : " + grade_num);
		
		GradeVO grade = ticketService.selectGrade(grade_num);
		
		int count = ticketService.selectSeatCount(seatVO);
		
		List<SeatVO> list = ticketService.selectSeatList(seatVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("seatList");
		mav.addObject("grade", grade);
		mav.addObject("count", count);
		mav.addObject("list", list);
		
		return mav;
	}
	
	/* ----- [Seat] 좌석정보 수정 -----*/
	@PostMapping("/ticket/seatUpdate.do")
	public String seatUpdateSubmit(SeatVO seatVO, @RequestParam int seat_num, @RequestParam int grade_num) {
		log.debug("<<좌석정보 수정>> : " + seatVO);
		
		ticketService.updateSeat(seatVO);
		
		return "redirect:/ticket/seatList.do?grade_num=" + grade_num;
	}
	
	/* ----- [Game] 경기 등록 -----*/
	// 등록 form
	@GetMapping("/ticket/gameWrite.do")
	public String gameForm() { return "gameWrite"; }
	
	// 전송된 데이터 처리
	@PostMapping("/ticket/gameWrite.do")
	public String gameSubmit(@Valid GameVO gameVO, BindingResult result) {
		log.debug("<<경기등록>> : " + gameVO);
		
		if(result.hasErrors()) { return gameForm(); }
		
		ticketService.insertGame(gameVO);
				
		return "redirect:/ticket/gameList.do";
	}
	
	/* ----- [Game] 경기 수정 -----*/
	// 등록 form
	@GetMapping("/ticket/gameUpdate.do")
	public String gameUpdateForm(@RequestParam int game_num, Model model) {
		GameVO gameVO = ticketService.selectGame(game_num);
		model.addAttribute(gameVO);
		
		return "gameUpdate";
	}
	
	// 전송된 데이터 처리
	@PostMapping("/ticket/gameUpdate.do")
	public String gameUpdateSubmit(@Valid GameVO gameVO, BindingResult result, HttpServletRequest request, Model model) {
		log.debug("<<경기상태 수정>> : " + gameVO);
		
		if(result.hasErrors()) { return "gameUpdate"; }
		
		ticketService.updateGame(gameVO);
		
		model.addAttribute("message", "수정 완료");
		model.addAttribute("url", request.getContextPath() + "/ticket/gameList.do");
		
		return "common/resultView";
	}
}
