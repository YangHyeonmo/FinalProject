package service;


import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.MemberDTO;

@Service
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
		
		public int loginMember(String member_id, String member_pwdSecurity) throws Exception{
			int x = 0;
			try {
				String pass = sqlSession.selectOne(namespace +".findPwd", member_id);
				if(pass.equals(member_pwdSecurity)) {
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
		
		public String memberIdCheck(String member_id) {
			String result="Yes";
			try {
				int chk= sqlSession.selectOne(namespace +".checkId", member_id);
				
				if (chk == 1) {
					result = "No";
				}
				
				return result;
			}finally {
				
			}
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
		public String fineMemberId(String member_name, String member_email) throws Exception{
			try {
				map.clear();
				map.put("member_name", member_name);
				map.put("member_email", member_email);
				return sqlSession.selectOne(namespace +".findMemberId", map); 
				
			}  finally {
				sqlSession.close();
			}
			
		}
		public String findMemberPwd(String member_id, String member_email, String member_phonenumber) throws Exception{
			try {
				map.clear();
				map.put("member_id", member_id);
				map.put("member_email", member_email);
				map.put("member_phonenumber", member_phonenumber);
				return sqlSession.selectOne(namespace +".findMemberPwd", map); 
				
			}  finally {
				sqlSession.close();
			}
			
		}
		
}
