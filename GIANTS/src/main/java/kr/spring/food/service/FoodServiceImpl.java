package kr.spring.food.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.food.dao.FoodMapper;
import kr.spring.food.vo.FoodVO;

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FoodVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FoodVO selectFood(FoodVO food) {
		// TODO Auto-generated method stub
		return null;
	}
}
