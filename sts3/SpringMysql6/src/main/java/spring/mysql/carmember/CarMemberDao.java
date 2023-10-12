package spring.mysql.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		return session.selectOne("carmember.getTotalCount");
	}

	@Override
	public void insertMember(CarMemberDto dto) {
		session.insert("insertMember", dto);
	}

	@Override
	public List<CarMemberDto> getAllMember() {
		return session.selectList("carmember.getAllMember");
	}

	@Override
	public CarMemberDto getMember(int num) {
		return session.selectOne("getMember", num);
	}

	@Override
	public void updateMember(CarMemberDto dto) {
		session.update("updateMember", dto);
	}

	@Override
	public void deleteMember(int num) {
		session.delete("deleteMember", num);
	}

}
