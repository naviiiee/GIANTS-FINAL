package kr.spring.gcart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.gcart.vo.GcartVO;

@Mapper
public interface GcartMapper {

	// 장바구니 등록
	public void insertCart(GcartVO cart);

	// 회원번호 별 총 구매액
	public int getTotalByMem_num(int mem_num);

	// 장바구니 목록
	public List<GcartVO> getListCart(int mem_num);

	// 장바구니 상세
	@Select("SELECT * FROM g_cart WHERE item_num=#{item_num} AND mem_num=#{mem_num}")
	public GcartVO getCart(GcartVO cart);

	// 장바구니 수정(개별 상품 수량 설정)
	@Update("UPDATE g_cart SET order_quantity=#{order_quantity} WHERE cart_num=#{cart_num}")
	public void updateCart(GcartVO cart);

	// 장바구니 상품 번호와 회원번호 별 수정
	@Update("UPDATE g_cart SET order_quantity=#{order_quantity} WHERE item_num=#{item_num} AND mem_num=#{mem_num}")
	public void updateCartByItem_num(GcartVO cart);

	// 장바구니 삭제
	@Delete("DELETE FROM g_cart WHERE cart_num=#{cart_num}")
	public void deleteCart(int cart_num);
}
