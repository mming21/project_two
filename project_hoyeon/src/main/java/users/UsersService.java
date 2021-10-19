package users;

import java.util.List;

public interface UsersService {
	public List<UsersVO> UsersList();
	public UsersVO deleteBoard();
	public String getTitle();
	public List<UsersVO> getSearchList();
	public List<UsersVO> StudyinfoList();
//	public String getWord();
	public List<UsersVO> getWord(String word);
//	public List<UsersVO> getWord(String word);
}
