package kr.spring.ticket.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketVO {
	private String ticket_num;
	private int mem_num;
	private int game_num;
	private String pay_method;
	private String ticket_date;
	private int ticket_quantity;
	private Date ticket_modify;
	private int total_price;
	private String pg;

	private String seat_info;
}
