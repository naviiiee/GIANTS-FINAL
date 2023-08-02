package kr.spring.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.spring.ticket.service.TicketService;
import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;
import kr.spring.ticket.vo.SeatVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	@Autowired
	private TicketService ticketService;
	
	// javaBean(VO) 초기화
	@ModelAttribute
	public GameVO initGame() { return new GameVO(); }
	
	@ModelAttribute
	public GradeVO initGrade() { return new GradeVO(); }

	@ModelAttribute
	public SeatVO initSeat() { return new SeatVO(); }
	
	/* ----- [Ticket] 메인(요금안내 및 티켓예매 버튼 활성화) -----*/
	@RequestMapping("/ticket/ticketInfo.do")
	public String ticketInfo() { return "ticketInfo"; }
	
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
	
	/* ----- [Grade] 좌석등급 상세 -----*/
	@RequestMapping("/ticket/seatList.do")
	public ModelAndView seatList(@RequestParam int grade_num) {
		log.debug("<<등급상세>> : " + grade_num);
		
		GradeVO grade = ticketService.selectGrade(grade_num);
		
		return new ModelAndView("seatList", "grade", grade);
	}
	
	/* [Seat] 좌석정보 등록 */
	@PostMapping("/ticket/seatWrite.do")
	public String seatSubmit(@Valid SeatVO seatVO, BindingResult result) {
		log.debug("<<좌석정보등록>> : " + seatVO);
		
		if(result.hasErrors()) { return "seatList"; }
		
		ticketService.insertSeat(seatVO);
		
		return "redirect:/ticket/seatList.do";
	}
	
	/* ----- [Game] 경기목록 -----*/
	@RequestMapping("/ticket/gameList.do")
	public String gameList(GameVO gameVO, Model model) {
		int count = ticketService.selectRowCount(gameVO);
		
		List<GameVO> list = ticketService.selectTicketGameList(gameVO);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "gameList";
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
	public String gameUpdateSubmit(@Valid GameVO gameVO, BindingResult result) {
		log.debug("<<경기상태 수정>> : " + gameVO);
		
		if(result.hasErrors()) { return "gameUpdate"; }
		
		ticketService.updateGame(gameVO);
		
		return "redirect:/ticket/gameList.do";
	}
	
	
}
