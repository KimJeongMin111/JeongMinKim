package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProdVO;

public interface IProdService {
	public Map<Object, Object> prodInfo(Object params);
	public  List<ProdVO> prodList();
	public void insertProdInfo(ProdVO prodInfo);
	public void updateProdInfo(ProdVO prodInfo);
	public void deleteProdInfo(HashMap<Object, Object> params);
	public List<ProdVO> searchProd(String lprod_nm);
}
