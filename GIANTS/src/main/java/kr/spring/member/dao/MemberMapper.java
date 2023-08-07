package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	public MemberVO selectCheckCompany(String id);
	
	//회원번호를 이용한 회원정보 구하기
	public MemberVO selectMember(Integer mem_num);
	public MemberVO selectCompany(Integer mem_num);
	
	
	//회원정보수정
	@Update("UPDATE MEMBER SET mem_nickname=#{mem_nickname} WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);
	public void updateMember_detail(MemberVO member);
	
	public void updateCompany_detail(MemberVO member);
	
	//비밀번호수정
	
	//회원탈퇴
	@Update("UPDATE MEMBER SET mem_auth=0 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	@Delete("DELETE FROM MEMBER_DETAIL WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
	
	@Update("UPDATE MEMBER SET mem_auth=0 WHERE mem_num=#{mem_num}")
	public void deleteCompany(Integer mem_num);
	@Delete("DELETE FROM COMPANY_DETAIL WHERE mem_num=#{mem_num}")
	public void deleteCompany_detail(Integer mem_num);
	
	//자동로그인
}
