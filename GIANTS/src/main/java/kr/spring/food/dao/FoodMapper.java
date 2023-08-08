package kr.spring.food.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.food.vo.F_orderVO;
import kr.spring.food.vo.FoodVO;
import kr.spring.food.vo.Food_reviewVO;
import kr.spring.member.vo.CompanyDetailVO;

@Mapper
public interface FoodMapper {
	//(관리자, 기업)
	//식품등록
	public void insertFood(FoodVO food);
	
	//식품수정
	public void fixFood(FoodVO food);
	
	//식품삭제
	@Delete("DELETE FROM food WHERE food_num=#{food_num}")
	public void deleteFood(Integer food_num);
	
	//---------------------------------------------------------
	//(공용)
	//식품 리스트 페이징
	public List<FoodVO> selectList(Map<String, Object> map);
	public int selectRowCount(String comp_num);
	
	//매장 리스트 페이징
	public List<CompanyDetailVO> selectCompList(Map<String, Object> map);
	public int selectCompRowCount(Map<String, Object> map);
	
	//식품 상세정보
	@Select("SELECT * FROM food WHERE food_num=#{food_num}")
	public FoodVO selectFood(int food_num);
	
	//매장 상세정보
	public CompanyDetailVO selectComp(String comp_num);
	
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
