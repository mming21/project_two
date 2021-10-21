package users;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UsersDAO {
	public List<UsersVO> getUsersList();
	public String getTitle();
	public List<UsersVO> getSearchList();
	public List<UsersVO> getStudyinfoList();
	public List<UsersVO> getWord(String word);
	public void boardDelete(String delete);
//	public List<UsersVO> getWord(String word);
}
