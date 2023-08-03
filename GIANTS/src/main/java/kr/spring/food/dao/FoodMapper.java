package kr.spring.food.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.food.vo.F_orderVO;
import kr.spring.food.vo.FoodVO;
import kr.spring.food.vo.Food_reviewVO;

@Mapper
public interface FoodMapper {
	//(관리자, 기업)
	//식품등록
	public void insertFood(FoodVO food);
	//식품수정
	public void fixFood(FoodVO food);
	//식품삭제
	public void deleteFood(Integer food_num);
	
	//---------------------------------------------------------
	//(유저)
	//식품 리스트 페이징
	public List<FoodVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String,Object> map);
	//식품 상세정보
	public FoodVO selectFood(FoodVO food);
	
	//식품 매장후기
	public List<Food_reviewVO> selectReviewList(Map<String, Object> map);
	public int selectReviewRowCount(Map<String, Object> map);
	//매장후기 상세정보
	public Food_reviewVO selectFood_Review(Food_reviewVO fr);
	
	//---------------식품 주문 --------------------------------
	//식품 주문(영수증)목록
	public List<F_orderVO> selectOrderList(Map<String, Object> map);
	public int selectOrderRowCount(Map<String,Object> map);
	//식품 주문(영수증)상세정보
	public F_orderVO selectOrder(F_orderVO fo);
	

}
