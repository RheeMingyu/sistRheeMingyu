package spring.mvc.reboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		return session.selectOne("board.getTotalCountOfReboard");
	}

	@Override
	public int getMaxNum() {
		return session.selectOne("maxNumOfReboard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("updateStepOfReboard", map);
	}

	@Override
	public void insertReboard(BoardDto dto) {
		
		int num=dto.getNum(); //String이면 null이냐 아니냐,int면 0이냐 아니냐
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) {
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}
		else {
			//같은 그룹중 잔달받은 restep보다 큰글들은 모두 +1
			this.updateRestep(regroup, restep);
			
			//전달받은 step과 level 모두 +1
			restep++;
			relevel++;
		}
		//바뀐값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		session.insert("insertOfReboard", dto);
	}

	@Override
	public List<BoardDto> getPagingList(int start, int perPage) {
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perPage", perPage);
		
		return session.selectList("selectPagingOfReboard", map);
	}

	@Override
	public BoardDto getContent(int num) {
		return session.selectOne("board.selectContent", num);
	}

}
