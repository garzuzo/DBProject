package Interfaz;

import javax.swing.JFrame;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.plaf.basic.BasicBorders.RadioButtonBorder;

public class JFRegistro extends JFrame implements ActionListener {

	private PanelCliente pCliente;
	private PanelSolicitud pSolicitud;
	
	private JButton btnSeleccion;
	private JRadioButton rbRegistroCliente,rbRegistroSolicitud;
	
	private InterfazPrincipal interfaz;
	public JFRegistro(InterfazPrincipal i) {

		interfaz=i;
		setLayout(new BorderLayout());
		
		JPanel pAux= new JPanel(new FlowLayout());
		
		rbRegistroCliente = new JRadioButton("Registro cliente");
		rbRegistroSolicitud = new JRadioButton("Registro solicitud");
		

		ButtonGroup bg=new ButtonGroup();
		bg.add(rbRegistroSolicitud);
		bg.add(rbRegistroCliente);
		
		btnSeleccion=new JButton("Seleccionar");
		btnSeleccion.addActionListener(this);
		btnSeleccion.setActionCommand("seleccionar");
		
		pAux.add(rbRegistroCliente);
		pAux.add(rbRegistroSolicitud);
		pAux.add(btnSeleccion);
		
		add(pAux, BorderLayout.NORTH);
	
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		if(e.getActionCommand().equals("seleccionar")) {
			if(rbRegistroCliente.isSelected()) {
				pCliente=new PanelCliente(interfaz);
				add(pCliente, BorderLayout.CENTER);
			}
			else {
				pSolicitud=new PanelSolicitud();
				add(pSolicitud, BorderLayout.CENTER);
			}	
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		JFRegistro jf=new JFRegistro();
//		jf.setVisible(true);
//		jf.setSize(500,700);
	}
}
