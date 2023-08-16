package kr.spring.goods.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsAnswerVO {
	private int gans_num;
	private String gans_content;
	private Date gans_regdate;
	private Date gans_mdate;
	private int mem_num;
	private int qna_num;
	
	private String mem_id;
}
