package kr.spring.gorder.vo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GorderDetailVO {
	private int detail_num; //주문상세번호
	private int goods_num; //상품번호
	private String goods_name;//상품명
	private int goods_dprice; //가격
	private int order_dcost; //배송비, default 3000
	private int goods_total; //상품구매금액
	private int order_quantity; //구매수량 
	private int order_num;//주문번호   
}
