package kr.spring.gorder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.gorder.dao.GorderMapper;
import kr.spring.gorder.vo.GorderDetailVO;
import kr.spring.gorder.vo.GorderVO;

@Service
@Transactional
public class GorderServiceImpl implements GorderService{
	
	@Autowired
	GorderMapper orderMapper;

	@Override
	public void insertOrder(GorderVO order, List<GorderDetailVO> list) {
		order.setOrder_num(orderMapper.selectOrderNum());
		orderMapper.insertOrder(order);
		for(GorderDetailVO vo : list) {
			vo.setOrder_num(order.getOrder_num());
			orderMapper.insertOrderDetail(vo);
			//재고수 업데이트
			orderMapper.updateQuantity(vo);
			//주문 상품 장바구니에서 제거
			orderMapper.deleteCartItem(vo.getGoods_num(), order.getMem_num());
		}
	}

	@Override
	public int selectOrderCount(Map<String, Object> map) {
		return orderMapper.selectOrderCount(map);
	}

	@Override
	public List<GorderVO> selectListOrder(Map<String, Object> map) {
		return orderMapper.selectListOrder(map);
	}


	@Override
	public void updatePoint(int mem_num) {
		orderMapper.updatePoint(mem_num);
	}

	@Override
	public int selectOrderCountByMem_num(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GorderVO> selectListOrderByMem_num(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GorderVO selectOrder(Integer order_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GorderDetailVO> selectListOrderDetail(Integer order_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrder(GorderVO order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOrderStatus(GorderVO order) {
		// TODO Auto-generated method stub
		
	}

	

	
	
	

}
