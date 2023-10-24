package boot.mvc.movie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("boot.data.movie")
@EntityScan("boot.data.movie")
@EnableJpaRepositories("boot.data.movie")
public class SpringBootQuizMovieApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootQuizMovieApplication.class, args);
	}

}
