package users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userservice")
public class UsersServiceImpl implements UsersService{
	@Autowired
	UsersDAO dao;

	@Override
	public List<StudyInfoVO> UsersList() {
		List<StudyInfoVO> list = (List<StudyInfoVO>) dao.getUsersList();
		return list;
	}

	@Override
	public StudyInfoVO deleteBoard() {
		return null;
	}

	@Override
	public List<StudyInfoVO> getWord(StudyInfoVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTitle() {
		String title = dao.getTitle();
		return title;
	}

	@Override
	public List<StudyInfoVO> getSearchList() {
		List<StudyInfoVO> titlelist = (List<StudyInfoVO>)dao.getSearchList();
		return titlelist;
	}

	@Override
	public List<StudyInfoVO> StudyinfoList() {
		List<StudyInfoVO> studyinfolist = (List<StudyInfoVO>) dao.getStudyinfoList();
		return studyinfolist;
	}

	@Override
	public List<StudyInfoVO> getWord(String title, String member_id) {
		List<StudyInfoVO> searchlist = (List<StudyInfoVO>) dao.getWord(title, member_id);
		return searchlist;
	}

	@Override
	public void boardDelete(String title) {
		dao.boardDelete(title);
	}

	
	
	
	
	
	
}
