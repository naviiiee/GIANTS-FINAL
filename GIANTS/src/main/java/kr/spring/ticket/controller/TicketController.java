package kr.spring.ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	/* ----- [Ticket] 메인(요금안내 및 티켓예매 버튼 활성화) -----*/
	@RequestMapping("/ticket/ticketInfo.do")
	public String ticketInfo() { return "ticketInfo"; }
	
	/* ----- [Ticket] 경기 등록 -----*/
	// 등록 form
	@GetMapping("/ticket/gameWrite.do")
	public String gameForm() { return "gameWrite"; }
}
