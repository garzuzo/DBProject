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
			System.out.println(1);
			if(rbRegistroCliente.isSelected()) {
				pCliente=new PanelCliente(interfaz);
				this.add(pCliente, BorderLayout.CENTER);
				pCliente.repaint();
				//pCliente.setVisible(true);
				System.out.println(2);
			}
			else {
				pSolicitud=new PanelSolicitud();
				add(pSolicitud, BorderLayout.CENTER);
				System.out.println(3);
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
