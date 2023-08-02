package kr.spring.food.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FoodController {
	@RequestMapping("/food/foodList.do")
	public String foodList() {
		return "foodList";
	}
	
	@RequestMapping("/food/foodCompDetail.do")
	public String foodCompDetail() {
		return "foodCompDetail";
	}
	
	@RequestMapping("/food/fixCompFoodList.do")
	public String foodFixCompDetail() {
		return "fixCompFoodList";
	} 
}
