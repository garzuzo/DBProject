package Interfaz;

import javax.swing.JPanel;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class PanelCliente extends JPanel implements ActionListener {

	private JTextField txtCedula, txtNombre, txtFechaN, txtDir, txtTelefono;
	private JButton btnRegistrar;

	private InterfazPrincipal interfaz;
	public static final String REGISTRAR = "REGISTRAR";

	public PanelCliente(InterfazPrincipal i) {
		interfaz = i;
		setLayout(new BorderLayout());
		setSize(250, 250);
		JPanel pAux = new JPanel(new GridLayout(6, 2));
		pAux.add(new JLabel("Cedula"));

		txtCedula = new JTextField();
		pAux.add(txtCedula);

		pAux.add(new JLabel("Nombre"));

		txtNombre = new JTextField();
		pAux.add(txtNombre);

		pAux.add(new JLabel("Fecha Nacimiento"));
		txtFechaN = new JTextField();
		pAux.add(txtFechaN);
		pAux.add(new JLabel("Telefono"));
		txtTelefono = new JTextField();
		pAux.add(txtTelefono);

		pAux.add(new JLabel("Direccion"));
		// Clientes (nombre, cedula, fecha nacimiento, dirección y teléfono)

		txtDir = new JTextField();
		pAux.add(txtDir);
		add(pAux, BorderLayout.CENTER);

		btnRegistrar = new JButton("Registrar");
		btnRegistrar.addActionListener(this);
		btnRegistrar.setActionCommand("registrar");

		add(btnRegistrar, BorderLayout.SOUTH);
		this.repaint();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		String evento = e.getActionCommand();
		if (evento.equals(REGISTRAR)) {

			String cedula = txtCedula.getText();
			String nombre = txtNombre.getText();
			String fechaNacimiento = txtFechaN.getText();
			String direccion = txtDir.getText();
			String telefono = txtTelefono.getText();

		}

	}

}
