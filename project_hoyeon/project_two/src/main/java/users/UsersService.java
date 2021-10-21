package users;

import java.util.List;

public interface UsersService {
	public List<UsersVO> UsersList();
	public UsersVO deleteBoard();
	public String getTitle();
	public List<UsersVO> getSearchList();
	public List<UsersVO> StudyinfoList();
	public List<UsersVO> getWord(String word);
//	public boardDelete(String delete);
	public void boardDelete(String string);
//	public List<UsersVO> getWord(String word);
}
