package Interfaz;

import javax.swing.JPanel;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class PanelCliente extends JPanel implements ActionListener {

	private JTextField txtCedula, txtNombre, txtFechaN, txtDir, txtTelefono;
	private JButton btnRegistrar;

	private InterfazPrincipal interfaz;
	public static final String REGISTRAR = "Registrar";

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

		btnRegistrar = new JButton(REGISTRAR);
		btnRegistrar.addActionListener(this);
		btnRegistrar.setActionCommand(REGISTRAR);

		add(btnRegistrar, BorderLayout.SOUTH);
		this.repaint();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		String evento = e.getActionCommand();
		if (evento.equals(REGISTRAR)) {

			int cedula;
			
			if(txtCedula.getText()==null||txtCedula.getText().trim().equals("")) {
				cedula=-1;
			}else {
				cedula = Integer.parseInt(txtCedula.getText());
			}
			
			String nombre = txtNombre.getText();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
			Date fecha=null;
			try {
				fecha =  formatter.parse(txtFechaN.getText());
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			java.sql.Date sqlDate = new java.sql.Date(fecha.getTime());
			String direccion = txtDir.getText();
			int telefono = Integer.parseInt(txtTelefono.getText());
			
			interfaz.insertarCliente(cedula, nombre, direccion, sqlDate, telefono);

		}

	}

}
