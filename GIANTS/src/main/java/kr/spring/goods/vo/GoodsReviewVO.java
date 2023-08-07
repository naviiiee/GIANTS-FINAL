package kr.spring.goods.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsReviewVO {
	private int review_num; //리뷰 번호
	private int mem_num; //작성자 회원번호
	private int goods_num; //상품 번호
	private int review_score; //별점
	private String review_content; //후기 내용
	private byte[] review_photo; //후기 사진
	private String review_photoname; //후기 사진 파일명
	private Date review_regdate; //후기등록일
	private Date review_mdate; //후기 최근 수정일
}
