package spring.mvc.friday;

import java.util.List;
import java.util.Map;

public interface InfoInter {

	public int getTotalCount();
	public void insertInfo(InfoDto dto);
	//public List<InfoDto> getAllInfo();
	
	public List<InfoDto> getAllInfo(Map<String, String> map);
	
	public InfoDto getInfo(String num);
	public void updateInfo(InfoDto dto);
	public void deleteInfo(String num);
}
