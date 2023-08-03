package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	//회원관리 - 일반회원 
	//회원번호생성
	@Select("SELECT MEMBER_DETAIL_seq.nextval FROM dual")
	public int selectMem_num();
	
	//일반회원가입
	@Insert("INSERT INTO MEMBER (mem_num,mem_id,passwd,mem_nickname,mem_auth) VALUES (#{mem_num},#{mem_id},#{passwd},#{mem_nickname},#{mem_auth})")
	public void insertMember(MemberVO member);
	public void insertMember_detail(MemberVO member);
	
	//기업회원가입
	@Insert("INSERT INTO MEMBER (mem_num,mem_id,passwd,mem_auth) VALUES (#{mem_num},#{mem_id},#{passwd},#{mem_auth})")
	public void insertCompany(MemberVO member);
	public void insertCompany_detail(MemberVO member);
	
	//ID를 이용한 회원정보 체크
	public MemberVO selectCheckMember(String id);
	
	//회원번호를 이용한 회원정보 구하기
	public MemberVO selectMember(Integer mem_num);
	public MemberVO selectCompany(Integer mem_num);
	
	
	//회원정보수정
	//비밀번호수정
	//회원탈퇴
	//@Update("UPDATE MEMBER SET mem_auth=0 WHERE ")
	//자동로그인
}
