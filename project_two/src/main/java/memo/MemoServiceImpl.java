package memo;

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
	public void deleteMemo(String id, String num) {
		dao.deleteMemo(id, num);
	}

}
