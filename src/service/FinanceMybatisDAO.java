package service;

import java.util.Date;
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
	public List<FinanceDTO> FinanceDandWList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(fin + ".FinanceDandWList");
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
			}else if (num == 5) {
				dbno = "5";
				map.put("dbno", dbno);
				financedata=sqlSession.selectList(statement,map);
			}
			return financedata;

		} finally {
			sqlSession.close();
		}
	}
	public FinanceDTO Findfin(int fin_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(fin + ".FindFin", fin_no);
		} finally {
			sqlSession.close();
		}
	}
	
	public ProductsDTO selPro(int fin_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(pro + ".selPro", fin_no);
		}finally {
			sqlSession.close();
		}
	}
	
	public int insertAcc( String member_id, String fin_pro,String account_num, Date acc_date ,String fin_name, int fin_pw, double fin_rate) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.clear();
			map.put("member_id", member_id);
			map.put("fin_pro", fin_pro);
			map.put("account_num", account_num);
			map.put("fin_name",fin_name);
			map.put("fin_pw",fin_pw);
			map.put("account_date", acc_date);
			map.put("fin_rate",fin_rate);
			int num= sqlSession.selectOne(pro+".getCountAccount");
			System.out.println(num);
			map.put("account_no",num+1);
			return sqlSession.insert(pro + ".insertAcc", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
