package com.beaudafest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDAO dao;

	//샵 등록
	@Override
	public int shopJoin(ShopVO vo) {
		return dao.shopJoin(vo);
	}

	//샵 정보 수정
	@Override
	public int modifyShopInfo(ShopVO vo) {
		return dao.modifyShopInfo(vo);
	}

	//샵 삭제
	@Override
	public int deleteShop(ShopVO vo) {
		return dao.deleteShop(vo);
	}

	//특정 오너의 샵 조회
	@Override
	public List<ShopVO> findOwnerShop(ShopVO vo) {
		return dao.findOwnerShop(vo);
	}

	@Override
	public ShopVO findShopOne(ShopVO vo) {
		return dao.findShopOne(vo);
	}

	@Override
	public ShopVO findShopInfo(Integer shopNum) {
		return dao.findShopInfo(shopNum);
	}

}
