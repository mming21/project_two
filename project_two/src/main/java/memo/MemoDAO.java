package memo;

public interface MemoDAO {	
	public void saveMemo(MemoVO vo);
	public void deleteMemo(String id, String num);		
}
