package kr.or.ddit.lprod.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.ILprodDaoImpl;
import kr.or.ddit.vo.LprodVO;

public class ILprodServiceImpl implements ILprodService {
	   
	   private static ILprodService service;
	   private ILprodDao dao;
	   
	   private ILprodServiceImpl(){
	      dao = ILprodDaoImpl.getInstance();
	   }
	   
	   public static ILprodService getInstance(){
	      return (service == null) ? service = new ILprodServiceImpl() : service;
	   }

	   @Override
	   public List<LprodVO> selectLprodNames() {
	      List<LprodVO> pList = null;
	      
	      try {
	         pList = dao.selectLprodNames();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return pList;
	   }

	   
}
