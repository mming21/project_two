package memo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memoservice")
public class MemoServiceImpl implements MemoService {
	
	@Autowired
	MemoDAO dao;

	@Override
	public void saveMemo(MemoVO vo) {
		dao.saveMemo(vo);
	}

	@Override
	public List<MemoVO> memoList(String id, String num) {
		List<MemoVO> list = dao.memoList(id, num);
		return list; 
	}

}
