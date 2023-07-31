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

import kr.spring.ticket.service.TicketService;
import kr.spring.ticket.vo.GameVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	@Autowired
	private TicketService ticketService;
	
	// javaBean(VO) 초기화
	@ModelAttribute
	public GameVO initCommand() { return new GameVO(); }
	
	/* ----- [Ticket] 메인(요금안내 및 티켓예매 버튼 활성화) -----*/
	@RequestMapping("/ticket/ticketInfo.do")
	public String ticketInfo() { return "ticketInfo"; }
	
	/* ----- [Ticket] 경기목록 -----*/
	@RequestMapping("/ticket/gameList.do")
	public String gameList(GameVO gameVO, Model model) {
		int count = ticketService.selectRowCount(gameVO);
		
		List<GameVO> list = ticketService.selectTicketGameList(gameVO);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "gameList";
	}
	
	/* ----- [Ticket] 경기 등록 -----*/
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
	
	
}
