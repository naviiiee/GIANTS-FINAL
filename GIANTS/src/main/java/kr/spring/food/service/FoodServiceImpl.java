package kr.spring.food.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.food.dao.FoodMapper;
import kr.spring.food.vo.F_cartVO;
import kr.spring.food.vo.FoodVO;
import kr.spring.member.vo.CompanyDetailVO;

@Service
@Transactional
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	private FoodMapper foodMapper;

	@Override
	public void insertFood(FoodVO food) {
		foodMapper.insertFood(food);
	}

	@Override
	public void fixFood(FoodVO food) {
		foodMapper.fixFood(food);
	}

	@Override
	public void deleteFood(Integer food_num) {
		foodMapper.deleteFood(food_num);
	}

	@Override
	public List<FoodVO> selectList(Map<String, Object> map) {
		return foodMapper.selectList(map);
	}

	@Override
	public int selectRowCount(String comp_num) {
		return foodMapper.selectRowCount(comp_num);
	}

	@Override
	public FoodVO selectFood(int food_num) {
		return foodMapper.selectFood(food_num);
	}

	@Override
	public List<CompanyDetailVO> selectCompList(Map<String, Object> map) {
		return foodMapper.selectCompList(map);
	}

	@Override
	public int selectCompRowCount(Map<String, Object> map) {
		return foodMapper.selectCompRowCount(map);
	}

	@Override
	public CompanyDetailVO selectComp(String comp_num) {
		return foodMapper.selectComp(comp_num);
	}

	//=================장바구니============================
	@Override
	public List<F_cartVO> selectF_cartList(int mem_num) {
		return foodMapper.selectF_cartList(mem_num);
	}

	@Override
	public F_cartVO selectF_cart(F_cartVO f_cartVO) {
		return foodMapper.selectF_cart(f_cartVO);
	}
	
	@Override
	public void insertF_cart(F_cartVO f_cartVO) {
		foodMapper.insertF_cart(f_cartVO);
	}

	@Override
	public void deleteF_cart(Integer mem_num) {
		foodMapper.deleteF_cart(mem_num);
	}

	@Override
	public void updateF_cartByFood_num(F_cartVO f_cartVO) {
		foodMapper.updateF_cartByFood_num(f_cartVO);
	}

	@Override
	public void deleteOneF_cart(Integer cart_num) {
		foodMapper.deleteOneF_cart(cart_num);
	}

	

}
