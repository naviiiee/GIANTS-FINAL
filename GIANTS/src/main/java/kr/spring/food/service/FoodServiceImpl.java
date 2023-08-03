package kr.spring.food.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.food.dao.FoodMapper;

@Service
@Transactional
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	private FoodMapper foodMapper;
}
