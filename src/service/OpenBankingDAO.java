package service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import controller.AbstractMybatis;
import model.OpenBankingDTO;

@Service
public class OpenBankingDAO extends AbstractMybatis {
	
	private final String namespace = "OpenBankingMapper";
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	static Date date = new Date();
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	/* 오픈뱅킹 계좌 등록 */
	public Integer InsertOpenBanking(OpenBankingDTO OpenBanking) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".InsertOpenBanking";
			int result = sqlSession.insert(statement, OpenBanking);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} finally {
			sqlSession.close();
		}
	}

	/* 오픈뱅킹 계좌 삭제 */
	public Integer DeleteOpenBanking(OpenBankingDTO OpenBanking) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".DeleteOpenBanking";
			int result = sqlSession.insert(statement, OpenBanking);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} finally {
			sqlSession.close();
		}
	}

	/* 오픈뱅킹 계좌 조회 */
	public List<OpenBankingDTO> SelectOpenBanking(OpenBankingDTO OpenBanking) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".SelectOpenBanking", OpenBanking);
		} finally {
			sqlSession.close();
		}

	}


}
