package spring.anno.ex5;

import org.springframework.stereotype.Component;

@Component("tfruit")
public class ThaiFruit implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("�±��ϸ� ����");
	}

}
