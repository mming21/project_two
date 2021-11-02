package study;

import java.util.List;

public interface StudyService {	
	public void saveStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList();
	public String getStudyId();
	public void updateStudy(StudyInfoVO vo);
	//제목누르면 글쓰기 페이지 나오는 거
	public List<StudyInfoVO> studyList2(String title, String member_id);	
}
