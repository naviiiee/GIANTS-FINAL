package kr.spring.gorderdetail.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GorderDetailVO {
	private int detail_num;
	private int mem_num;
	private int order_num;
	private int order_quantity;
	private int order_point; // 상품 한개 당 적립 예정 포인트(2%)
	private int order_dcost; // 배송비, default 3000, 5만원 이상 구매시 0
	private int goods_num;
	private String goods_name;
	private int goods_price;
	private int goods_dprice; // 할인된 가격 : 상품가격*(1-할인율)
	private int goods_total; // 총 상품 금액(동일 상품 합산금액)
	private int goods_size;
	private int mem_point; // 회원 보유 포인트(기본값은 0)

}
