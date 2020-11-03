package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import controller.AbstractMybatis;
import model.StockDTO;

@Service
public class StockDAO extends AbstractMybatis {

	private final String namespace = "StockMapper";

	HashMap<String, Object> map = new HashMap<String, Object>();

	/*주식 조회 및 검색*/
	public String searchstock(String exname) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		System.out.println(exname);
		try {
			return sqlSession.selectOne(namespace + ".searchstock", exname);
		} finally {
			sqlSession.close();
		}
	}

	/*주식 조회 및 검색 1 */
	public List<StockDTO> SelectStock1() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".SelectStock1");
		} finally {
			sqlSession.close();
		}
	}

	/*주식 조회 및 검색 2 */
	public List<StockDTO> SelectStock2(String exname) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".SelectStock2", exname);
		} finally {
			sqlSession.close();
		}
	}

}
