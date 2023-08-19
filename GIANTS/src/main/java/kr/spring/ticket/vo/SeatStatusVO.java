package kr.spring.ticket.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SeatStatusVO {
	private int status_num;
	private int grade_num;
	private String seat_info;
	private int game_num;
	private int seat_auth;	// 1:예매완료, 2:예매불가
}
