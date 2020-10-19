package member;


import java.util.*;

import org.apache.ibatis.session.SqlSession;

public class MemberMybatisDAO extends AbstractMybatis{
		String namespace = "Member";
		HashMap<String, Object> map = new HashMap<String, Object>();
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		public int insertMember(MemberDTO member) throws Exception {
			try {
				int result = sqlSession.insert(namespace +".insertMember", member);
				//int result = sqlSession.insert(namespace +".test");
				System.out.println("insert ok: " + result);
			}  catch (Exception  e) {
		         e.printStackTrace();
		      }finally {
		    	sqlSession.commit();
				sqlSession.close();
			}
			return 1;
		}
		
		public int loginMember(String member_id, String member_password) throws Exception{
			int x = 0;
			try {
				String pass = sqlSession.selectOne(namespace +".findPwd", member_id);
				if(pass.equals(member_password)) {
					x = 1;
				}
				else {
					x = 0;
				}
				System.out.println("insert ok: " + pass);
			}  catch (Exception  e) {
		         e.printStackTrace();
		      }
			return x;
		}

		public MemberDTO getMember(String member_id) throws Exception{
			try {
				return sqlSession.selectOne(namespace +".getAllInfo", member_id);
			}  finally {
				sqlSession.close();
			}
		}
		
		public int memberIdCheck(String member_id) {
			int result=0;
			try {
				result = sqlSession.selectOne(namespace +".checkId", member_id);
				if(result == 1) {
					return result;
				}
			}catch (Exception  e) {
		         e.printStackTrace();
		      }finally {
		    	sqlSession.commit();
				sqlSession.close();
			}
			return result;
		}
		

		public int updateMember(MemberDTO member) throws Exception{
			int result = 0;
			try {
				sqlSession.update(namespace +".update", member); 
				result = 1;
			}  finally {
				sqlSession.commit();
				sqlSession.close();
			}
			return result;
		}
		public int deleteMember(String member_id) throws Exception{
			int result = 0;
			try {
				sqlSession.delete(namespace +".deleteMember", member_id); 
				result = 1;
			}  finally {
				sqlSession.commit();
				sqlSession.close();
			}
			return result;
		}
}
