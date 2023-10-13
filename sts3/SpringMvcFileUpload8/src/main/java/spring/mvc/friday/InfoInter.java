package spring.mvc.friday;

import java.util.List;

public interface InfoInter {

	public int getTotalCount();
	public void insertInfo(InfoDto dto);
	public List<InfoDto> getAllInfo();
	public InfoDto getInfo(String num);
	public void updateInfo(InfoDto dto);
	public void deleteInfo(String num);
}
