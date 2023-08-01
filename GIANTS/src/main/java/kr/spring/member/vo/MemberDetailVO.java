package kr.spring.member.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString 
public class MemberDetailVO {
   private String mem_auid;   //자동로그인
   @NotEmpty
   private String mem_name;   //일반회원명
   @NotEmpty
   private String mem_public;   //생년월일
   @NotEmpty
   private String mem_phone;   //전화번호
   @Email
   @NotEmpty
   private String mem_email;   //이메일
   @Size(min = 5, max = 5)
   private String mem_zipcode;   //우편번호
   @NotEmpty
   private String mem_address1;//상세주소
   @NotEmpty 
   private String mem_address2;//주소2
   private byte[] mem_photo;   //프로필사진
   private String mem_photoname;//프로필사진이름
   private int mem_point;      //적립금
   private Date mem_regdate;   //가입일
   private Date mem_modifydate;//수정일
}