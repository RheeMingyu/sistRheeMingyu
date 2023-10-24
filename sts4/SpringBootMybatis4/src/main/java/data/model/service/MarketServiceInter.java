package data.model.service;

import java.util.List;

import data.model.dto.MarketDto;

public interface MarketServiceInter {

	public int getTotalCount();
	public List<MarketDto> getAllSangs();
	public void insertMarket(MarketDto dto);
	public MarketDto getData(int num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(int num);
}
