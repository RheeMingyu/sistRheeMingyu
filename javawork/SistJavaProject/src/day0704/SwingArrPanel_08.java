package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingArrPanel_08 extends JFrame implements ActionListener{

	Container cp;
	JButton [] btn=new JButton[6];
	String [] btnLabel= {"Red","Green","Yellow","Cyan","White","Gray"};
	Color [] btnColor= {Color.red,Color.green,Color.yellow,Color.cyan,Color.white,Color.gray};
	
	public SwingArrPanel_08(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 350, 290);
		cp.setBackground(new Color(120,120,20));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		//panel 기본이 Flowlayout
		JPanel panel=new JPanel();
		panel.setBackground(Color.orange);
		//프레임에 패널을 추가_상단 하단..
		this.add(panel,BorderLayout.NORTH);
		
		//버튼생성
		for(int i=0;i<btn.length;i++)
		{
			btn[i]=new JButton(btnLabel[i]);
			//버튼색
			btn[i].setBackground(btnColor[i]);
			
			//패널에 추가
			panel.add(btn[i]);
			
			//버튼6개에 이벤트추가
			btn[i].addActionListener(this);
			
		}
		
	}
		
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		for(int i=0;i<btn.length;i++)
		{	
			if(ob==btn[i])
			{	
				//배경색
				cp.setBackground(btnColor[i]);
				
				//제목바꾸기
				this.setTitle("color: "+btnLabel[i]);
			}	
		}	
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingArrPanel_08("스윙 배열연습");
	}
}