package kr.spring.gorder.vo;
import kr.spring.goods.vo.GoodsVO;
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
	private int order_point; //주문 시 적립된 포인트 - 상품마다 각각 적립되는 포인트가 다르므로 detailList에 넣어줌
	private int order_dcost; //배송비, default 3000
	private int goods_num; //상품번호
	private String goods_name;
	private int goods_dprice;
	private int goods_total;
	private String goods_size;
	private int mem_point;
	private int order_quantity; //구매수량
	
	
	
	private int month_sale;
	private int title_month;
	
	
	
	
	private int goods_total_list;
	private int goods_rank;
	  public void setGoods_rank(int goods_rank) {
	        this.goods_rank = goods_rank;
	    }
	
	
	private GoodsVO goodsVO;
}
