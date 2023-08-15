package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.CompanyDetailVO;
import kr.spring.member.vo.MemberDetailVO;
import kr.spring.member.vo.MemberVO;

@Mapper 
public interface MemberMapper { 
	/*==============
	 *   일반회원
	 *==============*/
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
	
	@Select("SELECT * FROM company_detail WHERE comp_num=#{comp_num}")
	public CompanyDetailVO selectCompanyDetail(String comp_num);
	 
	//회원정보수정
	@Update("UPDATE MEMBER SET mem_nickname=#{mem_nickname} WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);
	
	public void updateMember_detail(MemberVO member);
	public void updateCompany_detail(MemberVO member);
	
	//프로필 이미지 업데이트
	@Update("UPDATE MEMBER_DETAIL SET mem_photo=#{mem_photo},mem_photoname=#{mem_photoname} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	@Update("UPDATE COMPANY_DETAIL SET comp_photo=#{mem_photo},comp_photoname=#{mem_photoname} WHERE mem_num=#{mem_num}")
	public void updateComProfile(MemberVO member);
	
	//비밀번호수정
	@Update("UPDATE MEMBER SET passwd=#{passwd} WHERE mem_num=#{mem_num}")
	public void updatepasswd(MemberVO member);
	
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
	@Update("UPDATE MEMBER SET au_id=#{au_id} WHERE mem_num=#{mem_num}")
	public void updateAu_id(@Param("au_id") String au_id,
            				@Param("mem_num") int mem_num);
	@Select("SELECT m.mem_num,m.mem_id,m.mem_auth,m.au_id,m.passwd,m.mem_nickname,d.mem_email FROM MEMBER m JOIN MEMBER_DETAIL d ON m.mem_num=d.mem_num WHERE m.au_id=#{au_id}")
	public MemberVO selectAu_id(String au_id);
	@Update("UPDATE MEMBER SET au_id='' WHERE mem_num=#{mem_num}")
	public void deleteAu_id(int mem_num);
	
	/*==============
	 *   관리자
	 *==============*/
	//회원가입 - 관리자
	public int selectRowCount(Map<String,Object> map);
	public List<MemberVO> selectList(Map<String,Object> map);
	@Update("UPDATE MEMBER SET mem_auth=#{mem_auth} WHERE mem_num=#{mem_num}")
	public void updateByAdmin(MemberVO memberVO);
}
