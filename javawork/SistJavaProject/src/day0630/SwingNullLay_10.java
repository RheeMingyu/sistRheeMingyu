package day0630;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingNullLay_10 extends JFrame implements ActionListener{
		Container cp;
		JButton btn1,btn2;
		
		public SwingNullLay_10(String title) {
			super(title);
			cp=this.getContentPane();
			this.setBounds(200, 100, 300, 420);
			cp.setBackground(new Color(120,120,20));
			setDesign();
			setVisible(true);
		}
		
		//디자인
		public void setDesign() {
			//기본레이아웃 없애기
			this.setLayout(null);
			
			btn1=new JButton("◀");
			btn2=new JButton("▶");
			
			//위치 직접 지정
			btn1.setBounds(50, 100, 80, 30);
			btn2.setBounds(130, 100, 80, 30);
			
			//프레임추가
			this.add(btn1);
			this.add(btn2);
			
			//색상
			btn1.setBackground(Color.magenta);
			btn2.setBackground(Color.green);
			
			//이벤트
			btn1.addActionListener(this);
			btn2.addActionListener(this);
		}
		
		@Override
		public void actionPerformed(ActionEvent e) {
			Object ob=e.getSource();
			
			if(ob==btn1)
				JOptionPane.showMessageDialog(this, "왼쪽으로 이동");
			else if(ob==btn2)
				JOptionPane.showMessageDialog(this, "오른쪽으로 이동");
			
		}
		
		public static void main(String[] args) {
			// TODO Auto-generated method stub

			new SwingNullLay_10("레이아웃 없이 만들기");
		}

	}