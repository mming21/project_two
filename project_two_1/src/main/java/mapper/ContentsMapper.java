package mapper;

import java.util.List;

import contents.ContentsVO;

public interface ContentsMapper {

	/*이미지 데이터 반환*/
	public List<ContentsVO> contentsList(String content_title);
}
