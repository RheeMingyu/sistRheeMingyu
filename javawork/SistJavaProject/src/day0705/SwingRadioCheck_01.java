package day0705;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingRadioCheck_01 extends JFrame implements ActionListener{

	Container cp;
	JRadioButton [] jr=new JRadioButton[4]; //하나만 선택하고싶을때
	JCheckBox [] jc=new JCheckBox[4];
	JLabel lblMessage; //라디오버튼,체크박스 결과값 출력
	JPanel pTop,pBottom; //라디오버튼,체크박스 올릴 패널
	Color [] colors= {Color.red,Color.pink,Color.blue,Color.green};
	
	public SwingRadioCheck_01(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 500, 400);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		//상단패널에 보더로감싼 4개의 radio버튼 만들기
		String [] str1= {"Red","Pink","Blue","Green"};
		pTop=new JPanel();
		pTop.setBorder(new TitledBorder("글자색"));
		this.add("North",pTop);
		
		//라디오버튼 하나만 선택되도록 그룹을 지어줌
		ButtonGroup bg=new ButtonGroup();
		
		for(int i=0;i<jr.length;i++)
		{
			jr[i]=new JRadioButton(str1[i],i==0?true:false); //라디오버튼 생성
			jr[i].addActionListener(this); //라디오버튼에 액션 추가
			pTop.add(jr[i]); //4개의 버튼을 탑패널에 추가
			bg.add(jr[i]); //버튼그룹에 추가
		}
		
		ImageIcon icon=new ImageIcon("D:\\sist0615\\SwingImage\\swingimage\\img9.gif");
		
		lblMessage=new JLabel("Have a Nice Day!!",icon,JLabel.CENTER);
		lblMessage.setHorizontalTextPosition(JLabel.LEFT);
		lblMessage.setBorder(new LineBorder(Color.cyan,2));
		this.add("Center",lblMessage);
		
		//하단패널에 보더로감싼 4개의 checkbox버튼 만들기
		pBottom=new JPanel();
		pBottom.setBorder(new TitledBorder("가능언어"));
		this.add("South",pBottom);
		
		String [] str2= {"한국어","english","français","普通話"};
		
		for(int i=0;i<jc.length;i++)
		{
			jc[i]=new JCheckBox(str2[i]);
			jc[i].addActionListener(this);
			pBottom.add(jc[i]);
		}
	}
	
	//이벤트
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		String [] str2= {"한국어","english","français","普通話"};
		
		//라디오버튼 호출처리
		for(int i=0;i<jr.length;i++)
		{
			if(ob==jr[i])
			{
				lblMessage.setForeground(colors[i]);
				lblMessage.setFont(new Font("", Font.BOLD, 20));
			}
		}
		
		//체크박스 호출처리..선택한 체크를 라벨메세지별 출력
		String lang="My available languages are ";
		
		for(int i=0;i<jc.length;i++)
		{
			if(jc[i].isSelected())
			{
				lang+=jc[i].getText()+" ";
			}
		}
		lblMessage.setText(lang);
		
		//클래스 타입비교
		if(ob instanceof JCheckBox)
			lblMessage.setText(lang);
		else if(ob instanceof JRadioButton)
			lblMessage.setText("Have a Nice Day!!");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingRadioCheck_01("라디오 체크 연습");
	}

}