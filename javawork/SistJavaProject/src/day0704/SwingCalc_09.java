package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class SwingCalc_09 extends JFrame{
	
	Container cp;
	JLabel lblResult,lbl1,lbl2; //결과나오는곳,숫자1제목,숫자2제목
	JTextField tfSu1,tfSu2; //입력하는곳
	JButton btnAdd; //이벤트 발생버튼
	
	public SwingCalc_09(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 150, 290);
		cp.setBackground(new Color(120,120,20));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		this.setLayout(null);
		
		lbl1=new JLabel("숫자1");
		lbl2=new JLabel("숫자2");
		
		lbl1.setBounds(20, 40, 40, 30);
		this.add(lbl1);
		lbl2.setBounds(20, 70, 40, 30);
		this.add(lbl2);
		
		tfSu1=new JTextField();
		tfSu1.setBounds(90, 40, 40, 30);
		this.add(tfSu1);
		
		tfSu2=new JTextField();
		tfSu2.setBounds(90, 70, 40, 30);
		this.add(tfSu2);
		
		btnAdd=new JButton("숫자더하기");
		btnAdd.setBounds(30, 150, 130, 50);
		this.add(btnAdd);
		
		lblResult=new JLabel("결과 나오는곳");
		lblResult.setBounds(20, 200, 200, 50);
		this.add(lblResult);
		
		//버튼 이벤트인데 익명내부 클래스 형식으로 만들기
		btnAdd.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int v1,v2,result;
				v1=Integer.parseInt(tfSu1.getText());
				v2=Integer.parseInt(tfSu2.getText());
				
				result=v1+v2;
				lblResult.setText(result+"");
			}
		});
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingCalc_09("레이아웃 이벤트");
	}

}