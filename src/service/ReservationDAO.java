package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import controller.AbstractMybatis;
import model.ReservationDTO;

@Service
public class ReservationDAO extends AbstractMybatis {

	private final String namespace = "ReservationMapper";

	HashMap<String, Object> map = new HashMap<String, Object>();

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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 1;
	}

	/* 예약 모으기 삭제 */
	public Integer ReservationDelete(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".ReservationDelete";
			int result = sqlSession.delete(statement, reservation);
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

	/* 예약 모으기 변경 */
	/*public Integer ReservationModify(ReservationDTO reservation) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".ReservationModify";
			int result = sqlSession.update(statement, reservation);
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
	}*/

	/* 예약 모으기 조회 */
	public List<ReservationDTO> SelectReservation(String member_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".SelectReservation",
					member_id);
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
