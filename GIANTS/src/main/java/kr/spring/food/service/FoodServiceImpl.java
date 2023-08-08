package kr.spring.food.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.food.dao.FoodMapper;
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
		// TODO Auto-generated method stub
		
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
}
