package kr.spring.ticket.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GradeVO {
	private int grade_num;		// 등급 구분 번호
	private int game_num;		// 경기 번호
	private String title;		// 등급 이름
	private int quantity;		// 좌석 수량
	private int price_week;		// 주중 가격
	private int price_weekend;	// 주말 가격
	
}
