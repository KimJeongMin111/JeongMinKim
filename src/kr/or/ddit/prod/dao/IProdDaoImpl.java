package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ProdVO;


public class IProdDaoImpl implements IProdDao {
	
	private static IProdDao dao = new IProdDaoImpl();
	
	private SqlMapClient client;
	
	private IProdDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
		
	}
	
	public static IProdDao getInstance(){
		return (dao != null) ? dao = new IProdDaoImpl() : dao;
	}

	

	@Override
	public List<ProdVO> prodList() throws SQLException {
		return client.queryForList("prod.prodList");
	}

	@Override
	public void insertProdInfo(ProdVO prodInfo) throws SQLException {
		client.insert("prod.insertProd", prodInfo);
	}

	@Override
	public void deleteProdInfo(HashMap<Object, Object> params)
			throws SQLException {
		client.update("prod.deleteProd", params);
	}

	@Override
	public void updateProdrInfo(ProdVO prodInfo) throws SQLException {
		client.update("prod.updateProd", prodInfo);
		
	}

	@Override
	   public Map<Object, Object> prodInfo(Object params) throws SQLException {
	      return (Map<Object, Object>) client.queryForObject("prod.prodInfo", params);
	}

	@Override
	public List<ProdVO> searchProd(String lprod_nm) throws SQLException {
		return client.queryForList("prod.searchProd", lprod_nm);
	}
	
	
	
	
}
