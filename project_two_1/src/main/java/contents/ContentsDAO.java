package contents;

import java.util.List; 

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContentsDAO {
	public List<ContentsVO> contentsList();
	
	public List<ContentsVO> contentsOne(String content_title);
	

	
}
