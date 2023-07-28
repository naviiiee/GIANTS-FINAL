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
	private String mem_au_id;
	@NotEmpty
	private String mem_name;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	private String mem_passwd;
	@NotEmpty
	private String mem_phone;
	@Email
	@NotEmpty
	private String mem_email;
	@Size(min=5,max=5)
	private String mem_zipcode;
	@NotEmpty
	private String mem_address1;
	@NotEmpty
	private String mem_address2;
	private byte[] mem_photo;
	private String mem_photo_name;
	private Date mem_reg_date;
	private Date mem_modify_date;
}
