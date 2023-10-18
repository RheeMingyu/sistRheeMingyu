package answer.data;

import java.util.List;

public interface AnswerDaoInter {

	public void insertAnswer(AnswerDto dto);
	public List<AnswerDto> getAnswerList(int num);
	public void controlViewcount(int num);
	public int authentification(int idx,int pass);
	public void deleteAnswer(int idx);
}
