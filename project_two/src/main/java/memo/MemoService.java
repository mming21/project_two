package memo;

import java.util.List;

public interface MemoService {
	
	public void saveMemo(MemoVO vo);
	public List<MemoVO> memoList(String id, String num);

}
