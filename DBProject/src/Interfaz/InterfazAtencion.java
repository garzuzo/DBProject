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
		

		////Pesta�as de la interfaz ////
		
//		panel1= new Panel1();
//		panel2= new Panel2();
//		panel3= new Panel3();
		panel4= new Panel4Atencion();

		
		
		
		JTabbedPane pesta�as=new JTabbedPane();
//		pesta�as.add("Gestionar Solicitud", panel1);
//		
//		pesta�as.add("modificar Solicitud", panel2);
//		pesta�as.add("Reportar Solictud", panel3);
		pesta�as.add("listar Solictudes", panel4);


		
		
		getContentPane().add(pesta�as);
		
		
	}
//
//	public static void main(String[] args) {
//
//		InterfazAtencion ventana = new InterfazAtencion();
//		ventana.setVisible(true);
//
//	}

}
