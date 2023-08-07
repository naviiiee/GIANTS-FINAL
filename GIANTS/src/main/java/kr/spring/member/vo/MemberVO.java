package kr.spring.member.vo;

import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private int mem_num; // 회원번호
	@Pattern(regexp = "^[A-Za-z0-9]{4,12}$")
	private String mem_id; // 회원아이디
	private String mem_nickname; // 회원닉네임
	public int mem_auth; // 회원등급 ( 0:탈퇴 1:정지 2:일반 3:기업 9:관리 )
	@Pattern(regexp = "^[A-Za-z0-9]{4,12}$")
	private String passwd; // 비밀번호
	private String auto; // 자동로그인

	private CompanyDetailVO companyDetailVO;
	private MemberDetailVO memberDetailVO;

	// 비밀번호 변경시 현재 비밀번호를 저장하는 용도로 사용
	@Pattern(regexp = "^[A-Za-z0-9]{4,12}$")
	private String now_passwd; // 비밀번호변경

	// =======비밀번호 일치 여부 체크=======//
	public boolean isCheckedPasswd(String userPasswd) {
		if (mem_auth > 1 && passwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}

}