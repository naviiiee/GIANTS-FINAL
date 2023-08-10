package kr.spring.food.service;

import java.util.List;
import java.util.Map;

import kr.spring.food.vo.F_cartVO;
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
	
	//매장 상세정보
	public CompanyDetailVO selectComp(String comp_num);
	
	//------------ 장바구니 ----------------------------------
	//회원의 장바구니 목록 조회
	public List<F_cartVO> selectF_cartList(int mem_num);
	//회원의 장바구니 조회(식품코드를 통해)
	public F_cartVO selectF_cart(F_cartVO f_cartVO);
	//장바구니 상품 등록
	public void insertF_cart(F_cartVO f_cartVO);
	//장바구니 모두 비우기
	public void deleteF_cart(Integer mem_num);
	//장바구니 상품 업데이트(추가등록)
	public void updateF_cartByFood_num(F_cartVO f_cartVO);
}
