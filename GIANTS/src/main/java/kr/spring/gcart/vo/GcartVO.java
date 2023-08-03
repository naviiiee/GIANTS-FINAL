package kr.spring.gcart.vo;

import java.sql.Date;

import kr.spring.goods.vo.GoodsVO;
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
	
	//컬럼에 없는 값들
	private int sub_total; //같은 상품의 총구매 금액
	private int order_point; //예상 적립금으로 각 굿즈 금액의 2%
	private GoodsVO goodsVO;
}
