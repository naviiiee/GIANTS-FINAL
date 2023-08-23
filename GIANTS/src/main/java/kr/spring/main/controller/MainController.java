package kr.spring.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.news.service.NewsService;
import kr.spring.news.vo.NewsVO;
import kr.spring.ticket.service.TicketService;
import kr.spring.ticket.vo.GameVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping("/")
	public String main() { return "redirect:/main/main.do"; }
	
	@RequestMapping("/main/main.do")
	public String main(GameVO gameVO, NewsVO newsVO, Model model) {
		List<GameVO> list = ticketService.selectTicketGameList(gameVO);
		List<NewsVO> newsList = newsService.selectNewsForMain(newsVO);
		
		model.addAttribute("list", list);
		model.addAttribute("newsList", newsList);
		
		return "main";	// Tiles 설정의 식별자(main.jsp 의미 X)
	}
}
