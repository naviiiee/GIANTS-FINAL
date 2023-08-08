package kr.spring.chat.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoomVO {
	private int chatroom_num; //채팅방 번호
	private int trade_num; //중고거래 게시글 번호
	private int mem_num; //회원번호
}
