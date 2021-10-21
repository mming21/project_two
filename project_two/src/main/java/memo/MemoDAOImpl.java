package memo;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
@Primary
public class MemoDAOImpl implements MemoDAO {
	
	@Autowired
	MemoDAO dao;
	
	@Override
	public void saveMemo(MemoVO vo){
		dao.saveMemo(vo);
	}
	
	@Override
	public void deleteMemo(String id, String num){
		dao.deleteMemo(id, num);
	}

}
