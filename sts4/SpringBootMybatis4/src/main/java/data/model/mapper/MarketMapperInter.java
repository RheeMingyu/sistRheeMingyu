package data.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.dto.MarketDto;

@Mapper //Repository와 같은개념..인터페이스에도 가능
public interface MarketMapperInter {

	public int getTotalCount(); //메서드명이 id역할..id가 똑같아야함
	public List<MarketDto> getAllSangs();
	public void insertMarket(MarketDto dto);
	public MarketDto getData(int num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(int num);
}
