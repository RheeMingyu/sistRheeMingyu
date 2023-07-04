package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingGrid_06 extends JFrame implements ActionListener{

	Container cp;
	//이미지아이콘
	ImageIcon icon1=new ImageIcon("D:\\sist0615\\SwingImage\\swingimage\\img1.gif");
	ImageIcon icon2=new ImageIcon("D:\\sist0615\\SwingImage\\swingimage\\img2.gif");
	ImageIcon icon3=new ImageIcon("D:\\sist0615\\SwingImage\\swingimage\\img3.gif");
	ImageIcon icon4=new ImageIcon("D:\\sist0615\\SwingImage\\swingimage\\img4.gif");
	
	//버튼선언
	JButton btn1,btn2,btn3,btn4;
	
	public SwingGrid_06(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 150, 290);
		cp.setBackground(new Color(120,120,20));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		//버튼4개 생성
		this.setLayout(new GridLayout(2, 2)); //버튼을 2행2열로 배치
		btn1=new JButton("hello", icon1);
		btn1.setVerticalTextPosition(JButton.BOTTOM);//텍스트 세로위치
		btn1.setHorizontalTextPosition(JButton.CENTER);//텍스트 가로위치
		this.add(btn1);
		
		btn1.setRolloverIcon(icon2);//마우스 올렸을때 아이콘
		btn1.setPressedIcon(icon3);//클릭시 아이콘
		
		//2
		btn2=new JButton(icon4);
		this.add(btn2);
		
		//3
		btn3=new JButton("JAVA");
		this.add(btn3);
		
		//4
		btn4=new JButton("Hi", icon2);
		this.add(btn4);
		
		//버튼에 액션이벤트 추가
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		btn4.addActionListener(this);
	}
	
	//액션
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		if(ob==btn1)
			JOptionPane.showMessageDialog(this, "1번이미지");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this, "2번이미지");
		else if(ob==btn3)
			JOptionPane.showMessageDialog(this, "3번이미지");
		else if(ob==btn4)
			JOptionPane.showMessageDialog(this, "4번이미지");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingGrid_06("그리드 레이아웃");
	}



}