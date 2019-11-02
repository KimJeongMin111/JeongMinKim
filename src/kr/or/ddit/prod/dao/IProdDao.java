package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProdVO;

public interface IProdDao {
	public Map<Object, Object> prodInfo(Object params) throws SQLException;
	public List<ProdVO> prodList() throws SQLException;
	public List<ProdVO> searchProd(String lprod_nm) throws SQLException;
	public void insertProdInfo(ProdVO prodInfo) throws SQLException;
	public void updateProdrInfo(ProdVO prodInfo) throws SQLException;
	public void deleteProdInfo(HashMap<Object, Object> params) throws SQLException;
	
}
