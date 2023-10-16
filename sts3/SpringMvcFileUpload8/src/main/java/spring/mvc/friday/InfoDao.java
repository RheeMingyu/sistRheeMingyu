package spring.mvc.friday;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao implements InfoInter {
	
	@Autowired
	SqlSession session;
	
	@Override
	public int getTotalCount() {
		return session.selectOne("selectTotalCountOfmyInfo");
	}

	@Override
	public void insertInfo(InfoDto dto) {
		session.insert("insertOfMyInfo", dto);
	}

	/*
	@Override public List<InfoDto> getAllInfo() { return
	session.selectList("selectAllInfo"); }
	 */
	
	@Override
	public List<InfoDto> getAllInfo(Map<String, String> map) {
		return session.selectList("selectAllInfo", map);
	}

	@Override
	public InfoDto getInfo(String num) {
		return session.selectOne("selectInfo", num);
	}
	
	@Override
	public void updateInfo(InfoDto dto) {
		session.update("updateOfMyInfo", dto);
	}

	@Override
	public void deleteInfo(String num) {
		session.delete("deleteOfMyInfo", num);
	}
}
