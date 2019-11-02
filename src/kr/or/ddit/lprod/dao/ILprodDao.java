package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public interface ILprodDao {
   //상품분류코드
   public List<LprodVO> selectLprodNames() throws SQLException;
}
