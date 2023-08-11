package kr.spring.introduce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.introduce.service.PlayerService;
import kr.spring.introduce.vo.PlayerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PlayerController {
	@Autowired
	private PlayerService playerService;
	
	/*--------------
	 * 선수 상세
	 *-------------*/
	@RequestMapping("/introduce/player.do")
	public String detail(@RequestParam int player_num, Model model) {
		
		log.debug("<<player_num>> : " + player_num);
		
		PlayerVO playerVO = playerService.selectPlayer(player_num);
		model.addAttribute("player", playerVO);
		
		return "player";
	}
	
	//이미지 출력
	@RequestMapping("/introduce/imageView.do")
	public ModelAndView viewImage(@RequestParam int player_num,
								  @RequestParam int player_type) {
		
		PlayerVO playerVO = playerService.selectPlayer(player_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		mav.addObject("imageFile",playerVO.getPlayer_photo());
		mav.addObject("filename",playerVO.getPlayer_photo());
	
		return mav;
	}
}
