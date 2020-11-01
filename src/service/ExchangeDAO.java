package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.ExchangeDTO;

@Service
public class ExchangeDAO extends AbstractMybatis {
	String namespace = "Exchange";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	public int insertExchange(String member_id, String cur_unit, double kor_money, String exc_money, String exc_name, String zipcode) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.clear();
			map.put("member_id", member_id);
			map.put("cur_unit", cur_unit);
			map.put("kor_money", kor_money);
			map.put("exc_money", exc_money);
			map.put("exc_name", exc_name);
			map.put("zipcode", zipcode);
			
			int result = sqlSession.insert(namespace +".insertExchange", map);
			System.out.println("insert ok: " + result);
		}  catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	    	sqlSession.commit();
	    	sqlSession.close();
		}
		return 1;
	}
	
	public List<ExchangeDTO> selectExchange(String member_id) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		try {
			return sqlSession.selectList(namespace + ".selectExchange", member_id);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

}
