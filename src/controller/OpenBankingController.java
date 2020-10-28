package controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AccountDTO;
import model.InstantDTO;
import model.OpenBankingDTO;
import model.ReservationDTO;
import service.OpenBankingDAO;
import service.ReservationDAO;

@Controller
@RequestMapping("/openbanking")
public class OpenBankingController {

	@Autowired
	public OpenBankingDAO opDAO = new OpenBankingDAO();
	public OpenBankingDTO opDTO = new OpenBankingDTO();
	public InstantDTO iDTO = new InstantDTO();
	public ReservationDTO rDTO = new ReservationDTO();
	public ReservationDAO rDAO = new ReservationDAO();

	public HttpSession session = null;

	@ModelAttribute
	public void headProcess(HttpServletRequest request,
			HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");
			session = request.getSession();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	//오픈뱅킹 계좌 등록
	@RequestMapping("InsertOpenBanking")
	public String InsertOpenBanking() throws Throwable {
		return "openbanking/InsertOpenBanking";
	}

	@RequestMapping("InsertOpenBankingProc")
	public String InsertOpenBankingProc(OpenBankingDTO opDTO, Model m)
			throws Throwable {

		int result = opDAO.InsertOpenBanking(opDTO);

		if (result == 1) { //유효성 검사 필요
			return "openbanking/InsertOpenBankingProc";
		} else {
			return "openbanking/error";
		}
	}

	//오픈뱅킹 계좌 삭제
	@RequestMapping("DeleteOpenBanking")
	public String DeleteOpenBanking() throws Throwable {
		return "openbanking/DeleteOpenBanking";
	}

	@RequestMapping("DeleteOpenBankingProc")
	public String DeleteOpenBankingProc(OpenBankingDTO opDTO, Model m)
			throws Throwable {

		int result = opDAO.DeleteOpenBanking(opDTO);

		if (result == 1) {
			return "openbanking/DeleteOpenBankingProc";
		} else {
			return "openbanking/error";
		}
	}

	//오픈뱅킹 계좌 조회
	@RequestMapping("SelectOpenBanking")
	public String SelectOpenBanking(OpenBankingDTO opDTO, Model m)
			throws Exception {

		String member_id = (String) session.getAttribute("member_id");

		List<OpenBankingDTO> list = opDAO.SelectOpenBanking(member_id);
		m.addAttribute("list", list);

		return "openbanking/SelectOpenBanking";
	}

	//입금,출금,기록
	@RequestMapping("CollectOpenBanking")
	public String CollectOpenBanking() throws Throwable {
		return "openbanking/CollectOpenBanking";
	}
	@RequestMapping("CollectOpenBankingProc")
	public String CollectOpenBankingProc(int money, String member_id,
			String OPEN_ACCOUNT_PW, Model m) throws Throwable {

		String fromaccount = opDAO.checkaccount(member_id);

		List<OpenBankingDTO> list = opDAO.selectList(fromaccount, member_id);
		int total = list.size() * money;

		opDAO.WithdrawLog(member_id, fromaccount, total);

		opDAO.WithdrawOpenBanking(money, member_id, OPEN_ACCOUNT_PW);

		int result = opDAO.DepositOpenBanking(fromaccount, total);

		if (result == 1) {
			return "openbanking/CollectOpenBankingProc";
		} else {
			return "openbanking/error";
		}
	}

	//거래 내역 조회
	@RequestMapping("SelectWithdrawLog")
	public String SelectWithdrawLog(InstantDTO iDTO, Model m) throws Exception {

		String member_id = (String) session.getAttribute("member_id");

		List<InstantDTO> list2 = opDAO.SelectWithdrawLog(member_id);
		System.out.println(list2);

		m.addAttribute("list2", list2);

		return "openbanking/SelectWithdrawLog";
	}

	//예약 모으기 등록
	@RequestMapping("ReservationReg")
	public String ReservationReg() throws Throwable {
		return "openbanking/ReservationReg";
	}
	@RequestMapping("ReservationRegProc")
	public String ReservationRegProc(ReservationDTO rDTO, Model m)
			throws Throwable {

		int result = rDAO.ReservationReg(rDTO);

		System.out.println(result);
		if (result == 1) { //유효성 검사 필요
			return "openbanking/ReservationRegProc";
		} else {
			return "openbanking/error";
		}
	}

	//예약 모으기 조회
	@RequestMapping("SelectReservation")
	public String SelectReservation(ReservationDTO rDTO, Model m)
			throws Exception {

		String member_id = (String) session.getAttribute("member_id");

		List<ReservationDTO> list = rDAO.SelectReservation(member_id);
		m.addAttribute("list", list);

		return "openbanking/SelectReservation";
	}

	//예약 모으기 삭제
	@RequestMapping("ReservationDelete")
	public String ReservationDelete() throws Throwable {
		return "openbanking/ReservationDelete";
	}
	@RequestMapping("ReservationDeleteProc")
	public String ReservationDeleteProc(ReservationDTO rDTO, Model m)
			throws Throwable {

		int result = rDAO.ReservationDelete(rDTO);

		if (result == 1) { //유효성 검사 필요
			return "openbanking/ReservationDeleteProc";
		} else {
			return "openbanking/error";
		}
	}
}
