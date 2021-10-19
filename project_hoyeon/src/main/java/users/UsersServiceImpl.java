package users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("service")
public class UsersServiceImpl implements UsersService{
	@Autowired
	UsersDAO dao;

	@Override
	public List<UsersVO> UsersList() {
		List<UsersVO> list = (List<UsersVO>) dao.getUsersList();
		return list;
	}

	@Override
	public UsersVO deleteBoard() {
		return null;
	}

	@Override
	public String getTitle() {
		String title = dao.getTitle();
		return title;
	}

	@Override
	public List<UsersVO> getSearchList() {
		List<UsersVO> titlelist = (List<UsersVO>)dao.getSearchList();
		return titlelist;
	}

	@Override
	public List<UsersVO> StudyinfoList() {
		List<UsersVO> studyinfolist = (List<UsersVO>) dao.getStudyinfoList();
		return studyinfolist;
	}

//	@Override
//	public String getWord() {
//		String word = dao.getWord();
//		return word;
//	}
	
	@Override
	public List<UsersVO> getWord(String word) {
		List<UsersVO> searchlist = dao.getWord(word);
		return searchlist;
	}
	
//	@Override
//	public List<UsersVO> getWord(String word) {
//		List<UsersVO> searchlist = dao.getWord(word);
//		return searchlist;
//	}
	
	
	
	
	
	
}
