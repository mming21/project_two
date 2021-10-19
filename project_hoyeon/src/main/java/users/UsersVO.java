package users;

import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class UsersVO {
	String id;
	String pw;
	String name;
	String email;
	String phone_number;
	String nickname;
	//ArrayList<UsersVO> UsersList;
	List<UsersVO> UsersList;
	List<UsersVO> SearchList;
	
	public List<UsersVO> getSearchList() {
		return SearchList;
	}
	public void setSearchList(List<UsersVO> searchList) {
		SearchList = searchList;
	}
	public List<UsersVO> getUsersList() {
		return UsersList;
	}
	public void setUsersList(List<UsersVO> usersList) {
		UsersList = usersList;
	}
	String member_id;
	int study_id;
	String title;
	String shadowfile;
	String text;
	String study_date;
//	String word2;
//	public String getWord() {
//		return word2;
//	}
//	public void setWord(String word) {
//		this.word2 = word2;
//	}
	//	List<UsersVO> word;
//	
//	public List<UsersVO> getWord() {
//		return word;
//	}
//	public void setWord(List<UsersVO> word) {
//		this.word = word;
//	}
	List<UsersVO> StudyinfoList;
	
	public List<UsersVO> getStudyinfoList() {
		return StudyinfoList;
	}
	public void setStudyinfoList(List<UsersVO> studyinfoList) {
		StudyinfoList = studyinfoList;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShadowfile() {
		return shadowfile;
	}
	public void setShadowfile(String shadowfile) {
		this.shadowfile = shadowfile;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getStudy_date() {
		return study_date;
	}
	public void setStudy_date(String study_date) {
		this.study_date = study_date;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
//	public ArrayList<UsersVO> getUserslist() {
//		return UsersList;
//	}
//	public void setUserslist(ArrayList<UsersVO> UsersList) {
//		this.UsersList = UsersList;
//	}

	
	
}
