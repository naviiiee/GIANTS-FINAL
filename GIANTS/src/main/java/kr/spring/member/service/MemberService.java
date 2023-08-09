package kr.spring.member.service;

import kr.spring.member.vo.CompanyDetailVO;
import kr.spring.member.vo.MemberVO;

public interface MemberService {
	//회원가입 - 일반
	public void insertMember(MemberVO member);
	public void insertCompany(MemberVO member);
	
	//ID를 이용한 회원정보 체크
	public MemberVO selectCheckMember(String id);
	
	//회원번호를 이용한 회원정보 구하기
	public MemberVO selectMember(Integer mem_num);
	public MemberVO selectCompany(Integer mem_num);
	
	public CompanyDetailVO selectCompanyDetail(String comp_num); 
	
	//회원정보 수정
	public void updateMember(MemberVO member);
	public void updateCompany(MemberVO member);
	
	//프로필 이미지 업데이트
	public void updateProfile(MemberVO member);
	public void updateComProfile(MemberVO member);
	
	//비밀번호 수정 
	public void updatePasswd(MemberVO member);
	
	//회원탈퇴
	public void deleteMember(Integer mem_num);
	public void deleteCompany(Integer mem_num);
	
	//자동 로그인
	public void updateAu_id(String au_id, int mem_num);
	public MemberVO selectAu_id(String au_id);
	public void deleteAu_id(int mem_num);
}
