package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.FinanceDTO;
import model.ProductsDTO;


@Service
public class FinanceMybatisDAO extends AbstractMybatis {
	String fin = "Finance";
	String pro = "Products";
	HashMap<String, Object> map = new HashMap<String, Object>();

	public List<FinanceDTO> FinanceDepositList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(fin + ".FinanceDepositList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceSavingsList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(fin + ".FinanceSavingsList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceFundList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(fin + ".FinanceFundList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceLoanList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(fin + ".FinanceLoanList");
		} finally {
			sqlSession.close();
		}
	}

	public int insertProducts(int fin_no, String member_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.clear();
			map.put("fin_no", fin_no);
			map.put("member_id", member_id);
			return sqlSession.insert(pro + ".insertProducts", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public List<ProductsDTO> selectProducts(String member_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(pro + ".selectProducts", member_id);
		} finally {
			sqlSession.close();
		}
	}

	public List<ProductsDTO> financeMain(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<ProductsDTO> financedata = new ArrayList<ProductsDTO>();
		String dbno = "";
		map.clear();
		try {
			String statement = pro + ".financeMain";
			if (num == 1) {
				dbno = "1";
				map.put("dbno", dbno);
				financedata= sqlSession.selectList(statement,map);
			} else if (num == 2) {
				dbno = "2";
				map.put("dbno", dbno);
				financedata= sqlSession.selectList(statement,map);
			} else if (num == 3) {
				dbno = "3";
				map.put("dbno", dbno);
				financedata= sqlSession.selectList(statement,map);
			} else if (num == 4) {
				dbno = "4";
				map.put("dbno", dbno);
				financedata=sqlSession.selectList(statement,map);
			}
			return financedata;

		} finally {
			sqlSession.close();
		}
	}
	public String Findfin(int fin_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(fin + ".Findfin", fin_no);
		} finally {
			sqlSession.close();
		}
	}
}
