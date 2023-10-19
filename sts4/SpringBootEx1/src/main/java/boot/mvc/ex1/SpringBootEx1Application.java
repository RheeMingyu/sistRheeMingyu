package boot.mvc.ex1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication //root
@ComponentScan({"boot.test","hello.boot","my.info"}) //복수일때는 {}안에 입력
public class SpringBootEx1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootEx1Application.class, args);
	}

}
