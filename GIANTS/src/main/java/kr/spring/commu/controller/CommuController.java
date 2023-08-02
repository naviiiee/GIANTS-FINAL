package kr.spring.commu.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.commu.service.CommuService;
import kr.spring.commu.vo.CommuFavVO;
import kr.spring.commu.vo.CommuVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommuController {
	@Autowired
	private CommuService commuService;
	
	/*=== 자바빈 초기화 ===*/
	@ModelAttribute
	public CommuVO initCommand() {
		return new CommuVO();
	}
	
	/*=== 커뮤니티 글 등록 ===*/
	//등록 폼
	@GetMapping("/commu/write.do")
	public String form() {
		return "commuWrite";
	}
	
	//전송된 데이터 처리
	@PostMapping("/commu/write.do")
	public String submit(@Valid CommuVO commuVO, BindingResult result, 
						 HttpServletRequest request, HttpSession session, Model model) {
		
		log.debug("<<커뮤니티 글쓰기>> : " + commuVO);
		
		//유효성 체크 결과 오류 발생 시 폼을 다시 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//회원 번호 세팅 (좀 길지만 한 번만 쓸거라 따로 변수 안 만들고 진행)
		//세션에 저장해놓은 user를 MemberVO로 다운캐스팅, 거기서 mem_num을 가져와서 boardVO의 mem_num에 set
		commuVO.setMem_num(((MemberVO)session.getAttribute("user")).getMem_num());
		
		//IP 셋팅
		commuVO.setCommu_ip(request.getRemoteAddr());
		
		//글 등록 처리
		commuService.insertCommu(commuVO);
		
		model.addAttribute("message", "글쓰기가 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/commu/list.do");
		
		return "common/resultView";
		
	}
	
	/*=== 커뮤니티 목록 ===*/
	@RequestMapping("/commu/list.do")
	public ModelAndView getList(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								@RequestParam(value="order", defaultValue="1") int order,
								String keyfield, String keyword){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield",keyfield);
		map.put("keyword",keyword);
		
		//전체or검색 레코드 수
		int count = commuService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"list.do","&order="+order);
		
		List<CommuVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = commuService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
	
	return mav;
	}
	
	/*=== 커뮤니티 글 수정 ===*/
	
	//수정 폼 호출
	@GetMapping("/commu/update.do")
	public String formUpdate(@RequestParam int commu_num, Model model) {
		CommuVO commuVO = commuService.selectCommu(commu_num);
		model.addAttribute("commuVO", commuVO);
		 
		return "commuModify";
	}
	
	//전송된 데이터 처리
	@PostMapping("/commu/update.do")
	public String submitUpdate(@Valid CommuVO commuVO,
								BindingResult result,
								HttpServletRequest request,
								Model model) {
		log.debug("<<글 수정 - CommuVO>> : " + commuVO);
		
		//유효성 체크 결과 오류가 있으면 폼을 다시 호출
		if(result.hasErrors()) {
			return "commuModify";
		}
		
		//ip 세팅
		commuVO.setCommu_ip(request.getRemoteAddr());
		
		//글 수정
		commuService.updateCommu(commuVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 수정을 완료했습니다.");
		model.addAttribute("url", request.getContextPath()+"/commu/detail.do?commu_num="+commuVO.getCommu_num());
		
		return "common/resultView";
	}
	
	/*=== 커뮤니티 글 삭제 ===*/
	@RequestMapping("/commu/delete.do")
	public String submitDelete(@RequestParam int commu_num) {
		log.debug("<<글 삭제 = commu_num>> : " + commu_num);
		
		//글 삭제
		commuService.deleteCommu(commu_num);
		
		return "redirect:/commu/list.do";
	}
	
	/*=== 커뮤니티 글 좋아요 ===*/
	//부모글 좋아요 읽어오기
	@RequestMapping("/commu/getFav.do")
	@ResponseBody //ajax통신 이용
	public Map<String,Object> getFav(CommuFavVO fav, HttpSession session){
		log.debug("<<커뮤니티 좋아요 읽기>> : " + fav);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		//로그인 회원 정보 가져옴
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {//로그인x
			mapJson.put("status", "noFav");
		}else {//로그인o
			//로그인된 회원 번호 세팅
			fav.setMem_num(user.getMem_num());
			
			CommuFavVO commuFav = commuService.selectFav(fav);
			if(commuFav != null) {//로그인 회원이 헤당 글에 좋아요 누른 데이터가 있는 경우
				mapJson.put("status", "yesFav");
			}else {//로그인 회원이 해당 좋아요 누른 데이터가 없는 경우
				mapJson.put("status", "noFav");
			}
		}
		mapJson.put("count", commuService.selectFavCount(fav.getCommu_num()));
		
		
		return mapJson;
	}
	
	//부모글 좋아요 등록&삭제
		@RequestMapping("/commu/writeFav.do")
		@ResponseBody
		public Map<String,Object> writeFav(CommuFavVO fav, HttpSession session){
			log.debug("<<게시판 좋아요 등록/삭제 - CommuFavVO>> : " + fav);
			
			Map<String,Object> mapJson = new HashMap<String,Object>();
			
			//로그인 회원 정보 가져옴
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user == null) { //로그인 X
				mapJson.put("result", "logout");
			}else { //로그인 O
				//로그인된 회원 번호 세팅
				fav.setMem_num(user.getMem_num());
				
				CommuFavVO commuFav = commuService.selectFav(fav);
				if(commuFav != null) { //로그인 회원이 헤당 글에 좋아요 누른 데이터가 있는 경우 -> 삭제
					commuService.deleteFav(commuFav.getCommu_like_num());
					mapJson.put("result", "success");
					mapJson.put("status", "noFav");
				}else { //로그인 회원이 헤당 글에 좋아요 누른 데이터가 없는 경우 -> 등록
					commuService.insertFav(fav);
					mapJson.put("result", "success");
					mapJson.put("status", "yesFav");
				}
				mapJson.put("count", commuService.selectFavCount(fav.getCommu_num()));
			}
	
			return mapJson;
		}
		
		/*=== 댓글 등록 ===*/
		
		
		/*=== 댓글 목록 ===*/
		
		
		/*=== 댓글 삭제 ===*/
		
		
		/*=== 댓글 수정 ===*/
		
		
		
	
}
