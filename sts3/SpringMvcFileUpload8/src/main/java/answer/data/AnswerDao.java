package answer.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDao implements AnswerDaoInter{

	@Autowired
	private SqlSession session;

	@Override
	public void insertAnswer(AnswerDto dto) {
		session.insert("insertOfReanswer", dto);
	}

	@Override
	public List<AnswerDto> getAnswerList(int num) {
		return session.selectList("selectNumOfReanswer", num);
	}

	@Override
	public void controlViewcount(int num) {
		session.update("answer.updateViewcount", num);
	}

	@Override
	public int authentification(int idx, int pass) {
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("pass", pass);
		
		return session.selectOne("authentificationOfAnswer", map);
	}

	@Override
	public void deleteAnswer(int idx) {
		session.delete("deleteReanswer", idx);
	}
	
}
