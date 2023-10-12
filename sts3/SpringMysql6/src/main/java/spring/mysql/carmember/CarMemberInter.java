package spring.mysql.carmember;

import java.util.List;

public interface CarMemberInter {

	public int getTotalCount();
	//insert
	public void insertMember(CarMemberDto dto);
	//allselect
	public List<CarMemberDto> getAllMember();
	//getdata
	public CarMemberDto getMember(int num);
	//update
	public void updateMember(CarMemberDto dto);
	//delete
	public void deleteMember(int num);
}
