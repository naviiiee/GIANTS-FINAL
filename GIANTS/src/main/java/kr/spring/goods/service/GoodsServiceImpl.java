package kr.spring.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.goods.dao.GoodsMapper;
import kr.spring.goods.vo.GoodsFavVO;
import kr.spring.goods.vo.GoodsReviewVO;
import kr.spring.goods.vo.GoodsVO;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	GoodsMapper goodsmapper;

	@Override
	public List<GoodsVO> selectGoodsList(Map<String, Object> map) {
		return goodsmapper.selectGoodsList(map);
	}

	@Override
	public int selectGoodsRowCount(Map<String, Object> map) {
		return goodsmapper.selectGoodsRowCount(map);
	}

	@Override
	public void insertGoods(GoodsVO goodsVO) {
		//상품번호 생성해서 자바빈에 저장
		goodsVO.setGoods_num(goodsmapper.selectGoodsNum());
		//상품 정보 저장
		goodsmapper.insertGoods(goodsVO);
		//상품 옵션 재고 저장
		goodsmapper.insertGoodsOption(goodsVO);
	}

	@Override
	public GoodsVO selectGoods(Integer goods_num) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectGoodsFavCount(Integer goods_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertGoodsFav(GoodsFavVO fav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoodsFav(Integer fav_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoodsFavByGoodsNum(Integer goods_num) {
		// TODO Auto-generated method stub
		
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
