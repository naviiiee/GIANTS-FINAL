package kr.spring.gorder.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class GorderVO {
	private int order_num; //주문번호
	private String goods_name; //주문 상품명
	private int order_total; //총구매 금액
	private int payment; //지불 방식
	private int status; //배송 상태
	private String receive_name; //수령인
	private String receive_post; //배송지 우편번호
	@NotEmpty
	private String receive_address1; //배송지 주소
	@NotEmpty
	private String receive_address2; //배송지 상세주소
	@NotEmpty
	private String receive_phone; //배송지 전화번호
	private String notice; //남기실 말씀
	private Date reg_date; //구매일
	private Date modify_date; //수정일
	private int mem_num; //구매자 회원번호
	private String id; //구매자 id
	
	private int[] cart_numbers; //장바구니에서 선택한 상품의 번호들
	
	
	
}
