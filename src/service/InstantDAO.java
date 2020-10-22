package service;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import controller.AbstractMybatis;
import model.InstantDTO;

@Service
public class InstantDAO extends AbstractMybatis {
	private final String namespace = "InstantMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();
	static Date date = new Date();
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	/* 계좌확인 - 비밀번호 확인 */
	public Integer CheckOpenBanking(InstantDTO instant) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".CheckOpenBanking";
			int result = sqlSession.selectOne(statement, instant);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("계좌확인 :" + instant.toString());
			return result;
		} finally {
			sqlSession.close();
		}
	}

	/* 잔액모으기(출금계좌) */
	public Integer Withdraw(InstantDTO instant) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".Withdraw";
			int result = sqlSession.update(statement, instant);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("오픈뱅킹 :" + result);
			return result;

		} finally {
			sqlSession.close();
		}
	}

	/* 잔액모으기(입금계좌) */
	public Integer Deposit(InstantDTO instant) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".Deposit";
			int result = sqlSession.update(statement, instant);;
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("내 계좌 :" + result);
			return result;

		} finally {
			sqlSession.close();
		}
	}

	/* 거래내역 등록 */
	public Integer WithdrawLog(InstantDTO instant) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".WithdrawLog";
			int result = sqlSession.insert(statement, instant);;
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("기록 :" + result);
			return result;

		} finally {
			sqlSession.close();
		}
	}

	public static void main(String[] args) {
		InstantDAO dao = new InstantDAO();
		InstantDTO i = new InstantDTO();

		i.setMEMBER_ID("vldrn7636");
		i.setMY_ACCOUNT_NUM("111111-11-111111");
		i.setCOLLECTING_DAY(new Date());
		/* i.setSUMMARY("즉시모으기"); */
		i.setMEMO("문행빈");
		System.out.println(dao.CheckOpenBanking(i) + "\n");
		System.out.println(dao.WithdrawLog(i) + "\n");
		System.out.println(dao.Deposit(i));
		System.out.println(dao.Withdraw(i));

	}

}
