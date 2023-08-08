package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.chat.vo.ChatRoomVO;

@Service
@Transactional
public class ChatServiceImpl implements ChatService{

	@Override
	public List<ChatRoomVO> selectChatRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectChatRoomNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertChatRoom(ChatRoomVO chatRoomVO) {
		// TODO Auto-generated method stub
		
	}

}
