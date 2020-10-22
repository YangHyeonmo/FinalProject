package service;

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
import model.ReservationDTO;

public class ReservationDAO extends AbstractMybatis {
	private final String namespace = "ReservationMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();
	static Date date = new Date();
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	/* 예약 모으기 등록 */
	public Integer ReservationReg(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".ReservationReg";
			int result = sqlSession.insert(statement, reservation);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("등록 :" + result);
			return result;
		} finally {
			sqlSession.close();
		}
	}

	/* 예약 모으기 삭제 */
	public Integer DeleteOpenBanking(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".DeleteOpenBanking";
			int result = sqlSession.delete(statement, reservation);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("삭제 :" + result);
			return result;
		} finally {
			sqlSession.close();
		}
	}

	/* 예약 모으기 변경 */
	public Integer ReservationModify(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".ReservationModify";
			int result = sqlSession.update(statement, reservation);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			System.out.println("변경 :" + result);
			return result;
		} finally {
			sqlSession.close();
		}
	}

	/* 예약 모으기 조회 */
	public List<ReservationDTO> SelectReservation() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			List<ReservationDTO> list = sqlSession
					.selectList(namespace + ".SelectReservation");
			System.out.println("조회 :" + list.toString());
			return list;
		} finally {
			sqlSession.close();
		}

	}

	//////////////////////////////////////////////////////////////////////////////
	//////// 자동이체 실행 로직
	//////////////////////////////////////////////////////////////////////////////

	/* 예약 정보 조회 */
	public List<ReservationDTO> selectByDate() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<ReservationDTO> list = null;
		try {
			list = sqlSession.selectList(namespace + ".selectByDate");
			System.out.println("당일날짜 이체할 계좌 리턴====");
			System.out.println(list.toString());
			return list;
		} finally {
			sqlSession.close();
		}

	}

	/* 예약 모으기(출금계좌) */
	public void ReservationWithdraw(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".ReservationWithdraw";
			sqlSession.update(statement, reservation);
			System.out.println("출금 :" + reservation.toString());
			System.out.println("출금 :" + sqlSession);
		} finally {
			sqlSession.close();
		}
	}

	/* 예약 모으기(입금계좌) */
	public void Deposit(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".Deposit";
			sqlSession.update(statement, reservation);
			System.out.println("입금 :" + reservation.toString());
			System.out.println("입금 :" + sqlSession);
		} finally {
			sqlSession.close();
		}
	}

	/* 예약 모으기 마지막 날짜 */
	public void LastRunDate(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".LastRunDate";
			sqlSession.update(statement, reservation);
			System.out.println("LastRunDate :" + sqlSession);
		} finally {
			sqlSession.close();
		}
	}

	/*예약 모으기 거래내역 등록*/
	public Integer ReservationWithdrawLog(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".ReservationWithdrawLog";
			int result = sqlSession.insert(statement, reservation);;
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

}
