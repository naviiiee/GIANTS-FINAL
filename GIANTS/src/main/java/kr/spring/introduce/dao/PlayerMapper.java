package kr.spring.introduce.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.introduce.vo.PlayerVO;


@Mapper
public interface PlayerMapper {
	//선수
	public void insertPlayer(PlayerVO playerVO);
	public int selectRowCount(Map<String,Object> map);
	public List<PlayerVO> selectPlayerList(Map<String,Object> map);
	@Select("SELECT * FROM player WHERE player_num=#{player_num}")
	public PlayerVO selectPlayer(Integer player_num);
	public void updatePlayer(PlayerVO playerVO);
	public void deletePlayer(Integer player_num);
}
