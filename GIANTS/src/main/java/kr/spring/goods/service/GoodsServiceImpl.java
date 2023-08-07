package kr.spring.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.goods.dao.GoodsMapper;
import kr.spring.goods.vo.GoodsFavVO;
import kr.spring.goods.vo.GoodsOptionVO;
import kr.spring.goods.vo.GoodsReviewVO;
import kr.spring.goods.vo.GoodsVO;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	GoodsMapper goodsMapper;
 
	@Override
	public List<GoodsVO> selectGoodsList(Map<String, Object> map) {
		return goodsMapper.selectGoodsList(map);
	}

	@Override
	public int selectGoodsRowCount(Map<String, Object> map) {
		return goodsMapper.selectGoodsRowCount(map);
	}
	
	@Override
	public void insertGoods(GoodsVO goodsVO) {
		//상품번호 생성해서 자바빈에 저장
		goodsVO.setGoods_num(goodsMapper.selectGoodsNum());
		
		//상품 정보 저장
		goodsMapper.insertGoods(goodsVO);
		
		for(int i=0; i < (goodsVO.getGoods_stocks()).length; i++) {
			String goods_size = goodsVO.getGoods_sizes()[i];
			int goods_stock = goodsVO.getGoods_stocks()[i];
			
			goodsMapper.insertGoodsOption(goodsVO.getGoods_num(), goods_size, goods_stock);
		}
		 
	}

	@Override
	public GoodsVO selectGoods(Integer goods_num) {
		return goodsMapper.selectGoods(goods_num);
	}
	

	@Override
	public GoodsOptionVO selectGoodsOption(Integer goods_num) {
		return goodsMapper.selectGoodsOption(goods_num);
	}
	
	@Override
	public List<GoodsOptionVO> selectOptionList(Integer goods_num) {
		return goodsMapper.selectOptionList(goods_num);
	}

	@Override
	public void updateGoods(GoodsVO goods) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoods(Integer goods_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public GoodsFavVO selectGoodsFav(GoodsFavVO fav) {
		return goodsMapper.selectGoodsFav(fav);
	}

	@Override
	public int selectGoodsFavCount(Integer goods_num) {
		return goodsMapper.selectGoodsFavCount(goods_num);
	}

	@Override
	public void insertGoodsFav(GoodsFavVO fav) {
		goodsMapper.insertGoodsFav(fav);
	}

	@Override
	public void deleteGoodsFav(Integer fav_num) {
		goodsMapper.deleteGoodsFav(fav_num);
	}

	@Override
	public GoodsReviewVO selectGoodsReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectGreviewRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertGoodReview(GoodsReviewVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public GoodsReviewVO selectGoodsReview(Integer review_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateGoodsReview(GoodsReviewVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoodsReview(Integer review_num) {
		// TODO Auto-generated method stub
		
	}




}
