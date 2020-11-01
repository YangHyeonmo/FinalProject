package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.ExchangeDTO;
import service.ExchangeDAO;

@Controller
@RequestMapping("/exchange/")
public class ExchangeController {
	private String exc_Money = "";
	private String country = "";

	@Autowired
	ExchangeDAO ex;
	
	
	@RequestMapping("exchangeForm")
	public String exchangeForm(Model m) throws Exception {
	      SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
	      Calendar cal = Calendar.getInstance();
	      cal.add(cal.DATE, -1);
	      String yesterday = date.format(cal.getTime());
	      
	      String str;
	      Map<String, Double> sell = new HashMap<>();
	      Map<String, Double> buy = new HashMap<>();
	      String[] cuList = { "USD", "JPY", "EUR" };
	      double currency = 0.0;
	      String address = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=f5IPSrHZYhzRp9hykkOyZijcMwDv0oNw&searchdate=20201028&data=AP01";
	      BufferedReader br;
	      URL url;
	      HttpURLConnection conn;

	      url = new URL(address);
	      conn = (HttpURLConnection) url.openConnection();
	      conn.setRequestMethod("GET");
	      br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	      str = br.readLine();
	      /* 데이터 mapping start */
	      for (int i = 0; i < cuList.length; i++) {
	         String[] tList = str.split(cuList[i]);
	         tList = tList[1].split("\"tts\":\"");
	         tList = tList[1].split("\"");
	         String temp = tList[0].replace(",", "");
	         currency = Double.parseDouble(temp);
	         sell.put(cuList[i], currency);
	      }
	      for (int i = 0; i < cuList.length; i++) {
	         String[] tList = str.split(cuList[i]);
	         tList = tList[1].split("\"ttb\":\"");
	         tList = tList[1].split("\"");
	         String temp = tList[0].replace(",", "");
	         currency = Double.parseDouble(temp);
	         buy.put(cuList[i], currency);
	      }
	      /*----------------- end ---------------------*/
	      m.addAttribute("sell", sell);
	      m.addAttribute("buy", buy);
	
		return "exchange/exchangeForm";
	}

	@RequestMapping("exchangeMyMoney")
	public String exchangeMyMoney(@RequestParam String cur_unit, Model m) throws Exception {

		m.addAttribute("cur_unit", cur_unit);
		return "exchange/exchangeMyMoney";
	}

	@RequestMapping("exchangeMoney")
	@ResponseBody
	public String exchangeMoney(String cur_unit, long kor_money, Model m) throws Exception {

		String str;
		Map<String, Double> unit = new HashMap<>();
		String[] cuList = { "AED", "AUD", "BHD", "BND", "CAD", "CHF", "CNH", "DKK", "EUR", "GBP", "HKD", "IDR", "JPY",
				"KRW", "KWD", "MYR", "NOK", "NZD", "SAR", "SEK", "SGD", "THB", "USD" };
		double currency = 0.0;
		String address = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=f5IPSrHZYhzRp9hykkOyZijcMwDv0oNw&searchdate=20201028&data=AP01";
		BufferedReader br;
		URL url;
		HttpURLConnection conn;

		double money = 0;

		url = new URL(address);
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		str = br.readLine();
		/* 데이터 mapping start */
		for (int i = 0; i < cuList.length; i++) {
			String[] tList = str.split(cuList[i]);
			tList = tList[1].split("\"deal_bas_r\":\"");
			tList = tList[1].split("\"");
			String temp = tList[0].replace(",", "");
			currency = Double.parseDouble(temp);
			unit.put(cuList[i], currency);
		}
		/*----------------- end ---------------------*/

		for (Entry<String, Double> elem : unit.entrySet()) {
			if (cur_unit.equals("JPY")) {
				if (elem.getKey().equals(cur_unit)) {
					money = ((kor_money / elem.getValue()) * 100);
				}
			} else if (elem.getKey().equals(cur_unit)) {
				money = (kor_money / elem.getValue());
			}
		}

		double val = Math.round(money * 100) / 100f;
		exc_Money = String.format("%.2f", val);
		country = cur_unit;

		return exc_Money;
	}

	@RequestMapping("saveMyExchangeMoney")
	public String saveMyExchangeMoney(String member_id, long kor_money, String exc_name, String zipcode, Model m)
			throws Exception {
		System.out.println("=======================================private");
		System.out.println(exc_Money);
		System.out.println(country);
		System.out.println("=======================================");

		m.addAttribute("member_id", member_id);
		m.addAttribute("cur_unit", country);
		m.addAttribute("kor_money", kor_money);
		m.addAttribute("exc_money", exc_Money);
		m.addAttribute("exc_name", exc_name);
		m.addAttribute("zipcode", zipcode);

		ex.insertExchange(member_id, country, kor_money, exc_Money, exc_name, zipcode);

		return "exchange/exchangePro";

	}

	
	@RequestMapping("exchangeShow")
	public String selectExc(String member_id, Model m) throws Exception {
		List<ExchangeDTO> sel = new ArrayList<ExchangeDTO>();
		sel = ex.selectExchange(member_id);
		m.addAttribute("member_id", member_id);
		m.addAttribute("sel", sel);

		return "exchange/exchangeShow";
	}

	@RequestMapping("exchangePage")
	public String exchangePage() throws Exception {
		return "exchange/exchangePage";
	}
	

	
	
	
	
	
	
}