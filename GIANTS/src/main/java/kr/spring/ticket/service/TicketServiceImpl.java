package kr.spring.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.ticket.dao.TicketMapper;
import kr.spring.ticket.vo.TicketGameVO;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {
	@Autowired
	TicketMapper ticketMapper;
	
	@Override
	public void insertGame(TicketGameVO ticketGameVO) { ticketMapper.insertGame(ticketGameVO); }

}
