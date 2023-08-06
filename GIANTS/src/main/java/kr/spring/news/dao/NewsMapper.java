package kr.spring.news.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.spring.news.vo.NewsVO;

@Mapper
public interface NewsMapper {
	public List<NewsVO> selectNewsList(Map<String, Object> map);
	public int selectNewsCount(Map<String, Object> map);
	public void insertNews(NewsVO news);
	public NewsVO selectNews(Integer news_num);
	@Update("UPDATE news SET news_hit=news_hit+1 WHERE news_num=#{news_num}")
	public void updateHit(Integer news_num);
	public void udpateNews(NewsVO news);
	public void deleteNews(Integer news_num);
}
