package Interfaz;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class InterfazPrincipal extends JFrame implements ActionListener{

	private JFRegistro jfRegistro;
	private JButton btnRegistro;
	
	public InterfazPrincipal() {
		setLayout(new FlowLayout());
		setSize(150,150);
		btnRegistro = new JButton("Registro");
		btnRegistro.addActionListener(this);
		btnRegistro.setActionCommand("registro");
		add(btnRegistro);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getActionCommand().equals("registro")) {
			jfRegistro = new JFRegistro(this);
		jfRegistro.setVisible(true);
		jfRegistro.setSize(1100,700);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InterfazPrincipal ip=new InterfazPrincipal();
		ip.setVisible(true);
		ip.setDefaultCloseOperation(EXIT_ON_CLOSE);
		ip.setLocationRelativeTo(null);
	}
}
