package data.model.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.dto.MarketDto;
import data.model.service.MarketServiceInter;

@Service //dao개념,mapper보완기능
public class MarketService implements MarketServiceInter {
	
	@Autowired
	MarketMapperInter mapperInter;

	@Override
	public int getTotalCount() {
		return mapperInter.getTotalCount();
	}

	@Override
	public List<MarketDto> getAllSangs() {
		return mapperInter.getAllSangs();
	}

	@Override
	public void insertMarket(MarketDto dto) {
		mapperInter.insertMarket(dto);
	}

	@Override
	public MarketDto getData(int num) {
		return mapperInter.getData(num);
	}

	@Override
	public void updateMarket(MarketDto dto) {
		mapperInter.updateMarket(dto);
	}

	@Override
	public void deleteMarket(int num) {
		mapperInter.deleteMarket(num);
	}

}
