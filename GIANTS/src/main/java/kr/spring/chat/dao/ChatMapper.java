package kr.spring.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.spring.chat.vo.ChatRoomVO;

@Mapper
public interface ChatMapper {
	//채팅방 목록
	public List<ChatRoomVO> selectChatRoomList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	//채팅방 번호 생성
	public int selectChatRoomNum();
	//채팅방 생성
	public void insertChatRoom(ChatRoomVO chatRoomVO);
	//채팅방 멤버 등록
	public void insertChatRoomMember(@Param(value = "chatroom_num") Integer chatroom_num, @Param(value = "mem_num") Integer mem_num);
}
