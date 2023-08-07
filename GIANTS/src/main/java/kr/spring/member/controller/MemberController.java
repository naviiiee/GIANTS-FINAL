package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.CompanyDetailVO;
import kr.spring.member.vo.MemberDetailVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	// 로그 대상 지정
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	/* 자바빈 초기화 */
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}

	// 아이디 중복 체크
	@RequestMapping("/member/confimId.do")
	@ResponseBody
	public Map<String, String> confimId(@RequestParam String mem_id) {
		logger.debug("<<아이디 중복 체크>> : " + mem_id);

		Map<String, String> mapAjax = new HashMap<String, String>();
		MemberVO member = memberService.selectCheckMember(mem_id);
		if (member != null) {
			// 아이디 중복
			mapAjax.put("result", "idDuplicated");
		} else {
			if (!Pattern.matches("^[A-Za-z0-9]{4,12}$", mem_id)) {
				// 패턴 불일치
				mapAjax.put("result", "notMatchPattern");
			} else {
				// 패턴 일치하면서 아이디 미중복
				mapAjax.put("result", "idNotFound");
			}
		}

		return mapAjax;
	}

	/* === 회원가입 
	=======================*/
	// 회원등급 선택 호출
	@RequestMapping("/member/registerCommon.do")
	public String form() {
		return "commonRegister";
	}

	// 일반회원가입 폼 호출
	@GetMapping("/member/registerMember.do")
	public String formMember() {
		return "memberRegister";
	}

	// 일반회원가입 처리
	@PostMapping("/member/registerMember.do")
	public String submit(@Valid MemberVO memberVO, @Valid MemberDetailVO memberdetailVO, BindingResult result,
			Model model, HttpServletRequest request, HttpSession session) {
		// logger.debug("<<일반회원가입>> : " + memberVO);

		// 일반 회원 가입시 auth 값을 2
		memberVO.setMem_auth(2);
		memberdetailVO.setMem_point(0);
		// logger.debug("<<Mem_photo>> : " + memberdetailVO);

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) { return formMember(); }

		// 정상 처리 시 회원가입
		memberService.insertMember(memberVO);
		model.addAttribute("accessMsg", "(일반)회원가입이 완료되었습니다.");

		return "common/notice";
	}

	// 기업회원가입 폼 호출
	@GetMapping("/member/registerCompany.do")
	public String formCompany() {
		return "companyRegister";
	}

	// 기업회원가입 처리
	@PostMapping("/member/registerCompany.do")
	public String submitCompany(@Valid MemberVO memberVO, @Valid CompanyDetailVO companydetailVO, BindingResult result,
			Model model) {
		// logger.debug("<<기업회원가입>> : " + memberVO);

		// 기업 회원 가입시 auth 값을 3
		memberVO.setMem_auth(3);

		/*
		 * String comp_num = companydetailVO.getComp_num_1() +
		 * companydetailVO.getComp_num_2() + companydetailVO.getComp_num_3();
		 * companydetailVO.setComp_num(comp_num);
		 */

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) { return formCompany(); }

		// 정상 처리 시 회원가입
		memberService.insertCompany(memberVO);
		model.addAttribute("accessMsg", "(기업)회원가입이 완료되었습니다.");

		return "common/notice";
	}

	/* === 로그인 
	=======================*/
	// 로그인폼
	@GetMapping("/member/login.do")
	public String formLogin() {
		return "memberLogin";
	}

	// 로그인 데이터 처리
	@PostMapping("/member/login.do")
	public String submitLogin(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
		// logger.debug("<<회원로그인>> : " + memberVO);

		// id와 passwd 필드만 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasFieldErrors("mem_id") || result.hasFieldErrors("passwd")) {
			return formLogin();
		}
		// 로그인 체크(id, 비밀번호 일치 여부 체크)
		MemberVO member = null;
		try {
			member = memberService.selectCheckMember(memberVO.getMem_id());
			logger.debug("<<인증전>> : " + member);
			boolean check = false;

			if (member != null) {
				// 비밀번호 일치 여부 체크
				check = member.isCheckedPasswd(memberVO.getPasswd());
			}
			if (check) { // 인증 성공
				// 자동 로그인 체크 시작//
				// 자동 로그인 체크 끝//
				if (member.getMem_auth() == 3) {
					// 기업일때 기업정보 세팅
					member = memberService.selectCompany(member.getMem_num());
					logger.debug("<<인증후==3>> : " + member);
				} else {
					// 기업이 아닌 회원정보 세팅 (정지, 일반, 관리자)
					member = memberService.selectMember(member.getMem_num());
					logger.debug("<<인증후==2>> : " + member);
				}
				// 인증 성공, 로그인 처리
				session.setAttribute("user", member);
				return "redirect:/main/main.do";
			}
			// 인증 실패
			throw new AuthCheckException();

		} catch (AuthCheckException e) {
			// 인증 실패로 로그인폼 호출
			if (member != null && member.getMem_auth() == 1) {
				// 정지회원 메시지 표시
				result.reject("noAuthority");
			} else {
				result.reject("invalidIdOrPassword");
			}
			logger.debug("<<인증 실패>>");
			return formLogin();
		}
	}

	/* === 로그아웃 
	=======================*/
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		// 로그아웃
		session.invalidate();

		// 자동로그인 해제 시작//
		// 자동로그인 해제 끝//

		return "redirect:/main/main.do";
	}

	/* === 마이페이지 
	=======================*/
	@RequestMapping("/member/myPage.do")
	public String myPage(HttpSession session, Model model) {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		log.debug("<<MypageUser>> : " + user);
		// 회원 정보 반환
		MemberVO member = memberService.selectMember(user.getMem_num());
		MemberVO company = memberService.selectCompany(user.getMem_num());
		log.debug("<<MypageMember>> : " + member);
		log.debug("<<MypageCompany>> : " + company);
		model.addAttribute("member", member);
		model.addAttribute("company", company);
		
		return "myPage";
	}
	
	/* === 회원정보수정
	=======================*/
	//일반회원 수정 폼 호출
	@GetMapping("/member/updateMember.do")
	public String formUpdateMember(HttpSession session,
								   Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO memberVO = memberService.selectMember(user.getMem_num());
		model.addAttribute("memberVO", memberVO);
		return "memberModify";
	}
	//전송된 데이터 처리
	@PostMapping("/member/updateMember.do")
	public String submitUpdate(@Valid MemberVO memberVO,
			                   BindingResult result,
			                   HttpSession session) {
		
		//유효성체크결과오류가 있으면 폼호출
		if(result.hasErrors()) {
			return "memberModify";
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		memberVO.setMem_num(user.getMem_num());
		
		//회원정보변경
		memberService.updateMember(memberVO);
		
		return "redirect:/member/myPage.do";
	}
	
	//기업회원 수정 폼 호출
	@GetMapping("/member/updateCompany.do")
	public String formUpdateCompany(HttpSession session,
								    Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO memberVO = memberService.selectCompany(user.getMem_num());
		model.addAttribute("memberVO", memberVO);
		return "companyModify";
	}
	//전송된 데이터 처리
	@PostMapping("/member/updateCompany.do")
	public String submitUpdateCompany(@Valid MemberVO memberVO,
									  BindingResult result,
									  HttpSession session) {
		//유효성체크결과오류가 있으면 폼호출
		if(result.hasErrors()) {
			return "companyModify";
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		memberVO.setMem_num(user.getMem_num());
		
		//회원정보변경
		memberService.updateCompany(memberVO);
		
		return "redirect:/member/myPage.do";
	}
	
	/* === 회원탈퇴 
	=======================*/
	// 일반회원탈퇴 폼 호출
	@GetMapping("/member/deleteMember.do")
	public String formDeleteMember() {
		return "memberDelete";
	}

	// 전송된 데이터 처리
	@PostMapping("/member/deleteMember.do")
	public String submitDeleteMember(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model) {

		// id와 passwd 필드만 유효성 체크
		// 유효성 체크 결과 오류가 있으면폼 호출
		if (result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
			return formDeleteMember();
		}

		MemberVO user = (MemberVO) session.getAttribute("user");
		MemberVO db_member = memberService.selectMember(user.getMem_num());

		boolean check = false;

		// 아이디 비밀번호 일치 여부 체크
		try {
			if (db_member != null && db_member.getMem_id().equals(memberVO.getMem_id())) {
				// 비밀번호 일치 여부 체크
				check = db_member.isCheckedPasswd(memberVO.getPasswd());
			}
			if (check) {
				// 인증성공, 회원정보 삭제
				memberService.deleteMember(user.getMem_num());
				// 로그아웃
				session.invalidate();
				model.addAttribute("accessMsg", "회원탈퇴를 완료했습니다.");
				return "common/notice";
			}
			// 인증실패
			throw new AuthCheckException();
		} catch (AuthCheckException e) {
			result.reject("invalidIdOrPassword");
			return formDeleteMember();
		}
	}
	
	// 기업회원탈퇴 폼 호출
	@GetMapping("/member/deleteCompany.do")
	public String formDeleteCompany() {
		return "companyDelete";
	}
	// 전송된 데이터 처리
	@PostMapping("/member/deleteCompany.do")
	public String submitDeleteCompany(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model) {

		// id와 passwd 필드만 유효성 체크
		// 유효성 체크 결과 오류가 있으면폼 호출
		if (result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
			return formDeleteCompany();
		}

		MemberVO user = (MemberVO) session.getAttribute("user");
		MemberVO db_member = memberService.selectCompany(user.getMem_num());

		boolean check = false;

		// 아이디 비밀번호 일치 여부 체크
		try {
			if (db_member != null && db_member.getMem_id().equals(memberVO.getMem_id())) {
				// 비밀번호 일치 여부 체크
				check = db_member.isCheckedPasswd(memberVO.getPasswd());
			}
			if (check) {
				// 인증성공, 회원정보 삭제
				memberService.deleteCompany(user.getMem_num());
				// 로그아웃
				session.invalidate();
				model.addAttribute("accessMsg", "회원탈퇴를 완료했습니다.");
				return "common/notice";
			}
			// 인증실패
			throw new AuthCheckException();
		} catch (AuthCheckException e) {
			result.reject("invalidIdOrPassword");
			return formDeleteCompany();
		}
	}
	/* === 마이페이지 : 일반
	=======================*/
	//Ticket 내역
	@RequestMapping("/member/memberMypageTicketList.do")
	public String memberTicketList(HttpSession session, Model model) {
		
		return "memberMypageTicketList";
	}
	//Food 내역
	@RequestMapping("/member/memberMypageFoodList.do")
	public String memberFoodList(HttpSession session, Model model) {
		
		return "memberMypageFoodList";
	}
	//Goods 내역
	@RequestMapping("/member/memberMypageGoodList.do")
	public String memberGoodList(HttpSession session, Model model) {
		
		return "memberMypageGoodList";
	}
	/* === 마이페이지 : 기업
	=======================*/
	//푸드목록
	@RequestMapping("/member/companyMypageFoodList.do")
	public String companyMypageFoodList(HttpSession session, Model model) {
		
		return "companyMypageFoodList";
	}
	//매출관리
	@RequestMapping("/member/companyMypageSaleManage.do")
	public String companyMypageSaleManage(HttpSession session, Model model) {
		
		return "companyMypageSaleManage";
	}
	//주문내역 (들어온 주문)
	@RequestMapping("/member/companyMypageOrderList.do")
	public String companyMypageOrderList(HttpSession session, Model model) {
		
		return "companyMypageOrderList";
	}
}