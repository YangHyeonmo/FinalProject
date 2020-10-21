package OPENBANKING;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import controller.AbstractMybatis;

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

	public static void main(String[] args) {
		OpenBankingDAO dao = new OpenBankingDAO();
		OpenBankingDTO op = new OpenBankingDTO();

		op.setOPEN_ACCOUNT_NO("000-000-000000");
		op.setMEMBER_ID("vldrn7636");
		op.setOPEN_BANK("땡땡은행");
		op.setOPEN_ACCOUNT_PW("1111");
		op.setOPEN_BALANCE(1000000);
		op.setOPEN_CARD_NAME("땡떙카드");
		op.setREGDATE(new Date());
		System.out.println(dao.SelectOpenBanking(op));
		//System.out.println(dao.InsertOpenBanking(op));
		//System.out.println(dao.DeleteOpenBanking(op));

	}

}
