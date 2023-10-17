package spring.mvc.reboard;

import java.util.List;
import java.util.Map;

public interface BoardDaoInter {

	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup,int restep);
	public void insertReboard(BoardDto dto);
	public List<BoardDto> getPagingList(int start,int perPage);
	public BoardDto	getData(int num);
	public void updateViewcount(int num);
	public int authentification(int num,int pass);
	public void deleteData(int num);
	public void updateData(BoardDto dto);
	public int getNextRestep(BoardDto dto);
	public void deleteCascade(BoardDto dto);
}
