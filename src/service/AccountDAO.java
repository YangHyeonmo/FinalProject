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

	public List getA(String member_id) throws Exception { // ¿‘√‚±›∞Ë¡¬
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		try {
			return sqlSession.selectList(namespace + ".getA", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getB(String member_id) throws Exception { // øπ±›∞Ë¡¬
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		try {
			return sqlSession.selectList(namespace + ".getB", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getC(String member_id) throws Exception { // ¿˚±›∞Ë¡¬
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

	public List getAlias(String account_num) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_num", account_num);
		try {
			return sqlSession.selectList(namespace + ".getAlias", map);

		} finally {
			sqlSession.close();

		}
	}

	public int updateAlias(String account_alias,String account_num) throws Exception {
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

}
