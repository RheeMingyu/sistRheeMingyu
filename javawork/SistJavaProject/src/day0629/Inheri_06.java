package day0629;

class Shop {
	String sangpum;
	int su;
	
	public Shop(String sangpum,int su) {
		this.sangpum=sangpum;
		this.su=su;
	}
	
	public String writeShop() {
		String print=sangpum+","+su+"개";
		return print;
	}
}

class MyCart extends Shop{
	
	int price;
	public MyCart(String sangpum, int su,int price) {
		super(sangpum, su);
		this.price=price;
	}
	
	@Override
	public String writeShop() {
		// TODO Auto-generated method stub
		return super.writeShop()+","+price*su;
	}	
}
///////////////////
public class Inheri_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyCart my=new MyCart("노트북", 3, 1000000);
		System.out.println(my.writeShop());
	}

}
