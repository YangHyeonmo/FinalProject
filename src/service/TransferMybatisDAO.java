package service;



import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.AccountDTO;
import model.TransferDTO;



@Service
public class TransferMybatisDAO extends AbstractMybatis {

	String namespace = "Transfer";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	


	public int getTransListCount(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getTransListCount";
			String dbname="";
			if(num==1) {
				dbname="transfer";
				return (int)sqlSession.selectOne(statement,dbname);
			}else if(num==2) {
				dbname="transfer_auto";
				return (int)sqlSession.selectOne(statement,dbname);
			}if(num==3) {
				dbname="transfer_res";
				return (int)sqlSession.selectOne(statement,dbname);
			}
		} finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public List<String> getAccountNum(String id){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getAccountNum";
			return sqlSession.selectList(statement,id);
		}finally {
			sqlSession.close();
		}
		
	}
	
	/*public int getDeposit(String id){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getDeposit";
			return sqlSession.selectOne(statement,id);
		}finally {
			sqlSession.close();
		}
		
	}*/
	/*public boolean transferAutoInsert(TransferBean transfer) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement=namespace + ".getMaxNum";
			String dbname="transfer_auto";
			int number = sqlSession.selectOne(statement,dbname);
			if(number==0) {
				number=1;
			}
			
			statement=namespace+".insertTrans_Auto";
			int result= sqlSession.insert(statement);
			if(result!=0) {
				return true;
			}
			
			return false;
			
		}finally {
			sqlSession.close();
		}
	}*/
	
	public List<TransferDTO> dateTransList(String now_date,String select_date,String account_no){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		System.out.println(select_date + "" + now_date);
		map.clear();
		List<TransferDTO> transList=null;
		try {
			String statement=namespace+".dateTransList";
			map.put("select_date", select_date);
			map.put("now_date", now_date);
			map.put("account_no", account_no);
			transList=sqlSession.selectList(statement,map);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return transList;
	}
	public boolean check_account_no(String account_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement=namespace + ".check_account_no";
			AccountDTO account=sqlSession.selectOne(statement,account_no);
			if(account!=null) {
				return true;
			}		
			return false;
		}finally {
			sqlSession.close();
		}
	}
	
	public TransferDTO transferDetail(int transfer_no,int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		TransferDTO transferdata=new TransferDTO();
		String dbname="";
		map.clear();
		try {
			
			String statement=namespace+".transferDetail";
			if(num==1) {
				dbname="TRANSFER";
				map.put("dbname", dbname);
				map.put("transfer_no", transfer_no);
				transferdata=sqlSession.selectOne(statement,map);
				
			}else if(num==2) {
				dbname="TRANSFER_AUTO";
				map.put("dbname", dbname);
				map.put("transfer_no", transfer_no);
				transferdata=sqlSession.selectOne(statement,map);
			}else if(num==3) {
				dbname="TRANSFER_RES";
				map.put("dbname", dbname);
				map.put("transfer_no", transfer_no);
				transferdata=sqlSession.selectOne(statement,map);
			}
			return transferdata;
		}finally {
			sqlSession.close();
		}
		
	}
	
	public int updateMoney(String account_no, int money, int updatenum) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement=namespace+".updateMoney";
		String operation="";
		int x=0;
		map.clear();
		try {
			if(updatenum==1) {
				operation="-";
				map.put("operation", operation);
				map.put("money", money);
				map.put("account_no", account_no);
				x=sqlSession.update(statement,map);
			}else if(updatenum==2) {
				operation="+";
				map.put("operation", operation);
				map.put("money", money);
				map.put("account_no", account_no);
				x=sqlSession.update(statement,map);
			}
			sqlSession.commit();
		}finally {
			sqlSession.close();
		}
		return x;
	}
	//여쭤보기
	public boolean check_account_money(String account_no,int account_money) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement=namespace + ".check_account_no";
			AccountDTO account=sqlSession.selectOne(statement,account_no);
			if(account.getDeposit()>account_money) {
				return true;
			}
			
		}finally {
			sqlSession.close();
		}
		return false;
	}
	
	public boolean transferInsert(TransferDTO transfer,int transfernum) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result=0;
		int num=0;
		boolean b_result=false;
		try {
			String statement=namespace + ".getMaxNum";
			String dbname="";	
			if(transfernum==1) {
				dbname="transfer";
				num= (int)sqlSession.selectOne(statement,dbname)+1;	
				transfer.setNum(num);
				statement=namespace+".insert_Transfer";
				result=sqlSession.insert(statement,transfer);
			}else if(transfernum==2) {
				dbname="transfer_AUTO";
				num= (int)sqlSession.selectOne(statement,dbname)+1;
				transfer.setNum(num);
				statement=namespace+".insertTrans_Auto";
				result=sqlSession.insert(statement,transfer);
			}else if(transfernum==3) {
				dbname="transfer_RES";
				num= (int)sqlSession.selectOne(statement,dbname)+1;
				transfer.setNum(num);
				statement=namespace+".insertTrans_Res";
				result=sqlSession.insert(statement,transfer);
			}
			sqlSession.commit();
			if(result!=0) {
				b_result=true;
			}
		}finally {
			sqlSession.close();
		}
		return b_result;
	}

	

	
	
	
}
