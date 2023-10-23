package data.model.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mdto") //mybatis에서는 dto의 타입을 사용,dto타입 지정
public class MarketDto {

	private int num;
	private int price;
	private String sang;
	private String photoname;
	private Timestamp ipgoday;
}
