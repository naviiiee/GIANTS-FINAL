package kr.spring.gorder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.gorder.vo.GorderVO;
import kr.spring.gorder.vo.GorderDetailVO;

@Mapper
public interface GorderMapper {

	// 주문 등록
	@Select("SELECT g_order_seq.nextval FROM dual")
	public int selectOrderNum();
	public void insertOrder(GorderVO order);
	public void insertOrderDetail(GorderDetailVO vo);

	// 재고수 업데이트
	@Update("UPDATE goods SET quantity=quantity-#{order_quantity} WHERE goods_num=#{goods_num}")
	public void updateQuantity(GorderDetailVO orderDetailVO);

	// 주문 상품 장바구니에서 제거
	@Delete("DELETE FROM g_cart WHERE goods_num=#{goods_num} AND mem_num=#{mem_num}")
	public void deleteCartItem(@Param(value = "goods_num") Integer goods_num, @Param(value = "mem_num") Integer mem_num);

	// 관리자 - 전체/검색 레코드 수
	public int selectOrderCount(Map<String, Object> map);

	// 관리자 - 전체/검색 목록
	public List<GorderVO> selectListOrder(Map<String, Object> map);
	/*
	 * //주문 등록 public int selectOrderNum(); public void insertOrder(GorderVO order);
	 * public void insertOrderDetail(GorderDetailVO vo);
	 * 
	 * //관리자 - 전체주문개수, 검색주문개수 public int getOrderCount(String keyfield, String
	 * keyword);
	 * 
	 * //관리자 - 전체주문목록, 검색주문목록 public List<GorderVO> getListOrder(int start, int end,
	 * String keyfield, String keyword);
	 * 
	 * //사용자 - 전체주문개수, 검색주문개수 public int getOrderCountByMem_num(String keyfield,
	 * String keyword, int mem_num);
	 * 
	 * //사용자 - 전체주문목록, 검색주문목록 public List<GorderVO> getListOrderByMem_num(int start,
	 * int end, String keyfield, String keyword, int mem_num);
	 * 
	 * //개별 상품 목록 public List<GorderDetailVO> getListOrderDetail(int order_num);
	 * 
	 * //주문 삭제(삭제 시 재고를 원상 복귀시키지 않고, 주문취소일 때 복구시킴) //주문 상세 먼저 삭제 후 주문테이블 삭제
	 * //@Delete("DELETE FROM g_order_detail WHERE gorder_num=#{gorder_num}") public
	 * void deleteOrderDetail(int order_num);
	 * //@Delete("DELETE FROM g_order WHERE gorder_num=#{gorder_num}") public void
	 * deleteOrder(int order_num);
	 * 
	 * //관리자, 사용자 주문 상세 public GorderVO getOrder(int order_num);
	 * 
	 * //관리자, 사용자 주문 수정 public void updateOrder(GorderVO order);
	 * 
	 * //사용자 - 주문취소(사이즈 별로 굿즈 개수를 돌려줘야함) //@
	 * Update("UPDATE goods_option SET goods_stock = goods_stock + #{goods_stock} WHERE goods_num=#{goods_num} AND goods_size=#{goods_size}"
	 * ) public void updateOrderCancel(int order_num);
	 */
}
