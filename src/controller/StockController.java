package controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.StockDTO;
import service.StockDAO;

@Controller
@RequestMapping("/stock/")
public class StockController {

   public StockDTO stockDTO = new StockDTO();
   public StockDAO stockDAO = new StockDAO();

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

   @RequestMapping("stockinput")
   public String stockinput() {

      return "stock/stockinput";
   }

   @RequestMapping("stockgraph")
   public String stockgraph(String stockname, String startdate, String enddate,
         HttpServletRequest request, Model m)
         throws RserveException, REXPMismatchException, ParseException {
      RConnection c = new RConnection();
      REXP x = new REXP();
      StockDAO stockDAO = new StockDAO();
      String excode = stockDAO.searchstock(stockname);
      System.out.println(startdate + " : " + enddate);
      Date today = new Date();
      Date start = new SimpleDateFormat("yyyy-MM-dd").parse(startdate);
      Date end = new SimpleDateFormat("yyyy-MM-dd").parse(enddate);
      System.out.println(start + " " + end + " " + today);
      System.out.println(start.after(today) + " " + start.after(end) + " "
            + today.after(end));
      if (start.after(today)) {
         m.addAttribute("msg", 1);
         return "stock/stockinput";
      } else if (start.after(end)) {
         m.addAttribute("msg", 2);
         return "stock/stockinput";
      } else if (!today.after(end)) {
         m.addAttribute("msg", 3);
         return "stock/stockinput";
      }

      String daily_chart = request.getServletContext().getRealPath("/")
            + "images\\daily_chart.jpg";
      daily_chart = daily_chart.replace("\\", "/");
      System.out.println("  Ʈ: " + daily_chart);

      String range_chart = request.getServletContext().getRealPath("/")
            + "images\\range_chart.jpg";
      range_chart = range_chart.replace("\\", "/");
      System.out.println("  Ʈ: " + range_chart);

      String sum_chart = request.getServletContext().getRealPath("/")
            + "images\\chart_rank.jpg";
      sum_chart = sum_chart.replace("\\", "/");
      System.out.println("  Ʈ: " + sum_chart);

      String risk_chart = request.getServletContext().getRealPath("/")
            + "images\\risk_chart.jpg";
      risk_chart = risk_chart.replace("\\", "/");
      System.out.println("  Ʈ: " + risk_chart);
      c.eval("library(xts)");
      c.eval("library(quantmod)");
      c.eval("library(gridExtra)");
      c.eval("library(ggplot2)");
      c.eval("library(scales)");
      c.eval("library(lubridate)");
      c.eval("library(PerformanceAnalytics)");

      c.eval("stock<-getSymbols('" + excode + ".KS',from='" + startdate
            + "',to='" + enddate + "',auto.assign=FALSE)");
      c.eval("stock<-adjustOHLC(stock,use.Adjusted=T)");
      c.eval("stock<-stock[Vo(stock)>0]");
      c.eval("colnames(stock)<-c('open','high','low','close','volume','adjusted')");
      c.eval("stock<-stock[Vo(stock)>0]");
      c.eval("stock$rtn<-ROC(Cl(stock))");
      c.eval("stock<-na.omit(stock)");

      //      ׷    
      System.out.println("path<-\"" + daily_chart + "\"" + "");

      c.eval("path<-\"" + daily_chart + "\"" + "");
      c.eval("png(path,width=1000,height=500,unit=\"px\")");
      c.eval("par(mfrow=c(1,1))");
      c.eval("chartSeries(stock,up.col='red',dn.col='blue',theme='white',TA=list(\"addBBands()\",\"addMACD()\",\"addRSI()\"))");
      c.eval("dev.off()");

      c.eval("portCumRet<-exp(cumsum(stock$rtn))");
      c.eval("a<-portCumRet[length(portCumRet)]$rtn");
      x = c.eval("as.numeric(a$rtn)");
      double cumRet = x.asDouble();
      cumRet = Math.round(cumRet * 1000) / 1000.0;
      m.addAttribute("cumRet", cumRet); //        ͷ 

      c.eval("first_day<-stock$open[1]");
      x = c.eval("as.numeric(first_day)");
      int first_day = x.asInteger();
      m.addAttribute("first_day", first_day); //ù  

      c.eval("last_day<-stock$close[length(stock$close)]");
      x = c.eval("as.numeric(last_day)");
      int last_day = x.asInteger();
      m.addAttribute("last_day", last_day); // ι °  

      c.eval("macd<-MACD(stock$close)");
      c.eval("macd_m<-macd$macd[length(macd$macd)]");
      x = c.eval("as.numeric(macd_m)");
      double macd_m = x.asDouble();
      macd_m = Math.round(macd_m * 1000) / 1000.0;
      m.addAttribute("macd", macd_m); //macd
      System.out.println("path<-\"" + range_chart + "\"" + "");

      c.eval("macd<-MACD(stock$close)");
      c.eval("macd_s<-macd$signal[length(macd$signal)]");
      x = c.eval("as.numeric(macd_s)");
      double signal = x.asDouble();
      signal = Math.round(signal * 1000) / 1000.0;
      m.addAttribute("signal", signal); // ŵ   ñ׳ 
      System.out.println("path<-\"" + range_chart + "\"" + "");

      c.eval("path<-\"" + range_chart + "\"" + "");
      c.eval("png(path,width=1000,height=500,unit=\"px\")");
      c.eval("par(mfrow=c(1,1))");
      c.eval("chartSeries(stock,up.col='red',dn.col='blue',theme='white',TA=list(\"addBBands()\",\"addVo()\",\"addDPO()\"))");
      c.eval("dev.off()");

      c.eval("rsi<-RSI(stock$close)");
      c.eval("rsi<-rsi$rsi[length(rsi$rsi)]");
      x = c.eval("as.numeric(rsi)");
      double rsi = x.asDouble();
      rsi = Math.round(rsi * 1000) / 1000.0;
      m.addAttribute("rsi", rsi); // ż   ŵ      

      c.eval("dpo<-DPO(stock$close)");
      c.eval("dpo<-na.omit(dpo)");
      x = c.eval("sum(dpo[1:length(dpo)])*2");
      int dpo = x.asInteger();
      m.addAttribute("dpo", dpo); // ̵     

      System.out.println("path<-\"" + sum_chart + "\"" + "");

      c.eval("path<-\"" + sum_chart + "\"" + "");
      c.eval("png(path,width=1000,height=500,unit=\"px\")");
      c.eval("par(mfrow=c(1,1))");
      c.eval("df<-stock[,c(\"adjusted\",\"volume\",\"rtn\")]");
      c.eval("df$cuts2<-cut(df$rtn, breaks=c(-0.15,-0.05,-0.03,0,0.03,0.05,0.15),include.lowest = TRUE)");
      c.eval("df$means2<-NA");
      c.eval("for(i in 1:6){\n" + "  group<-which(df$cuts2==i)\n"
            + "  if(length(group)>0){\n"
            + "    df$means2[group]<-mean(df$volume[group])\n" + "  }\n"
            + "}");
      c.eval("df<-na.omit(df)");
      c.eval("p<-ggplot(df)+geom_histogram(aes(x=volume))+facet_grid(cuts2~.)+ geom_vline(aes(xintercept=means2), linetype=\"dashed\",size=1)");
      c.eval("print(p)");
      c.eval("dev.off()");

      System.out.println("path<-\"" + risk_chart + "\"" + "");

      c.eval("path<-\"" + risk_chart + "\"" + "");
      c.eval("png(path,width=1000,height=500,unit=\"px\")");
      c.eval("par(mfrow=c(1,1))");
      c.eval("charts.PerformanceSummary(cbind(dailyReturn(stock),stock$rtn))");
      c.eval("dev.off()");

      x = c.eval("maxDrawdown(stock$rtn)");
      double mdd = x.asDouble();
      mdd = Math.round(mdd * 1000) / 1000.0;
      m.addAttribute("stock", stockname);
      m.addAttribute("mdd", mdd);

      m.addAttribute("startdate", startdate);
      m.addAttribute("enddate", enddate);
      return "stock/stockgraph";
   }

   //   /*주식 조회 및 검색*/
   //   @RequestMapping("SelectStock1")
   //   public String SelectStock1(Model m) throws Throwable {
   //
   //      List<StockDTO> list = stockDAO.SelectStock1();
   //
   //      m.addAttribute("list", list);
   //      return "stock/SelectStock1";
   //   }

   /*주식 조회 및 검색*/
   @RequestMapping("SelectStock")
   public String SelectStock2(String exname, Model m) throws Exception {

      if (exname == null) {
         List<StockDTO> list = stockDAO.SelectStock1();
         m.addAttribute("list", list);
      } else {
         List<StockDTO> list = stockDAO.SelectStock2(exname);
         m.addAttribute("list", list);
      }

      return "stock/SelectStock";
   }

}