package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

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
import kr.spring.member.vo.MemberDetailVO;
import kr.spring.member.vo.MemberVO;

@Controller
public class MemberController {	
	// 로그 대상 지정
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	/* 자바빈 초기화 */
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	//아이디 중복 체크
	@RequestMapping("/member/confimId.do")
	@ResponseBody
	public Map<String,String> confimId(@RequestParam String mem_id){
		logger.debug("<<아이디 중복 체크>> : " + mem_id);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		MemberVO member = memberService.selectCheckMember(mem_id);
		if(member!=null) {
			//아이디 중복
			mapAjax.put("result", "idDuplicated");
		}else {
			if(!Pattern.matches("^[A-Za-z0-9]{4,12}$", mem_id)) {
				//패턴 불일치
				mapAjax.put("result", "notMatchPattern");
			}
			else {
				//패턴 일치하면서 아이디 미중복
				mapAjax.put("result", "idNotFound");
			}
		}
		
		return mapAjax;
	}
	/* === 회원가입
	=======================*/
	//회원등급 선택 호출
	@RequestMapping("/member/registerCommon.do")
	public String form() {
		return "commonRegister";
	}
	//회원가입 폼 호출
	@GetMapping("/member/registerMember.do")
	public String formMember() {
		return "memberRegister";
	}
	//회원가입 처리
	@PostMapping("/member/registerMember.do")
	public String submit(@Valid MemberVO memberVO, @Valid MemberDetailVO memberdetailVO,BindingResult result, Model model) {
		logger.debug("<<회원가입>> : " + memberVO);
		
		//일반 회원 가입시 auth 값을 2,
		//기업 회원 가입시 auth 값을 3
		memberVO.setMem_auth(2);
		memberdetailVO.setMem_point(0);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return formMember();
		}
		
		//정상 처리 시 회원가입
		memberService.insertMember(memberVO);
		model.addAttribute("accessMsg","회원가입이 완료되었습니다.");
		
		return "common/notice";
	}
	
}
