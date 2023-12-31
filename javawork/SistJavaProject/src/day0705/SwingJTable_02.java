package day0705;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class SwingJTable_02 extends JFrame{

	Container cp;
	JTable table;
	JLabel lblTitle;
	JLabel lblOut;//출력
	
	public SwingJTable_02(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 150, 290);
		cp.setBackground(new Color(120,120,20));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		String [][] data= {{"이민규","seoul","010-8250-9354"},{"karen","incheon","010-2345-4321"}
							,{"최성현","country","010-2934-2942"},{"이성신","siheung","010-2394-9128"}};
		String [] title= {"이름","주소","연락처"};
		
		lblTitle=new JLabel("JTable연습",JLabel.CENTER);
		lblOut=new JLabel("결과출력..",JLabel.CENTER);
		
		table=new JTable(data, title);
		JScrollPane pane=new JScrollPane(table);
		
		//테이블에 마우스 이벤트 추가
		table.addMouseListener(new TableEvent());
		
		this.add("North",lblTitle);
		this.add("Center",pane);
		this.add("South",lblOut);
	}
	
	
	//테이블클릭시 발생하는 마우스이벤트
	class TableEvent extends MouseAdapter{
		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			super.mouseClicked(e);
			
			//System.out.println("테이블 클릭!!");
			//선택한 행번호 얻기
			int rowNum=table.getSelectedRow();
			
			String str="이름: "+table.getValueAt(rowNum, 0)
							+",주소: "+table.getValueAt(rowNum, 1)
							+",연락처: "+table.getValueAt(rowNum, 2);
			
			lblOut.setText(str);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingJTable_02("스윙 테이블 연습");
	}

}
