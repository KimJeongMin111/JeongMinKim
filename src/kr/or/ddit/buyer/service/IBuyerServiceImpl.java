package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.dao.IBuyerDaoImpl;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerServiceImpl implements IBuyerService {

	private static IBuyerService service = new IBuyerServiceImpl();
	private IBuyerDao dao;
	
	private IBuyerServiceImpl(){
		dao = IBuyerDaoImpl.getInstance();
	}
	
	public static IBuyerService getInstance(){
		return (service == null) ? service = new IBuyerServiceImpl() : service;
	}
	
	@Override
	public List<Map<String,String>> buyerList(){
		List<Map<String,String>> buyerList = null;
		
		try {
			buyerList = dao.buyerList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerList;
	}

	@Override
	public List<BuyerVO> searchBuyer(String buyer_id) {
		List<BuyerVO> buyerList = null;
		try {
			buyerList = dao.searchBuyer(buyer_id);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return buyerList;
	}

	@Override
	public Map<Object, Object> buyerInfo(Object params) {
		Map<Object, Object> buyerInfo = null;
		
		try {
			buyerInfo = dao.buyerInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerInfo;
	}

	@Override
	public void insertBuyerInfo(BuyerVO buyerInfo) {
		
		try {
			dao.insertBuyerInfo(buyerInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateBuyerInfo(BuyerVO buyerInfo) {

		try {
			dao.updateBuyerInfo(buyerInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBuyerInfo(HashMap<Object, Object> params) {
		
		try {
			dao.deleteBuyerInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, String> getMaxId(String buyer_lgu) {
		Map<String, String> map = null;
		try {
			map = dao.getMaxId(buyer_lgu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	   @Override
	   public List<Map<String, Object>> getCode(Map<String, String> params) {
	      List<Map<String, Object>> bList = null;
	      
	      try {
	         bList = dao.getCode(params);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return bList;
	   }
}
