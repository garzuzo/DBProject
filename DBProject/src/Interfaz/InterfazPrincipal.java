package Interfaz;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import Mundo.Cliente;

public class InterfazPrincipal extends JFrame implements ActionListener{

	private JFRegistro jfRegistro;
	private JButton btnRegistro;
	private Cliente cliente;
	
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
	
	public void insertarCliente(int cedula, String nombre, String direccion, Date fecha, int telefono) {
		try {
			cliente.insertarCliente(cedula, nombre, direccion, fecha, telefono);
            JOptionPane.showMessageDialog( null,"El cliente se ha matriculado satisfactoriamente.", "Interfaz cliente", JOptionPane.OK_OPTION );

		} catch (Exception e) {
			
            JOptionPane.showMessageDialog( null,e.getMessage(), "Interfaz cliente", JOptionPane.ERROR_MESSAGE );
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
