package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	   public String stockinput()   { 
	         
	      return  "stock/stockinput"; 
	   } 

	 @RequestMapping("stockgraph")
	   public String stockgraph(String stockname,HttpServletRequest request,Model m) throws RserveException   { 
	      System.out.println(stockname);
	      RConnection c = new RConnection();
	      
	      StockDAO stockDAO=new StockDAO();
	      String excode=stockDAO.searchstock(stockname);
	      
	      System.out.println(excode);
	      
	      String daily_chart = request.getServletContext().getRealPath("/")+"images\\daily_chart.jpg";
	      daily_chart=daily_chart.replace("\\", "/");
	      System.out.println("차트: "+daily_chart);
	      
	      String range_chart = request.getServletContext().getRealPath("/")+"images\\range_chart.jpg";
	      range_chart=range_chart.replace("\\", "/");
	      System.out.println("차트: "+range_chart);
	      
	      String sum_chart = request.getServletContext().getRealPath("/")+"images\\sum_chart.jpg";
	      sum_chart=sum_chart.replace("\\", "/");
	      System.out.println("차트: "+sum_chart);
	      
	      String risk_chart = request.getServletContext().getRealPath("/")+"images\\risk_chart.jpg";
	      risk_chart=risk_chart.replace("\\", "/");
	      System.out.println("차트: "+risk_chart);
	       c.eval("library(xts)");
	       c.eval("library(quantmod)");
	       c.eval("library(gridExtra)");
	       c.eval("library(ggplot2)");
	       c.eval("library(scales)");
	       c.eval("library(lubridate)");
	       c.eval("library(PerformanceAnalytics)");
	       
	       c.eval("stock<-getSymbols('"+excode+".KS',from='2020-01-01',to='2020-10-23',auto.assign=FALSE)");
	       c.eval("stock<-adjustOHLC(stock,use.Adjusted=T)");
	       c.eval("stock<-stock[Vo(stock)>0]");
	       c.eval("colnames(stock)<-c('open','high','low','close','volume','adjusted')");
	       c.eval("stock<-stock[Vo(stock)>0]");
	       c.eval("stock$rtn<-ROC(Cl(stock))");
	       c.eval("stock<-na.omit(stock)");
	       
	       //c.eval("path<-\"C:/Users/data/final/test.jpg\"");
	       //일일 그래프 
	       System.out.println("path<-\""+daily_chart+"\""+ "");
	       
	       c.eval("path<-\""+daily_chart+"\""+ "");       
	       c.eval("png(path,width=1000,height=500,unit=\"px\")");
	       c.eval("par(mfrow=c(1,1))");
	       c.eval("a<-SMA(samsung$close,10)");
	       c.eval("b<-SMA(samsung$close,30)");
	       c.eval("chartSeries(stock,up.col='red',dn.col='blue',theme='white',name=\"stock\",TA=list(\"addBBands()\",\"addTA(a,col=5)\",\"addTA(b,col=4,on=2)\"))");
	       c.eval("addSMA(10,col='red');");
	       c.eval("addSMA(30,col='blue');");
	       c.eval("dev.off()");
	       
	       System.out.println("path<-\""+range_chart+"\""+ "");
	       
	       c.eval("path<-\""+range_chart+"\""+ "");       
	       c.eval("png(path,width=1000,height=500,unit=\"px\")");
	       c.eval("par(mfrow=c(1,1))");
	       c.eval("chartSeries(stock,up.col='red',dn.col='blue',theme='white',name=\"stock\",TA=\"addMACD()\")");
	       c.eval("dev.off()");
	       
	       System.out.println("path<-\""+sum_chart+"\""+ "");
	       
	       c.eval("path<-\""+sum_chart+"\""+ "");       
	       c.eval("png(path,width=1000,height=500,unit=\"px\")");
	       c.eval("par(mfrow=c(1,1))");
	       c.eval("portCumRet<-exp(cumsum(stock$rtn))");
	       c.eval("chartSeries(portCumRet,up.col='red',dn.col='blue',theme='white',name=\""+excode+"\""+")");
	       c.eval("dev.off()");
	       
	       System.out.println("path<-\""+risk_chart+"\""+ "");
	       
	       c.eval("path<-\""+risk_chart+"\""+ "");       
	       c.eval("png(path,width=1000,height=500,unit=\"px\")");
	       c.eval("par(mfrow=c(1,1))");
	       c.eval("table.Drawdowns(stock$rtn,top=10)");
	       c.eval("table.DownsideRisk(stock$rtn)");
	       c.eval("charts.PerformanceSummary(stock$rtn)");
	       c.eval("dev.off()");
	       
	       m.addAttribute("stock", stockname);
	       
	      return  "stock/stockgraph"; 
	   } 

}

