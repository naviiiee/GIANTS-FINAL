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
	private String mem_auid;
	@NotEmpty
	private String mem_name;
	@NotEmpty
	private String mem_public;
	@NotEmpty
	private String mem_phone;
	@Email
	@NotEmpty
	private String mem_email;
	@Size(min = 5, max = 5)
	private String mem_zipcode;
	@NotEmpty
	private String mem_address1;
	@NotEmpty
	private String mem_address2;
	private byte[] mem_photo;
	private String mem_photoname;
	private int mem_point;
	private Date mem_regdate;
	private Date mem_modifydate;
}
