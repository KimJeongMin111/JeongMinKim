package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.vo.LprodVO;

public interface ILprodService {
	   //상품분류코드
	   public List<LprodVO> selectLprodNames();
	}