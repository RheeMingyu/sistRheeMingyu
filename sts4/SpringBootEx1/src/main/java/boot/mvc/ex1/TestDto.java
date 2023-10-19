package boot.mvc.ex1;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Setter
//@Getter
//@ToString
@Data //위의 3개 합친 기능
public class TestDto {

	private String name;
	private String addr;
}
