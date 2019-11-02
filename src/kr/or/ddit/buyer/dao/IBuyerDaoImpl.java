package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerDaoImpl implements IBuyerDao {

	private static IBuyerDao dao = new IBuyerDaoImpl();
	private SqlMapClient client;
	
	private IBuyerDaoImpl(){
		client  = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBuyerDao getInstance(){
		return (dao == null) ? dao = new IBuyerDaoImpl() : dao;
	}
	
	@Override
	public List<Map<String,String>> buyerList()
			throws SQLException {
		return client.queryForList("buyer.buyerList");
	}

	@Override
	public List<BuyerVO> searchBuyer(String buyer_id) throws SQLException {
		return client.queryForList("buyer.searchBuyer", buyer_id);
	}

	@Override
	public  Map<Object, Object> buyerInfo(Object params) throws SQLException {
		return (Map<Object, Object>) client.queryForObject("buyer.buyerInfo", params);
	}

	@Override
	public void insertBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		client.insert("buyer.insertBuyer", buyerInfo);
	}

	@Override
	public void updateBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		client.update("buyer.updateBuyer", buyerInfo);
	}

	@Override
	public void deleteBuyerInfo(HashMap<Object, Object> params) throws SQLException {
		client.update("buyer.deleteBuyer", params);
	}

	@Override
	public Map<String, String> getMaxId(String buyer_lgu) throws SQLException {
		return (Map<String, String>) client.queryForObject("buyer.getMaxId", buyer_lgu);
	}

	@Override
	   public List<Map<String, Object>> getCode(Map<String, String> params)
	         throws SQLException {
	      return (List<Map<String, Object>>) client.queryForList("buyer.getCode", params);
	   }
}
