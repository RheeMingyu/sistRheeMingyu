package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReboardDto;

@Mapper
public interface ReboardMapperInter {

	public int getMaxNum(); //regroup 지정하기 위해 필수
	public int getTotalCount(Map<String, String> map); //페이징
	public List<ReboardDto>	getPagingList(Map<String, Object> map); //검색어 넣을 수 있어서 Object(페이징,검색어)
	
	public void insertReboard(ReboardDto dto);
	public void updateRestep(Map<String, Integer> map);
	
	public void updateViewCount(int num);
	public void updateLikes(int num);
	
	public ReboardDto getData(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	
	public int getNextRestep(ReboardDto dto);
	public void deleteCascade(Map<String, Integer> map);
}
