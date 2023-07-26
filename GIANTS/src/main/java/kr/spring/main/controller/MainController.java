package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main() { return "redirect:/main/main.do"; }
	
	@RequestMapping("/main/main.do")
	public String main(Model model) {
		return "main";	// Tiles 설정의 식별자(main.jsp 의미 X)
	}
}
