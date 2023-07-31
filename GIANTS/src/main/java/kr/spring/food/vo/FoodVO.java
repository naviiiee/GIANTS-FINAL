package kr.spring.food.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FoodVO {							//논리명					키 분류
	@NotEmpty
	private int food_num;					//식품번호					PK
	@NotEmpty
	private String comp_num;                //기업식별번호				FK
	@NotEmpty
	private String food_name;               //식품명
	@NotEmpty
	private int food_price;                 //식품가격
	@NotEmpty
	private int food_quantity;              //식품재고수량
	private String food_content;            //식품 설명 텍스트
	private byte[] food_photo1;             //식품 메인이미지
	private String food_photo1_name;        //식품 메인이미지 명
	private byte[] food_photo2;             //식품 상세이미지
	private String food_photo2_name;        //식품 상세이미지 명
	private Date food_regDate;              //식품 등록날짜
	private Date food_modifyDate;           //식품 수정날짜
	@NotEmpty
	private String food_status;             //식품 판매상태 ex) 1:판매중, 0:판매중지(상품준비중)
}
