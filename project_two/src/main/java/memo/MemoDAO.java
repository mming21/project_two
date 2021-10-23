package memo;

import java.util.List;

public interface MemoDAO {	
	public void saveMemo(MemoVO vo);
	public List<MemoVO> memoList(String id, String num);		
}
