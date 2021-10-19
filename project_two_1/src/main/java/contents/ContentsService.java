package contents;

import java.util.List;

public interface ContentsService {
	/*전체정보 조회*/
	public List<ContentsVO> contentsList();
	
	/*contents 타이틀 정보*/
	public List<ContentsVO> contentsOne(String content_title);
	
}
