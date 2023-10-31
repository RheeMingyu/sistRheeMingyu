package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapperInter mapperInter;
	
	@Override
	public void insertMember(MemberDto dto) {
		mapperInter.insertMember(dto);
	}

	@Override
	public List<MemberDto> getAllMembers() {
		return mapperInter.getAllMembers();
	}

	@Override
	public int getSearchId(String id) {
		return mapperInter.getSearchId(id);
	}

	@Override
	public String getName(String id) {
		return mapperInter.getName(id);
	}

	@Override
	public int loginPassCheck(String id, String pass) {

		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		
		return mapperInter.loginPassCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		return mapperInter.getDataById(id);
	}

	@Override
	public void deleteMember(String num) {
		mapperInter.deleteMember(num);
	}

	@Override
	public MemberDto getDataByNum(String num) {
		return mapperInter.getDataByNum(num);
	}

	@Override
	public void updatePhoto(String num, String photo) {
		
		Map<String, String> map=new HashMap<>();
		map.put("photo", photo);
		map.put("num", num);
		mapperInter.updatePhoto(map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		mapperInter.updateMember(dto);
	}

	@Override
	public MemberDto getMember(String num) {
		return mapperInter.getMember(num);
	}

}
