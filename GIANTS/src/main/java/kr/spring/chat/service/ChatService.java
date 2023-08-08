package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import kr.spring.chat.vo.ChatRoomVO;

public interface ChatService {
	//채팅방 목록
	public List<ChatRoomVO> selectChatRoomList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	//채팅방 번호 생성
	public int selectChatRoomNum();
	//채팅방 생성
	public void insertChatRoom(ChatRoomVO chatRoomVO);
}
