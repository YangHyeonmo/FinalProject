package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.FinanceDTO;
import model.ProductsDTO;
import mybatis.AbstractMybatis;

@Service
public class FinanceMybatisDAO extends AbstractMybatis {
	String namespace = "Finance";
	String namespace1 = "Products";
	HashMap<String, Object> map = new HashMap<String, Object>();

	public List<FinanceDTO> FinanceAllList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".FinanceAllList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceDepositList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".FinanceDepositList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceSavingsList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".FinanceSavingsList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceFundList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".FinanceFundList");
		} finally {
			sqlSession.close();
		}
	}

	public List<FinanceDTO> FinanceLoanList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".FinanceLoanList");
		} finally {
			sqlSession.close();
		}
	}

	public List<ProductsDTO> searchProduct(int fin_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace1 + ".searchProduct", fin_no);
		} finally {
			sqlSession.close();
		}
	}

	public int insertProducts(int fin_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.insert(namespace1 + ".insertProducts", fin_no);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
