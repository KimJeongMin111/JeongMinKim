package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	public Map<Object, Object> buyerInfo(Object params);
	//public List<BuyerVO> buyerList(Map<String, String> params) ;
	public Map<String, String> getMaxId(String buyer_lgu);
	   public List<Map<String, Object>> getCode(Map<String, String> params);
	public List<Map<String, String>> buyerList() ;
	public List<BuyerVO> searchBuyer(String buyer_id) ;
	public void insertBuyerInfo(BuyerVO buyerInfo);
	public void updateBuyerInfo(BuyerVO buyerInfo);
	public void deleteBuyerInfo(HashMap<Object, Object> params);
	
}
