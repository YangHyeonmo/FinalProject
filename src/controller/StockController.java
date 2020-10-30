package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Controller;
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
	   public String stockgraph(String stockname,HttpServletRequest request) throws RserveException   { 
	      System.out.println(stockname);
	      RConnection c = new RConnection();
	      
	      StockDAO stockDAO=new StockDAO();
	      String excode=stockDAO.searchstock(stockname);
	      
	      System.out.println(excode);
	      
	      String path_chart = request.getServletContext().getRealPath("/")+"images\\chart.jpg";
	      path_chart=path_chart.replace("\\", "/");
	      System.out.println("Â÷Æ®: "+path_chart);
	      
	      String path_plot = request.getServletContext().getRealPath("/")+"images\\plot.jpg";
	      path_plot=path_plot.replace("\\", "/");
	      System.out.println("plot: "+path_plot);
	       c.eval("library(xts)");
	       c.eval("library(quantmod)");
	       c.eval("library(gridExtra)");
	       c.eval("library(ggplot2)");
	       c.eval("library(scales)");
	       c.eval("library(lubridate)");
	       //c.eval("getData<-function(x,from,to){ if(missing(from)){ stock<-getSymbols(paste(x,\".KS\",sep=\"\"),auto.assign=FALSE)} else if(missing(to)){ stock<-getSymbols(paste(x,\".KS\",sep=\"\"),from=from,auto.assign=FALSE) }else{ stock<-getSymbols(paste(x,\".KS\",sep=\"\",from=from,to=to ,auto.assign=FALSE)} stock<-adjustOHLC(stock,use.Adjested=T) stock<-stock[Vo(stock)>0] colnames(stock)<-c('open','high','low','close','volume','adjusted') return(stock)}");
	       
	       //c.eval("samsung<-getData('035420','2020-01-01','2020-10-23'");
	       //c.eval("samsung<-samsung[Vo(samsung)>1]");
	       //c.eval("samsung$rtn<-ROC(Cl(samsung)");
	       //c.eval("samsung<-na.omit(samsung)");
	    
	       c.eval("stock<-getSymbols('"+excode+".KS',from='2020-01-01',to='2020-10-23',auto.assign=FALSE)");
	       c.eval("stock<-adjustOHLC(stock,use.Adjusted=T)");
	       c.eval("stock<-stock[Vo(stock)>0]");
	       c.eval("colnames(stock)<-c('open','high','low','close','volume','adjusted')");
	       c.eval("stock<-stock[Vo(stock)>0]");
	       c.eval("stock$rtn<-ROC(Cl(stock))");
	       c.eval("stock<-na.omit(stock)");
	       
	       //c.eval("path<-\"C:/Users/data/final/test.jpg\"");
	       System.out.println("path<-\""+path_chart+"\""+ "");
	       c.eval("path<-\""+path_chart+"\""+ "");       
	       c.eval("png(path)");
	       c.eval("par(mfrow=c(4,1))");
	       //c.eval("plot(stock$close,type=\"l\",col='blue',main='2020',cex.main=1)");
	       //c.eval("plot(stock$rtn*100,type=\"l\",col='red',main='2020',cex.main=1)");
	       //c.eval("plot(density(stock$rtn),type=\"l\",col='purple',main='2020',cex.main=1)");
	       //c.eval("plot(stock$volume['2020-01-01::'],col='blue',theme='white',name='stock')");
	       //c.eval("dev.off()");
	       c.eval("chartSeries(stock,up.col='red',dn.col='blue',theme='white',name=\"stock\")");
	       c.eval("addMACD();");
	       c.eval("addBBands();");
	       c.eval("addSMA(10);");
	       c.eval("addSMA(30,col='blue');");
	       c.eval("dev.off()");
	       
	       c.eval("path<-\""+path_plot+"\""+ "");       
	       c.eval("png(path)");
	       c.eval("par(mfrow=c(4,1))");
	       c.eval("plot(stock$close,type=\"l\",col='blue',main='2020',cex.main=1)");
	       c.eval("plot(stock$rtn*100,type=\"l\",col='red',main='2020',cex.main=1)");
	       c.eval("plot(density(stock$rtn),type=\"l\",col='purple',main='2020',cex.main=1)");
	       c.eval("plot(stock$volume['2020-01-01::'],col='blue',theme='white',name='stock')");
	       c.eval("dev.off()");
	      return  "stock/stockgraph"; 
	   } 

}

