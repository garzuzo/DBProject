package Interfaz;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

public class PanelSolicitud extends JPanel implements ActionListener {

	public static final String CREAR = "CREAR";
	public static final String MODIFICAR = "MODIFICAR";
	public static final String CANCELAR = "CANCELAR";
	public static final String DANIO = "DANIO";
	public static final String RECLAMO = "RECLAMO";

	private JRadioButton rbCreacion;
	private JRadioButton rbModificacion;
	private JRadioButton rbCancelacion;
	private JRadioButton rbDanio;
	private JRadioButton rbReclamo;

	private JTextField txtCedulaCliente;

	public PanelSolicitud() {

		JPanel pCedula = new JPanel();

		pCedula.add(new JLabel("Ingrese su Cedula"));
		pCedula.add(txtCedulaCliente = new JTextField(10));

		pCedula.add(new JLabel("    Seleccione el tipo de solicitud"));
		rbCreacion = new JRadioButton("Creacion");
		rbModificacion = new JRadioButton("Modificacion");
		rbCancelacion = new JRadioButton("Cancelacion");
		rbDanio = new JRadioButton("Dano");
		rbReclamo = new JRadioButton("Reclamo");
		pCedula.add(rbCreacion);
		pCedula.add(rbModificacion);
		pCedula.add(rbCancelacion);
		pCedula.add(rbDanio);
		pCedula.add(rbReclamo);
		ButtonGroup rbGroup = new ButtonGroup();
		rbGroup.add(rbCreacion);
		rbGroup.add(rbCancelacion);
		rbGroup.add(rbModificacion);
		rbGroup.add(rbCancelacion);
		rbGroup.add(rbDanio);
		rbGroup.add(rbReclamo);
		rbCreacion.setSelected(true);
		add(pCedula, BorderLayout.NORTH);
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		String evento = e.getActionCommand();

		if (evento.equals(CREAR)) {

		} else if (evento.equals(MODIFICAR)) {

		} else if (evento.equals(CANCELAR)) {

		} else if (evento.equals(DANIO)) {

		} else if (evento.equals(RECLAMO)) {

		}

	}
}
