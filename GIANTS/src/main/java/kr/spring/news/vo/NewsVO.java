package kr.spring.news.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NewsVO {
	private int news_num; //뉴스번호
	private String news_title; //뉴스 제목
	private String news_content; //뉴스 내용
	private Date news_regdate; //뉴스 등록일
	private Date news_mdate; //뉴스 최근수정일
	private int news_hit; //뉴스 조회수
	private int mem_num; //뉴스 작성한 회원번호
}
