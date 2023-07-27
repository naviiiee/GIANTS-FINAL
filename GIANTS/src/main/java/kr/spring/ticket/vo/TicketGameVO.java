package kr.spring.ticket.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketGameVO {
	private int game_num;		// 경기구분번호
	private String game_date;	// 경기일자
	private String game_time;	// 경기시작시간
	private String game_team;	// 상태팀이름
	private int game_state;		// 경기예매가능여부
}
