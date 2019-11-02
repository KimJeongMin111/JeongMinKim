package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {
	public MemberVO memberInfo(Map<String, String> params) throws SQLException;
	public List<MemberVO> memberList() throws SQLException;
	public void insertMemberInfo(MemberVO memberInfo) throws SQLException;
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException;
	public void deleteMemberInfo(Map<String, String> params) throws SQLException;
}
