package study;

import java.util.List;

public interface StudyDAO {	
	public void saveStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList();	
	public String getStudyId();
	public void updateStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList2(String title, String member_id);	
}
