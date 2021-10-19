package contents;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("service")
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	ContentsDAO dao;
	
	public List<ContentsVO> contentsList() {
		List<ContentsVO> list = dao.contentsList();
		return list;

	}


	@Override
	public List<ContentsVO> contentsOne(String content_title) {
		List<ContentsVO> title = dao.contentsOne(content_title);
		return title;
	}
	


}
        

