package kr.spring.member.vo;

import java.io.IOException;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = {"mem_photo"})
public class MemberVO {
	private int mem_num; // 회원번호
	@Pattern(regexp = "^[A-Za-z0-9]{4,12}$")
	@NotEmpty
	private String mem_id; // 회원아이디
	private String mem_nickname; // 회원닉네임
	public int mem_auth; // 회원등급 ( 0:탈퇴 1:정지 2:일반 3:기업 9:관리 )
	@Pattern(regexp = "^[A-Za-z0-9]{4,12}$")
	@NotEmpty
	private String passwd; // 비밀번호
	private String au_id; //자동로그인
	private String auto;
	@Valid
	private CompanyDetailVO companyDetailVO;
	@Valid
	private MemberDetailVO memberDetailVO;
	
	// 비밀번호 변경시 현재 비밀번호를 저장하는 용도로 사용
	@Pattern(regexp = "^[A-Za-z0-9]{4,12}$")
	private String now_passwd; // 비밀번호변경
	
	private byte[] mem_photo;
	private String mem_photoname;
	private String name;

	// =======비밀번호 일치 여부 체크======= //
	public boolean isCheckedPasswd(String userPasswd) {
		if (mem_auth > 1 && passwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
	public void setUpload(MultipartFile upload)throws IOException{
		//MultipartFile -> byte[]
		setMem_photo(upload.getBytes());
		//파일이름
		setMem_photoname(upload.getOriginalFilename());
	} //여기서 변환 작업 후 photo,photo_name에 저장 


}