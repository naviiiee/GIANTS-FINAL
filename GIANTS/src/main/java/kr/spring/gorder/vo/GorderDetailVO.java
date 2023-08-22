package kr.spring.gorder.vo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GorderDetailVO {
	private int detail_num; //주문상세번호
	private int mem_num;
	private int order_num;//주문번호  
	private int order_point; //주문 시 적립된 포인트
	private int used_point;
	private int order_dcost; //배송비, default 3000
	private int goods_num; //상품번호
	private String goods_name;
	private int goods_dprice;
	private int goods_total;
	private String goods_size;
	private int mem_point;
	private int order_quantity; //구매수량 
	
	 
	
	
	//private int lpoint; //예상 적립 포인트
	/*
	public void initSaleTotal() {
		this.lpoint = (int)(Math.floor(this.goods_dprice * this.order_quantity * 0.02));
	}*/
	
	
	
	
}
