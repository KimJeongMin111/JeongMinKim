package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.LprodVO;

public class ILprodDaoImpl implements ILprodDao {
	   private static ILprodDao dao;
	   private SqlMapClient client;
	   
	   private ILprodDaoImpl(){
	      client = SqlMapClientFactory.getSqlMapClient();
	   }
	   
	   public static ILprodDao getInstance(){
	      return (dao == null) ? dao = new ILprodDaoImpl() : dao;
	   }

	   @Override
	   public List<LprodVO> selectLprodNames() throws SQLException {
	      return (List<LprodVO>) client.queryForList("lprod.selectLprodNames");
	   }

}
