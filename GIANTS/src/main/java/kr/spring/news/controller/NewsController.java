package kr.spring.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.news.service.NewsService;
import kr.spring.news.vo.NewsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NewsController {
	@Autowired
	private NewsService newsService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public NewsVO initCommand() {
		return new NewsVO();
	}
	
	/*==================
	 * 뉴스 목록
	 *==================*/
	@RequestMapping("/news/newsList.do")
	public ModelAndView getList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newsList");
		
		return mav;
	}
	
	
	
	
	
}
