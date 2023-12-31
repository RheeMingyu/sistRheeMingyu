package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class SwingRandom_10 extends JFrame implements ActionListener{

	Container cp;
	JLabel [] lblName=new JLabel[9]; //3행3열이므로
	String [] str= {"korea","japan","china","brazil","italy","british","france","german","spain"};
	JButton btn;
	
	public SwingRandom_10(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 500, 550);
		cp.setBackground(new Color(120,120,20));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		//패널을 프레임의 센터에 추가
		JPanel pCenter=new JPanel(new GridLayout(3, 3));
		this.add(pCenter,BorderLayout.CENTER);
		
		//라벨을 패널에 추가
		for(int i=0;i<lblName.length;i++)
		{
			lblName[i]=new JLabel(str[i],JLabel.CENTER);
			
			int r=(int)(Math.random()*256);
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			
			lblName[i].setBackground(new Color(r,g,b));
			
			//panel에 라벨 추가
			pCenter.add(lblName[i]);
			lblName[i].setOpaque(true);
		}
		
		//버튼
		btn=new JButton("라벨색상변경");
		this.add(btn,BorderLayout.SOUTH);
		
		btn.addActionListener(this);
	}
	
	//액션
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		for(int i=0;i<lblName.length;i++)
		{
			int r=(int)(Math.random()*256);
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			
			lblName[i].setBackground(new Color(r,g,b));
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingRandom_10("스윙 랜덤");
	}

}