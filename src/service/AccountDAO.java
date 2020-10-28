package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import controller.AbstractMybatis;
import model.AccountDTO;

@Service
public class AccountDAO extends AbstractMybatis {
	String namespace = "Account";
	String namespace2 = "OpenBankingMapper";

	public int getACount(String member_id) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", member_id);

			return sqlSession.selectOne(namespace + ".getACount", map);
		} finally {
			sqlSession.close();
		}
	}

	public int getBCount(String member_id) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", member_id);

			return sqlSession.selectOne(namespace + ".getBCount", map);
		} finally {
			sqlSession.close();
		}
	}

	public int getCCount(String member_id) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", member_id);

			return sqlSession.selectOne(namespace + ".getCCount", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getA(String member_id) throws Exception { // ����ݰ���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		try {
			return sqlSession.selectList(namespace + ".getA", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getB(String member_id) throws Exception { // ���ݰ���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		try {
			return sqlSession.selectList(namespace + ".getB", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getC(String member_id) throws Exception { // ���ݰ���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		try {
			return sqlSession.selectList(namespace + ".getC", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getArticle(String account_num) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_num", account_num);
		try {
			return sqlSession.selectList(namespace + ".getArticle", map);

		} finally {
			sqlSession.close();

		}
	}

	public List getAlias(String account_num) throws Exception { //�������
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_num", account_num);
		try {
			return sqlSession.selectList(namespace + ".getAlias", map);

		} finally {
			sqlSession.close();

		}
	}

	public int updateAlias(String account_alias, String account_num) throws Exception { //������
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_alias", account_alias);
		map.put("account_num", account_num);
		System.out.println(account_alias);
		try {
			return sqlSession.update(namespace + ".updateAlias", map);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return 0;
	}

	/*
	 * public int updateAccountPw(int account_pw,String account_num) throws
	 * Exception{ SqlSession sqlSession = getSqlSessionFactory().openSession();
	 * HashMap<String, Object> map = new HashMap<String, Object>(); AccountDTO
	 * article = new AccountDTO(); int x = -1; map.put("account_pw", account_pw);
	 * 
	 * try { String passwd =
	 * (String)sqlSession.selectOne(namespace+".selectPw",map); if
	 * (passwd.equals(article.getAccount_pw())) { x
	 * =sqlSession.update(namespace+".updateAccountPw",article);
	 * 
	 * } else { x = 0; } } catch (Exception ex) { ex.printStackTrace(); } finally {
	 * sqlSession.commit(); sqlSession.close(); } return x; }
	 */

	public boolean checkPw(String account_num, int account_pw, int pw_new, int pw_new_check) {
		boolean result = false;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_num", account_num);
		map.put("account_pw", account_pw);
		map.put("pw_new", pw_new);
		System.out.println(map);

		try {
			int count = sqlSession.selectOne(namespace + ".checkPw", map);
			System.out.println("count+" + count);

			if (count > 0) {
				if ((pw_new == pw_new_check)) {
					System.out.println("same" );
					sqlSession.update(namespace + ".updatePw", map);
					System.out.println("end" );
					result = true;
					return result;
				} else {
					System.out.println("else" );
					return result;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return result;
	}

	public List<String> getAccount(String account_num) { //�ϳ����
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_num", account_num);
		try {
			return sqlSession.selectList(namespace + ".getAccount", map);

		} finally {
			sqlSession.close();
		}
	}
	
	public List<String> moveBalanceAccount(String member_id) { //�ܾ׿ű���¸��
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("MEMBER_ID", member_id);
		try {
			return sqlSession.selectList(namespace2 + ".SelectOpenBanking", map);

		} finally {
			sqlSession.close();
		}
	}
	
	

}
