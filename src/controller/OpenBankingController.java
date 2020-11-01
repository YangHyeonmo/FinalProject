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
import model.MemberDTO;
import model.OpenBankingDTO;
import model.ReservationDTO;
import service.AccountDAO;
import service.MemberMybatisDAO;
import service.OpenBankingDAO;
import service.ReservationDAO;
import util.SendMail;

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
	public String InsertOpenBankingProc(OpenBankingDTO op, Model m)
			throws Throwable {

		MemberMybatisDAO mdao = new MemberMybatisDAO();

		//1.회원인지 아닌지 확인
		MemberDTO mdto = mdao.getMember(op.getMember_id());
		System.out.println("member:" + mdto.getMember_address());
		if (!mdto.getMember_id().equals(null)) {
			//2. 회원인데 account가 없는 경우

			String open_account_no = (op.getNum1() + "-" + op.getNum2() + "-"
					+ op.getNum3());
			op.setOpen_account_no(open_account_no);
			opDTO = op;

			//이메일 인증 
			int random = (int) (Math.random() * 1000000) + 1;
			mdto = mdao.getMember(opDTO.getMember_id());

			SendMail send = new SendMail();
			send.send(mdto.getMember_email(), random);
			m.addAttribute("random", random);

			return "openbanking/view";
		}
		return "openbanking/view";

	}

	@RequestMapping("view")
	public String view(String member_id, Model m) {

		return "openbanking/view";
	}

	@RequestMapping("checknumber")
	public String checknumber(int random, int auth_num, Model m) {

		// 이후 세션으로 수정
		List<OpenBankingDTO> list = opDAO.SelectOpenBanking("vldrn7636");
		m.addAttribute("list", list);

		if (random == auth_num) {
			int result = opDAO.InsertOpenBanking(opDTO);
			return "openbanking/SelectOpenBanking";
		} else {
			m.addAttribute("error", 1);
			return "openbanking/SelectOpenBanking";
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
			m.addAttribute("error", 1);
			return "openbanking/DeleteOpenBankingProc";
		} else {
			m.addAttribute("error", 2);
			return "openbanking/DeleteOpenBankingProc";
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
			String open_account_pw, Model m) throws Throwable {

		String fromaccount = opDAO.checkaccount(member_id);

		List<OpenBankingDTO> list = opDAO.selectList(fromaccount, member_id);
		int total = list.size() * money;

		int result = opDAO.WithdrawOpenBanking(money, member_id,
				open_account_pw);
		if (result == 1) {
			opDAO.DepositOpenBanking(fromaccount, total);
			opDAO.WithdrawLog(member_id, fromaccount, total);
			m.addAttribute("error", 1);
			return "openbanking/CollectOpenBankingProc";
		} else {
			m.addAttribute("error", 2);
			return "openbanking/CollectOpenBankingProc";
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

		if (result == 1) {
			m.addAttribute("error", 1);
			return "openbanking/ReservationRegProc";
		} else {
			m.addAttribute("error", 2);
			return "openbanking/ReservationRegProc";
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

		if (result == 1) {
			m.addAttribute("error", 1);
			return "openbanking/ReservationDeleteProc";
		} else {
			m.addAttribute("error", 2);
			return "openbanking/ReservationDeleteProc";
		}

	}
}
