package kr.spring.gcart.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class GcartVO {
	int cart_num;
	int goods_num;
	int mem_num;
	int order_quantity;
	Date reg_date; //장바구니에 넣은 날짜, default SYSDATE
	
	private int sub_total; //같은 상품의 총구매 금액
}
