package kr.spring.trading.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TradingVO {
	private int trade_num; //중고거래 게시글 번호
	@NotEmpty
	private String trade_title; //제목
	@NotEmpty
	private String trade_content; //내용
	@NotEmpty
	private int trade_price; //거래물품 가격
	private int trade_hit; //조회수
	private Date trade_date; //등록일
	private Date trade_modifydate; //수정일
	private int trade_status; //거래 상태(0:판매중, 1:거래완료)
	//@NotEmpty
	//private String trade_photo1; //첨부파일명1 
	//@NotEmpty 
	//private String trade_photo2; //첨부파일명2
	private String trade_ip; //ip주소
	private int mem_num; //회원번호
}
