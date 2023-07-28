package kr.spring.member.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyDetailVO {
	//Comp_detail 테이블
		@NotEmpty 
		private String comp_num;
		@NotEmpty
		private String comp_owner;
		@NotEmpty
		private String comp_name;
		@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
		private String comp_passwd;
		@NotEmpty
		private String comp_phone;
		@Email
		@NotEmpty
		private String comp_email;
		@Size(min=5,max=5)
		private String comp_zipcode;
		@NotEmpty
		private String comp_address1;
		@NotEmpty
		private String comp_address2;
		private byte[] comp_photo;
		private String comp_photoname;
		private Date comp_regdate;
		private Date comp_modifydate;
		private String comp_content;
}
