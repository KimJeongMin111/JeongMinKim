package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;


public interface IBuyerDao{
	//public List<BuyerVO> buyerList(Map<String, String> params) throws SQLException;
	public List<Map<String,String>>  buyerList() throws SQLException;
	public List<BuyerVO> searchBuyer(String buyer_id) throws SQLException;
	public Map<String, String> getMaxId(String buyer_lgu) throws SQLException;
	public Map<Object, Object> buyerInfo(Object params) throws SQLException;
	public void insertBuyerInfo(BuyerVO buyerInfo) throws SQLException;
	public void updateBuyerInfo(BuyerVO buyerInfo) throws SQLException;
	public void deleteBuyerInfo(HashMap<Object, Object> params) throws SQLException;
	  public List<Map<String, Object>> getCode(Map<String, String> params) throws SQLException;
}
