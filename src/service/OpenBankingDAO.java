package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import controller.AbstractMybatis;
import model.InstantDTO;
import model.OpenBankingDTO;

@Service
public class OpenBankingDAO extends AbstractMybatis {

	private final String namespace = "OpenBankingMapper";

	HashMap<String, Object> map = new HashMap<String, Object>();

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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 1;
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 1;
	}

	/* 오픈뱅킹 계좌 조회 */ /*파라메타수정*/
	public List<OpenBankingDTO> SelectOpenBanking(String member_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".SelectOpenBanking",
					member_id);
		} finally {
			sqlSession.close();
		}

	}

	/*	public OpenBankingDTO SelectId(String string) {
			SqlSession sqlSession = getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectOne(namespace + ".SelectId", string);
			} finally {
				sqlSession.close();
			}
		}
		public OpenBankingDTO SelectPw(String string) {
			SqlSession sqlSession = getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectOne(namespace + ".SelectPw", string);
			} finally {
				sqlSession.close();
			}
		}
		public OpenBankingDTO SelectBalance(int i) {
			SqlSession sqlSession = getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectOne(namespace + ".SelectBalance", i);
			} finally {
				sqlSession.close();
			}
		}*/

	/* 잔액모으기(출금계좌) */
	public Integer WithdrawOpenBanking(int money, String member_id,
			String OPEN_ACCOUNT_PW) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".WithdrawOpenBanking";
			map.clear();
			map.put("money", money);
			map.put("member_id", member_id);
			map.put("OPEN_ACCOUNT_PW", OPEN_ACCOUNT_PW);
			int result = sqlSession.update(statement, map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 1;
	}

	/* 잔액모으기(입금계좌) */
	public Integer DepositOpenBanking(String account_num, int money) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".DepositOpenBanking";
			map.clear();
			map.put("account_num", account_num);
			map.put("money", money);
			int result = sqlSession.update(statement, map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 1;
	}

	public String checkaccount(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".checkaccount", id);
		} finally {
			sqlSession.close();
		}
	}
	public List<OpenBankingDTO> selectList(String account, String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			List<OpenBankingDTO> list = sqlSession
					.selectList(namespace + ".SelectList", id);
			return list;
		} finally {
			sqlSession.close();
		}
	}

	/* 거래내역 등록 */
	public Integer WithdrawLog(String member_id, String account, int total) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.put("member_id", member_id);
		map.put("account_num", account);
		map.put("money", total);
		int result = 0;
		try {
			String statement = namespace + ".WithdrawLog";
			result = sqlSession.insert(statement, map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 1;
	}

	/* 거래내역 */
	public List<InstantDTO> SelectWithdrawLog(String member_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".SelectWithdrawLog",
					member_id);
		} finally {
			sqlSession.close();
		}
	}

	/*메인화면 총액*/
	public int TotalOpenBalance(String member_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".TotalOpenBalance",
					member_id);
		} finally {
			sqlSession.close();
		}

	}

}
