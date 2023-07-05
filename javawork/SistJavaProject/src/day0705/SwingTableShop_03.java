package day0705;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class SwingTableShop_03 extends JFrame implements ActionListener{

	Container cp;
	JTextField tfSang,tfSu,tfDan;
	JButton btnAdd;
	JTable table;
	DefaultTableModel model;
	
	//저장하고 불러올 파일명
	String FILENAME="D:\\sist0615\\file\\fruit.txt";
	
	public SwingTableShop_03(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 150, 290);
		cp.setBackground(new Color(255,120,230));
		
		//디자인
		setDesign();
		//테이블데이터
		tableData();
		
		setVisible(true);
	}
	
	//디자인
	public void setDesign() {
		this.setLayout(null); //내 맘대로 만들거야
		
		JLabel lbl1=new JLabel("상품명");
		JLabel lbl2=new JLabel("수량");
		JLabel lbl3=new JLabel("가격");
		
		lbl1.setBounds(30, 20, 80, 30);
		this.add(lbl1);
		
		lbl2.setBounds(130, 20, 80, 30);
		this.add(lbl2);
		
		lbl3.setBounds(230, 20, 80, 30);
		this.add(lbl3);
		
		tfSang=new JTextField();
		tfSang.setBounds(20, 60, 100, 30);
		this.add(tfSang);
		
		tfSu=new JTextField();
		tfSu.setBounds(120, 60, 100, 30);
		this.add(tfSu);
		
		tfDan=new JTextField();
		tfDan.setBounds(220, 60, 100, 30);
		this.add(tfDan);
		
		//버튼
		btnAdd=new JButton("추가하기");
		btnAdd.setBounds(100, 120, 100, 30);
		this.add(btnAdd);
		
		//버튼에 이벤트
		btnAdd.addActionListener(this);
		
		//테이블 생성
		String [] title= {"상품명","수량","가격","총금액"};
		model=new DefaultTableModel(title, 0);//0은 행갯수
		table=new JTable(model);
		JScrollPane js=new JScrollPane(table);
		js.setBounds(20, 160, 350, 160);
		this.add(js);
		
		
		//테이블 클릭시 선택한 행번호를 selectRow에 저장
		table.addMouseListener(new MouseAdapter() {
			
			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub
				super.mouseClicked(e);
				
				int selectRow=table.getSelectedRow();//행번호 저장
			}
		});
	}
	
	//처음생성시 테이블에 불러올메서드
	public void tableData() {
		FileReader fr=null;
		BufferedReader br=null;
		
		try {
			fr=new FileReader(FILENAME);
			br=new BufferedReader(fr);
			
			while(true)
			{
				String s=br.readLine();
				
				if(s==null)
					break;
				
				String [] data=s.split(",");
				
				//table에 배열형 데이터 추가
				model.addRow(data);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingTableShop_03("상품테이블");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		if(ob==btnAdd)
		{
			String sang=tfSang.getText().trim();
			String su=tfSu.getText().trim();
			String dan=tfDan.getText().trim();
			
			if(sang.length()==0||su.length()==0||dan.length()==0)
			{
				JOptionPane.showMessageDialog(this, "3개의 값을 모두입력해주세요");
				return;
			}
			
			int total=0;
			total=Integer.parseInt(su)*Integer.parseInt(dan);
			
			NumberFormat nf=NumberFormat.getInstance();
			Vector<String> data=new Vector<String>();
			
			data.add(sang);
			data.add(su);
			data.add(dan);
			data.add(nf.format(total));
			
			//테이블에 추가
			model.addRow(data);
			
			//입력값 지워주기
			tfSang.setText("");
			tfSu.setText("");
			tfDan.setText("");
		}
	}

}