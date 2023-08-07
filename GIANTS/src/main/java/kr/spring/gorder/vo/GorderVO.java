package kr.spring.gorder.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString //테스트 후 삭제
@Getter
@Setter
public class GorderVO {
	private int order_num;
	private int mem_num;
	private String goods_name;
	@NotEmpty
	private int order_payment; //0:무통장, 1:카드
	private int status; //0:결제완료, 1:배송준비, 2:배송중, 3:배송완료
	private Date order_regdate;
	private Date order_modifydate;
	private String order_name;
	@NotEmpty
	private String zipcode;
	@NotEmpty
	private String order_address1;
	@NotEmpty
	private String order_address2;
	@NotEmpty
	private String mem_phone;
	private String order_message;
	private int order_total; //총 주문 가격 = 상품금액*할인율+배송비-포인트
	private int order_quantity;
	private int merchant_uid; //가맹점 주문번호API

	
	
	
}
