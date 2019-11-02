package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.IProdDaoImpl;
import kr.or.ddit.vo.ProdVO;

public class IProdServiceImpl implements IProdService {

	private static IProdService service = new IProdServiceImpl();
	private IProdDao dao;
	
	private IProdServiceImpl(){
		dao = IProdDaoImpl.getInstance();
	}
	
	public static IProdService getInstance(){
		return (service == null) ? service = new IProdServiceImpl() : service;
	}
	
	

	@Override
	public List<ProdVO> prodList() {
		List<ProdVO> prodList = null;
		
		try {
			prodList = dao.prodList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prodList;
	}


	@Override
	public void insertProdInfo(ProdVO prodInfo) {
		try {
			dao.insertProdInfo(prodInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateProdInfo(ProdVO prodInfo) {
		try {
			dao.updateProdrInfo(prodInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProdInfo(HashMap<Object, Object> params) {
		try {
			dao.deleteProdInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<Object, Object> prodInfo(Object params) {
		 Map<Object, Object> prodInfo = null;
	      try {
	         prodInfo = dao.prodInfo(params);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return prodInfo;
	}

	@Override
	public List<ProdVO> searchProd(String lprod_nm) {
		List<ProdVO> prodList = null;
		
		try {
			prodList = dao.searchProd(lprod_nm);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prodList;
	}

	

}
