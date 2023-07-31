package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.ticket.dao.TicketMapper;
import kr.spring.ticket.vo.GameVO;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {
	@Autowired
	TicketMapper ticketMapper;
	
	@Override
	public void insertGame(GameVO gameVO) { ticketMapper.insertGame(gameVO); }

	@Override
	public int selectRowCount(GameVO gameVO) { return ticketMapper.selectRowCount(gameVO); }

	@Override
	public List<GameVO> selectTicketGameList(GameVO gameVO) { return ticketMapper.selectTicketGameList(gameVO); }
}
 