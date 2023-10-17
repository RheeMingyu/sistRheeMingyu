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
		
		int num=dto.getNum(); //String�̸� null�̳� �ƴϳ�,int�� 0�̳� �ƴϳ�
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) {
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}
		else {
			//���� �׷��� �ܴ޹��� restep���� ū�۵��� ��� +1
			this.updateRestep(regroup, restep);
			
			//���޹��� step�� level ��� +1
			restep++;
			relevel++;
		}
		//�ٲﰪ���� �ٽ� dto�� ��´�
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
	public BoardDto getData(int num) {
		return session.selectOne("board.getData", num);
	}

	@Override
	public void updateViewcount(int num) {
		session.update("board.updateViewcount", num);
	}

	@Override
	public int authentification(int num, int pass) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("num", num);
		map.put("pass", pass);

		return session.selectOne("board.authentification", map);
	}

	@Override
	public void deleteData(int num) {
		session.delete("deleteOfReboard", num);
	}

	@Override
	public void updateData(BoardDto dto) {
		session.update("updateOfReboard", dto);
	}

	@Override
	public int getNextRestep(BoardDto dto) {
		return session.selectOne("board.nextRestep", dto);
	}

	@Override
	public void deleteCascade(BoardDto dto) {
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		int pointValue=(getNextRestep(dto)==0?0:getNextRestep(dto));
		map.put("pointValue", getNextRestep(dto)-1);
		map.put("restep", dto.getRestep());
		map.put("relevel", dto.getRelevel());
		map.put("regroup", dto.getRegroup());
		
		session.delete("deleteChildren", map);
	}

}
