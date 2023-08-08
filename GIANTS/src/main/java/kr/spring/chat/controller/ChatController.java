package kr.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.spring.chat.service.ChatService;
import kr.spring.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;;
	@Autowired
	private MemberService memberService;
	
	/* =================
	 *    채팅방 생성
	 * =============== */
	@GetMapping("/chat/chatRoomWrite.do")
	public String chatRoomWrite() {
		return "chatRoomWrite";
	}

}
