package boot.data.service;

import java.util.List;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id);
	public int loginPassCheck(String id,String pass); //mybatis와 달리 Map안쓰고 파라메타 여러개 가능
	public MemberDto getDataById(String id);
	public void deleteMember(String num);
	public MemberDto getDataByNum(String num);
	public void updatePhoto(String num,String photo);
	public void updateMember(MemberDto dto);
	public MemberDto getMember(String num);
}
