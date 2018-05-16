package Interfaz;

import javax.swing.JFrame;
import javax.swing.*;
import javax.swing.plaf.basic.BasicBorders.RadioButtonBorder;

public class JFRegistro extends JFrame {

	public JFRegistro() {

		JRadioButton rbRegistroCliente = new JRadioButton("Registro cliente");
		JRadioButton rbRegistroSolicitud = new JRadioButton("Registro solicitud");

		ButtonGroup bg=new ButtonGroup();
		bg.add(rbRegistroSolicitud);
		bg.add(rbRegistroCliente);
		
	
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
