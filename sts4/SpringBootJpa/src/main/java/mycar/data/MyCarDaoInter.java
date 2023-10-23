package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MyCarDaoInter extends JpaRepository<MyCarDto, Long>{ //제네릭에는 기본키속성,필드는 dto

}
