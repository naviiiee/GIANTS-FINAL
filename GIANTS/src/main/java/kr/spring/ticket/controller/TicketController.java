package kr.spring.ticket.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.ticket.service.TicketService;
import kr.spring.ticket.vo.TicketGameVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	@Autowired
	private TicketService ticketService;
	
	// javaBean(VO) 초기화
	@ModelAttribute
	public TicketGameVO initCommand() { return new TicketGameVO(); }
	
	/* ----- [Ticket] 메인(요금안내 및 티켓예매 버튼 활성화) -----*/
	@RequestMapping("/ticket/ticketInfo.do")
	public String ticketInfo() { return "ticketInfo"; }
	
	/* ----- [Ticket] 경기목록 -----*/
	@RequestMapping("/ticket/gameList.do")
	public String gameList() { return "gameList"; }
	
	/* ----- [Ticket] 경기 등록 -----*/
	// 등록 form
	@GetMapping("/ticket/gameWrite.do")
	public String gameForm() { return "gameWrite"; }
	
	// 전송된 데이터 처리
	@PostMapping("/ticket/gameWrite.do")
	public String gameSubmit(@Valid TicketGameVO ticketGameVO, BindingResult result) {
		log.debug("<<경기등록>> : " + ticketGameVO);
		
		if(result.hasErrors()) { return gameForm(); }
		
		ticketService.insertGame(ticketGameVO);
				
		return "redirect:/ticket/gameList.do";
	}
}
