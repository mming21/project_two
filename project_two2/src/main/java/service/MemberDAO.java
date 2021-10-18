package service;

public class MemberDAO {
	MemberVO membervo;
	public void setMemberVO(MemberVO vo) {
		this.membervo = vo;//필드랑 매개변수 이름이 같지 않기에 굳이 this써줄 필요 없음.
	}

	public boolean selectMember() {
		if(membervo.getMember_id().equals("spring")
		&& membervo.getMember_pw()==1111) {
			return true;
		}return false;
	}
	public void insertMember() {
		System.out.println(membervo.getMember_id() +" 회원님 정상적으로 회원 가입되셨습니다.");
		
	}

}
