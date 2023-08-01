package kr.spring.news.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GameVO {
	private int game_num; //경기번호
	private Date game_date; //경기날짜
	private int game_opp; //상대팀 - 1:SSG/2:키움/3:LG/4:KT/5:기아/6:NC/7:삼성/8:두산/9:한화
	private int game_hw; //1:홈/2:어웨이
	private int game_location; //경기장 - 1:사직/2:인천/3:잠실/4:고척/5:수원/6:대전/7:대구/8:광주/9:창원/10:울산/11:포항
	private int game_time; //경기시간 - 1:18시30분/2:14시/3:17시/4:18시
	private String game_score; //최종 스코어
	private int game_result; //1:승/2:패/3:무/4:경기전/5:취소
	private int mem_num; //회원번호
}
