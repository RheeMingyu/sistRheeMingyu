package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ReboardDto;
import boot.data.mapper.ReboardMapperInter;

@Service
public class ReboardService implements ReboardServiceInter {
	
	@Autowired
	ReboardMapperInter mapperInter;

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {

		Map<String, String> map=new HashMap<>();
		map.put("searchword", searchword);
		map.put("searchcolumn", searchcolumn);
		
		return mapperInter.getTotalCount(map);
	}

	@Override
	public List<ReboardDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {

		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", startnum);
		map.put("perpage", perpage);
		
		return mapperInter.getPagingList(map);
	}

	@Override
	public void insertReboard(ReboardDto dto) {
		
		int num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) { //새글일 경우
			regroup=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		} else { //답글일 경우
			//같은그룹중 전달받은 restep보다 큰값들은 모두 일괄적으로 +1
			this.updateRestep(regroup, restep);
			//그리고 전달받은 값보다 1크게 db에 저장
			restep++;
			relevel++;
		}
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		mapperInter.insertReboard(dto);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		
		Map<String, Integer> map=new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		mapperInter.updateRestep(map);
	}

	@Override
	public void updateViewCount(int num) {
		mapperInter.updateViewCount(num);
	}

	@Override
	public void updateLikes(int num) {
		mapperInter.updateLikes(num);
	}

	@Override
	public ReboardDto getData(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void updateReboard(ReboardDto dto) {
		mapperInter.updateReboard(dto);
	}

	@Override
	public void deleteReboard(int num) {
		mapperInter.deleteReboard(num);
	}

	@Override
	public int getNextRestep(ReboardDto dto) {
		return mapperInter.getNextRestep(dto);
	}

	@Override
	public void deleteCascade(ReboardDto dto) {
		
		Map<String, Integer> map=new HashMap<>();
		map.put("pointValue", this.getNextRestep(dto)-1);
		map.put("restep", dto.getRestep());
	    map.put("relevel", dto.getRelevel());
	    map.put("regroup", dto.getRegroup());

	    mapperInter.deleteCascade(map);
	}

}
