package boot.data.service;

import java.util.List;

import boot.data.dto.ReboardDto;

public interface ReboardServiceInter {

	public int getMaxNum(); //regroup 지정하기 위해 필수
	public int getTotalCount(String searchcolumn,String searchword); //페이징
	public List<ReboardDto>	getPagingList(String searchcolumn,String searchword,int startnum,int perpage); //검색어 넣을 수 있어서 Object(페이징,검색어)
	
	public void insertReboard(ReboardDto dto);
	public void updateRestep(int regroup,int restep);
	
	public void updateViewCount(int num);
	public void updateLikes(int num);
	
	public ReboardDto getData(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	
	public int getNextRestep(ReboardDto dto);
	public void deleteCascade(ReboardDto dto);
}
