package Interfaz;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.border.TitledBorder;

import Mundo.Cliente;

public class InterfazPrincipal extends JFrame implements ActionListener{

	private JFRegistro jfRegistro;
	private InterfazAtencion interAtencion;
	private JButton btnRegistro;
	private JButton btnAtencion;
	private Cliente cliente;
	
	public final static String atencion = "Atender";
	
	public InterfazPrincipal() {
		setTitle("Principal");
		setLayout(new FlowLayout());
		setPreferredSize(new Dimension(100,100));
		setResizable(false);
		setSize(150,150);
		btnRegistro = new JButton("Registro");
		btnRegistro.addActionListener(this);
		btnRegistro.setActionCommand("registro");
		btnAtencion = new JButton ("Atencion");
		btnAtencion.addActionListener(this);
		btnAtencion.setActionCommand(atencion);
		add(btnRegistro);
		add(btnAtencion);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getActionCommand().equals("registro")) {
			jfRegistro = new JFRegistro(this);
		jfRegistro.setVisible(true);
		jfRegistro.setSize(1100,700);
		}
		else if(e.getActionCommand().equals(atencion)) {
			interAtencion = new InterfazAtencion();
			interAtencion.setVisible(true);
					
			
			
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
