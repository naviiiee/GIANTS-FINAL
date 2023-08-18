package kr.spring.gorder.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class GorderVO {
	private int order_num;
	private int mem_num;
	private String goods_name;
	private int order_payment;
	private int order_status; //배송 상태(default 0, 0:결제완료)
	private Date order_regdate;
	private Date order_modifydate; //수정일
	@NotEmpty
	private String order_name;
	@NotEmpty
	private String order_zipcode;
	@NotEmpty
	private String order_address1; //배송지 주소
	@NotEmpty
	private String order_address2; //배송지 상세주소
	@NotEmpty
	private String mem_phone; //배송지 전화번호
	private String order_message;
	private int order_total; 
	private int merchant_uid; //결제 api
	
	private String id; //구매자 id
	private int[] cart_numbers; //장바구니에서 선택한 상품의 번호들
	private GorderDetailVO gorderDetailVO;
	
	
}
