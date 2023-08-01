package kr.spring.gcart.service;

import java.util.List;
import java.util.Map;

import kr.spring.gcart.vo.GcartVO;

public interface GcartService {
	//장바구니 등록
	public void insertCart(GcartVO cart);
	//회원번호 별 총 구매액
	public int getTotalByMem_num(int mem_num);
	//장바구니 목록
	public List<GcartVO> getListCart(int mem_num);
	//장바구니 상세
	public GcartVO getCart(GcartVO cart);
	//장바구니 수정(개별 상품 수량 설정)
	public void updateCart(GcartVO cart);
	//장바구니 상품 번호와 회원번호 별 수정
	public void updateCartByItem_num(GcartVO cart);
	//장바구니 삭제 
	public void deleteCart(int cart_num);
}
