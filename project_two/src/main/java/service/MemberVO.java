package service;

public class MemberVO {
	String member_id;
	int member_pw;
	String member_name;
	String member_email;
	//생성자 정의
	//setter / getter
	//toString 오버라이딩
	//위의 3개 중 필요한거 해라.
	
	public MemberVO() {}//bean태그는 기본 생성자 사용. 그래서 없으면 오류 남
	
	public MemberVO(String member_id, int member_pw, String member_name, String member_email) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
	}
	
	
	
	public MemberVO(String member_id, int member_pw) {
		this.member_id = member_id;
		this.member_pw = member_pw;
	}

	@Override
	public String toString() {
		return "회원아이디=" + member_id + " 암호 ="+member_pw + " 이름="+member_name+" 이메일="+member_email+"<br>";
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(int member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	
	

}
