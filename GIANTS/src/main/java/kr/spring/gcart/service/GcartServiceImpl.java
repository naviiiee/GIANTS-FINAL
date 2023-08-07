package kr.spring.gcart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.gcart.dao.GcartMapper;
import kr.spring.gcart.vo.GcartVO;

@Service
@Transactional
public class GcartServiceImpl implements GcartService{
	@Autowired
	GcartMapper cartMapper;
	
	@Override
	public void insertCart(GcartVO cart) {
		cartMapper.insertCart(cart);
	}

	@Override
	public int getTotalByMem_num(int mem_num) {
		return 1;/*cartMapper.getTotalByMem_num(mem_num);*/
	}

	@Override
	public List<GcartVO> getListCart(int mem_num) {
		return cartMapper.getListCart(mem_num);
	}

	@Override
	public GcartVO getCart(GcartVO cart) {
		return cartMapper.getCart(cart);
	}

	@Override
	public void updateCart(GcartVO cart) {
		cartMapper.updateCart(cart);
		
	}

	@Override
	public void updateCartByItem_num(GcartVO cart) {
		cartMapper.updateCartByItem_num(cart);
		
	}

	@Override
	public void deleteCart(int cart_num) {
		cartMapper.deleteCart(cart_num);
	}

	

}
