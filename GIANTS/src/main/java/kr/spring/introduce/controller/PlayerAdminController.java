package kr.spring.introduce.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import kr.spring.introduce.service.PlayerService;
import kr.spring.introduce.vo.PlayerVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PlayerAdminController {
	@Autowired
	private PlayerService playerService;
	
	//자바빈 초기화
	@ModelAttribute
	public PlayerVO initCommand() {
		return new PlayerVO();
	}
	
	
	/*--------------
	 * 선수 등록
	 *-------------*/
	//등록 폼 
	@GetMapping("/introduce/admin_player.do")
	public String form() {
		return "admin_player";
	}
	
	//전송
	@PostMapping("/introduce/admin_player.do")
	public String submit(@Valid PlayerVO playerVO,
						 BindingResult result,
						 Model model,
						 HttpServletRequest request,
						 HttpSession session) {
		
		log.debug("<<선수 등록>> : " + playerVO);
		
		
		/*
		if(playerVO.getPlayer_photo().length == 0) {
			result.rejectValue("player_photo", "required");
		}
		
		
		//용량체크 (어노테이션에서 다양하게 체크 못하니까 용량체크는 컨트롤러에서 체크 해주기)
		if(playerVO.getPlayer_photo().length>=5*1024*1024) {//5MB
								//필드명,			에러코드,			에러문구에 전달할 값,	기본 에러 문구			
			result.rejectValue("player_photo", "limitUploadSize", new Object[] {"5MB"}, null);
		}
		*/
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		playerService.insertPlayer(playerVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "선수 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/introduce/admin_playerList.do");
		
		
		return "common/resultView";
	}
	
	
	/*--------------
	 * [관리자]선수 목록
	 *-------------*/
	@RequestMapping("/introduce/admin_playerList.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								String keyfield,String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		//status가 0이면 미표시(1), 표시(2) 모두 체크
		//map.put("status", 0);
		
		//전체/검색 레코드 수
		int count = playerService.selectPlayerCount(map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"admin_playerList.do");
		
		List<PlayerVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = playerService.selectPlayerList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_playerList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
}
