package Interfaz;

import java.awt.BorderLayout;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

import Interfaz.Panel4Atencion;

public class InterfazAtencion extends JFrame {

//	private Panel2 panel2;
//	private Panel1 panel1;
//	private Panel3 panel3;
	private Panel4Atencion panel4;

	public InterfazAtencion() {
		setVisible(true);
//		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//		setLayout(new BorderLayout());
		// setExtendedState(MAXIMIZED_BOTH);
		setSize(921, 570);
		setTitle("GestionarSolicitud");
		

		////Pestañas de la interfaz ////
		
//		panel1= new Panel1();
//		panel2= new Panel2();
//		panel3= new Panel3();
		panel4= new Panel4Atencion();

		
		
		
		JTabbedPane pestañas=new JTabbedPane();
//		pestañas.add("Gestionar Solicitud", panel1);
//		
//		pestañas.add("modificar Solicitud", panel2);
//		pestañas.add("Reportar Solictud", panel3);
		pestañas.add("listar Solictudes", panel4);


		
		
		getContentPane().add(pestañas);
		
		
	}
//
//	public static void main(String[] args) {
//
//		InterfazAtencion ventana = new InterfazAtencion();
//		ventana.setVisible(true);
//
//	}

}
