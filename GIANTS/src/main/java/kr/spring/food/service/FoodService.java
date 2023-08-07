package kr.spring.food.service;

import java.util.List;
import java.util.Map;

import kr.spring.food.vo.FoodVO;
import kr.spring.member.vo.CompanyDetailVO;

public interface FoodService {
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
	public int selectRowCount(String comp_num);
	//매장 리스트 페이징
	public List<CompanyDetailVO> selectCompList(Map<String, Object> map);
	public int selectCompRowCount(Map<String, Object> map);
	//식품 상세정보
	public FoodVO selectFood(int food_num);
}
