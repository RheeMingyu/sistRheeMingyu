package spring.mvc.json;

public class PhotoDto {

	private String name;
	private String photo;
	
	public PhotoDto(String name,String photo) {
		super(); //생략가능,하지만 위치는 맨위에
		this.name=name;
		this.photo=photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
