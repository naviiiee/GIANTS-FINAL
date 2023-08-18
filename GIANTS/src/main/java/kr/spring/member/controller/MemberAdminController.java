package kr.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.CompanyDetailVO;
import kr.spring.member.vo.MemberDetailVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberAdminController {
	@Autowired
	private MemberService memberService;
	
	/*=====================
	 * 관리자 : 회원목록
	 *=====================*/
	@RequestMapping("/member/admin_list.do")
	public ModelAndView getList(
			@RequestParam(value="pageNum",
						  defaultValue="1") int currentPage,
											String keyfield,
											String keyword,
											HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체/검색 레코드 수
		int count = memberService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page =
				new PagingUtil(keyfield,keyword,currentPage,
							   count,10,10,"admin_list.do");
		MemberVO user1 = (MemberVO)session.getAttribute("user1");
		MemberDetailVO user2 = (MemberDetailVO)session.getAttribute("user2");
		CompanyDetailVO user3 = (CompanyDetailVO)session.getAttribute("user3");
		
		List<MemberVO> list = null;
		
		log.debug("<<user 체크>> : " + user1);
		log.debug("<<user 체크>> : " + user2);
		log.debug("<<user 체크>> : " + user3);
		
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = memberService.selectList(map);
		}
		log.debug("<<memberDetailVO 체크>> : " + list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_memberList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/*=====================
	 * 관리자 : 회원등급변경
	 *=====================*/
	//일반회원 수정폼
	@GetMapping("/member/admin_updateMem.do")
	public String form(@RequestParam int mem_num, Model model) {
		MemberVO memberVO = memberService.selectMember(mem_num);
		model.addAttribute("memberVO", memberVO);
		return "admin_memberModify";
	}
	//전송된 데이터 처리
	@PostMapping("/member/admin_updateMem.do")
	public String submit(MemberVO memberVO, Model model,
						 HttpServletRequest request) {
		
		log.debug("<<관리자 회원권한 수정>> : " + memberVO);
		
		//회원권한 수정
		memberService.updateByAdmin(memberVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "회원등급 수정 완료");
		model.addAttribute("url", request.getContextPath()
								  + "/member/admin_updateMem.do?mem_num="
								  + memberVO.getMem_num());
		
		return "common/resultView";
	}
	
	//기업회원 수정폼
	@GetMapping("/member/admin_updateComp.do")
	public String formComp(@RequestParam int mem_num, Model model) {
		MemberVO companyVO = memberService.selectCompany(mem_num);
		model.addAttribute("memberVO", companyVO);
		return "admin_companyModify";
	}
	//전송된 데이터 처리
	@PostMapping("/member/admin_updateComp.do")
	public String submitComp(MemberVO memberVO, Model model,
						 HttpServletRequest request) {
		
		log.debug("<<관리자 회원권한 수정>> : " + memberVO);
		
		//회원권한 수정
		memberService.updateByAdmin(memberVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "회원등급 수정 완료");
		model.addAttribute("url", request.getContextPath()
								  + "/member/admin_updateComp.do?mem_num="
								  + memberVO.getMem_num());
		
		return "common/resultView";
	}
	
	/* === 마이페이지 : 관리자
	=======================*/
	//티켓관리
	@RequestMapping("/member/adminMypageTicket.do")
	public String adminMypageTicket(HttpSession session, Model model) {
		
		return "adminMypageTicket";
	}
	//굿즈관리
	@RequestMapping("/member/adminMypageGoods.do")
	public String adminMypageGoods(HttpSession session, Model model) {
		
		return "adminMypageGoods";
	}
	//매출관리
	@RequestMapping("/member/adminMypageSaleManage.do")
	public String adminMypageSaleManage(HttpSession session, Model model) {
		
		return "adminMypageSaleManage";
	}
	
} 