package kr.spring.ticket.vo;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Range;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SeatVO {
	private int seat_num;	// 좌석 구분번호
	private int grade_num;	// 등급 구분번호
	@Range(min=1, max=935)
	private int seat_block;	// 블록 번호
	@NotEmpty
	private String seat_row;// 좌석 행 배열
	@NotEmpty
	private String seat_col;// 좌석 열 배열
}
