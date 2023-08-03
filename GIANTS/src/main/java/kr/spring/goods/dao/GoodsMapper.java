package kr.spring.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.goods.vo.GoodsFavVO;
import kr.spring.goods.vo.GoodsOptionVO;
import kr.spring.goods.vo.GoodsReviewVO;
import kr.spring.goods.vo.GoodsVO;

@Mapper
public interface GoodsMapper {
	//=====일반 상품=====//
	//전체|검색 상품 목록
	public List<GoodsVO> selectGoodsList(Map<String, Object> map);
	//전체|검색 상품 레코드수
	public int selectGoodsRowCount(Map<String, Object> map);
	
	//상품 정보 등록 
	@Select("SELECT goods_seq.nextval FROM dual")
	public int selectGoodsNum();
	public void insertGoods(GoodsVO goodsVO);
	//상품 재고 등록
	public void insertGoodsOption(@Param(value="goods_num") Integer goods_num, 
								@Param(value="goods_size") String goods_size, 
								@Param(value="goods_stock") Integer goods_stock);
	
	//상품 상세
	@Select("SELECT * FROM goods WHERE goods_num=#{goods_num}")
	public GoodsVO selectGoods(Integer goods_num);
	//상품 재고 상세
	@Select("SELECT * FROM goods_option WHERE goods_num=#{goods_num}")
	public GoodsOptionVO selectGoodsOption(Integer goods_num);
	
	//상품 정보 수정
	public void updateGoods(GoodsVO goods);
	//상품 삭제
	public void deleteGoods(Integer goods_num);
	/*
	//=====상품 찜=====//
	//상품 찜 목록
	public GoodsFavVO selectGoodsFav(GoodsFavVO fav);
	//상품 찜 레코드 수
	public int selectGoodsFavCount(Integer goods_num);
	//상품 찜 등록
	public void insertGoodsFav(GoodsFavVO fav);
	//상품 찜 취소
	public void deleteGoodsFav(Integer fav_num);
	//상품삭제시 상품 찜 취소
	public void deleteGoodsFavByGoodsNum(Integer goods_num);
	
	//=====상품 후기=====//
	//전체|검색 상품 후기 목록
	public GoodsReviewVO selectGoodsReview(Map<String, Object> map);
	//전체|검색 상품 후기 레코드 수
	public int selectGreviewRowCount(Map<String, Object> map);
	//상품 후기 등록
	public void insertGoodReview(GoodsReviewVO review);
	//상품 후기 상세
	public GoodsReviewVO selectGoodsReview(Integer review_num);
	//상품 후기 수정
	public void updateGoodsReview(GoodsReviewVO review);
	//상품 후기 삭제
	public void deleteGoodsReview(Integer review_num);
	*/
}
