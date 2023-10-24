package boot.data.movie;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "mycine")
@Data
public class MovieDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long mv_num;
	
	@Column
	private String mv_title;
	
	@Column
	private String mv_poster;
	
	@Column
	private String mv_director;
	
	@Column
	private String mv_opendate;
}
