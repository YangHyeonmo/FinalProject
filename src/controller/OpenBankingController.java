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
import service.OpenBankingDAO;

@Controller
@RequestMapping("/openbanking")
public class OpenBankingController {

	@Autowired
	public OpenBankingDAO opDAO = new OpenBankingDAO();
	public OpenBankingDTO opDTO = new OpenBankingDTO();
	public InstantDTO iDTO = new InstantDTO();

	@ModelAttribute
	public void headProcess(HttpServletRequest request,
			HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
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
			return "openbanking/InsertOpenBanking";
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

		if (result == 1) { //유효성 검사 필요
			return "openbanking/DeleteOpenBankingProc";
		} else {
			return "openbanking/DeleteOpenBanking";
		}
	}

	//오픈뱅킹 계좌 조회
	@RequestMapping("SelectOpenBanking")
	public String SelectOpenBanking(OpenBankingDTO opDTO, Model m)
			throws Exception {

		List<OpenBankingDTO> list = opDAO.SelectOpenBanking("vldrn7636"); // 이후 세션으로 수정
		//List<OpenBankingDTO> list = opDAO.SelectOpenBanking("adkingdom7");

		m.addAttribute("list", list);

		return "openbanking/SelectOpenBanking";
	}

	//입금,출금,기록
	@RequestMapping("CollectOpenBanking")
	public String CollectOpenBanking() throws Throwable {
		return "openbanking/CollectOpenBanking";
	}
	@RequestMapping("CollectOpenBankingProc")
	public String CollectOpenBankingProc(int money, String MEMBER_ID,
			String OPEN_ACCOUNT_PW, Model m) throws Throwable {

		String fromaccount = opDAO.checkaccount(MEMBER_ID);

		List<OpenBankingDTO> list = opDAO.selectList(fromaccount, MEMBER_ID);
		int total = list.size() * money;

		opDAO.WithdrawLog(MEMBER_ID, fromaccount, total);

		opDAO.WithdrawOpenBanking(money, MEMBER_ID, OPEN_ACCOUNT_PW);

		opDAO.DepositOpenBanking(fromaccount, total);

		return "openbanking/CollectOpenBankingProc";
		/*if (coltype == 1) {
			return "openbanking/CollectOpenBankingProc";
		} else {
			return "openbanking/CollectOpenBankingProc";
		}*/
	}

}
