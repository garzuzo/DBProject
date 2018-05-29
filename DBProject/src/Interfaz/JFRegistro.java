package Interfaz;

import javax.swing.JFrame;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.*;
import javax.swing.plaf.basic.BasicBorders.RadioButtonBorder;

public class JFRegistro extends JFrame implements ActionListener {

	private PanelCliente pCliente;
	private PanelSolicitud pSolicitud;
	
	
	
	private JButton btnSeleccion;
	private JRadioButton rbRegistroCliente,rbRegistroSolicitud;
	
	private JButton btnMostrarClientes;
	private JButton btnMostrarSolicitudes;
	
	private InterfazPrincipal interfaz;
	
	public final static String MOSTRAR_CLIENTES = "Mostrar Clientes";
	public final static String MOSTRAR_SOLICITUDES = "Mostrar Solicitudes";
	public JFRegistro(InterfazPrincipal i) {

		interfaz=i;
		setLayout(new BorderLayout());
	
		
		JPanel pAux= new JPanel(new FlowLayout());
		
		rbRegistroCliente = new JRadioButton("Registro cliente");
		rbRegistroSolicitud = new JRadioButton("Registro solicitud");
		btnMostrarClientes = new JButton("Mostrar Clientes");
		
		
		btnMostrarSolicitudes = new JButton("Mostrar Solicitudes");
		btnMostrarSolicitudes.setActionCommand(MOSTRAR_SOLICITUDES);
		btnMostrarSolicitudes.addActionListener(this);
		
		btnMostrarClientes = new JButton("Mostrar Clientes");
      btnMostrarClientes.setActionCommand(MOSTRAR_CLIENTES);
      btnMostrarClientes.addActionListener(this);
      
     
		ButtonGroup bg=new ButtonGroup();
		bg.add(rbRegistroSolicitud);
		bg.add(rbRegistroCliente);
		rbRegistroCliente.setSelected(true);
		btnSeleccion=new JButton("Seleccionar");
		btnSeleccion.addActionListener(this);
		btnSeleccion.setActionCommand("seleccionar");
		
		pAux.add(rbRegistroCliente);
		pAux.add(rbRegistroSolicitud);
		pAux.add(btnSeleccion);
		pAux.add(btnMostrarClientes);
		pAux.add(btnMostrarSolicitudes);
		
		add(pAux, BorderLayout.NORTH);
		pack();
	    setResizable(false);
		//setDefaultCloseOperation(operation);;
		setLocationRelativeTo(null);
		setSize(700,800);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		if(e.getActionCommand().equals("seleccionar")) {
			
			if(rbRegistroCliente.isSelected()) {
				if(pSolicitud!=null)
					remove(pSolicitud);
				if(pCliente!=null)
				remove(pCliente);
				pCliente=new PanelCliente(interfaz);
				this.add(pCliente, BorderLayout.CENTER);
				pCliente.repaint();
				this.repaint();
				this.revalidate();
	//	this.pack();
				//pCliente.setVisible(true);
			
			}	else {
				if(pCliente!=null)
					remove(pCliente);
				if(pSolicitud!=null)
				remove(pSolicitud);
				pSolicitud=new PanelSolicitud(this);
				add(pSolicitud, BorderLayout.CENTER);
				this.revalidate();
			
			}	}
			
			else if(e.getActionCommand().equals(MOSTRAR_CLIENTES)) {
				VentanaTablaClientes VEN;
				try {
					JOptionPane.showMessageDialog(null, "La tabla no existe o hay errores en visualizacion",
							"Error", JOptionPane.WARNING_MESSAGE);

					VEN = new VentanaTablaClientes(interfaz.mostrarClientes());
					VEN.setVisible(true);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null, "La tabla no existe o hay errores en visualizacion",
							"Error", JOptionPane.WARNING_MESSAGE);
				}
				
				
			}
		
		}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		JFRegistro jf=new JFRegistro(interfaz);
//		jf.setVisible(true);
//		jf.setSize(500,700);
	}
}
