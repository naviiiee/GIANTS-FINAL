package kr.spring.gorder.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.gorder.vo.GorderDetailVO;
import kr.spring.gorder.vo.GorderVO;

public interface GorderService {
	// 주문 등록
	public void insertOrder(GorderVO order, List<GorderDetailVO> list);

	// 관리자 - 전체/검색 레코드 수
	public int selectOrderCount(Map<String, Object> map);

	// 관리자 - 전체/검색 목록
	public List<GorderVO> selectListOrder(Map<String, Object> map);

	/*
	 * //주문 등록 //주문번호 구하기 - 주문 정보 저장 - 주문 상세 정보 저장 - 상품 재고수 차감 - 장바구니에서 주문한 상품 삭제해주기
	 * public int selectOrderNum();
	 * 
	 * //주문 결제 완료 시 굿즈 재고 변경 //public void updateGoodsStockFromOrder()
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
	 * //주문 삭제(삭제 시 재고를 원상 복귀시키지 않고, 주문취소일 때 복구시킴) public void deleteOrderDetail(int
	 * order_num); public void deleteOrder(int order_num);
	 * 
	 * //관리자, 사용자 주문 상세 public GorderVO getOrder(int order_num);
	 * 
	 * //관리자, 사용자 주문 수정 public void updateOrder(GorderVO order);
	 * 
	 * //사용자 - 주문취소 public void updateOrderCancel(int order_num);
	 */
}
