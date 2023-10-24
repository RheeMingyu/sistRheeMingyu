package boot.data.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDao {

	@Autowired
	MovieDaoInter inter;
	
	public long getTotalCount() {
		return inter.count();
	}
	
	public void insertMovie(MovieDto mdto) {
		inter.save(mdto);
	}
	
	public List<MovieDto> getAllMovies() {
		return inter.findAll();
	}
	
	public MovieDto getSingleMovie(long num) {
		return inter.getReferenceById(num);
	}
	
	public void deleteMovie(long num) {
		inter.deleteById(null);
	}
	
	//
	//
	//
	//public void updateMovie(MovieDto mdto)
	//
}
