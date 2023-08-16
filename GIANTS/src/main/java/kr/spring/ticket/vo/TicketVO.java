package kr.spring.ticket.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketVO {
	private int ticket_num;
	private int mem_num;
	private int game_num;
	private String pay_method;
	private String ticket_date;
	private int total_price;
	
}
