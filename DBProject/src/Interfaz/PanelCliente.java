package Interfaz;

import javax.swing.JPanel;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class PanelCliente extends JPanel implements ActionListener{
	
	private JTextField txtCedula, txtNombre, txtDir;
	private JButton btnRegistrar;

	private InterfazPrincipal interfaz;
	
	public PanelCliente(InterfazPrincipal i) {
		interfaz=i;
		setLayout(new BorderLayout());
		
		JPanel pAux= new JPanel(new GridLayout(3,2));
		pAux.add(new JLabel("Cédula"));
		
		txtCedula=new JTextField();
		pAux.add(txtCedula);
		
		pAux.add(new JLabel("Nombre"));
		
		txtNombre=new JTextField();
		pAux.add(txtNombre);
		
		pAux.add(new JLabel("Dirección"));
		
		txtDir=new JTextField();
		pAux.add(txtDir);
		add(pAux, BorderLayout.CENTER);
		
		btnRegistrar=new JButton("Registrar");
		btnRegistrar.addActionListener(this);
		btnRegistrar.setActionCommand("registrar");
		
		add(btnRegistrar, BorderLayout.SOUTH);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}
	
	
}
