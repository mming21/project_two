package service;

public class MemberServiceImpl implements MemberService{
	MemberDAO dao;
	public void setMemberDAO(MemberDAO dao) {//return타입 없을 때 void
		this.dao = dao;
	}

	@Override
	public void register() {
		boolean result = dao.selectMember();//true(spring:1111)
		if(!result) {//result가 true가 아니면
			dao.insertMember();
		}
		
	}

	@Override
	public void login() {
		boolean result = dao.selectMember();
		if(result) {//result가 true
			System.out.println("정상 로그인 사용자");
		}
	}
	
}
