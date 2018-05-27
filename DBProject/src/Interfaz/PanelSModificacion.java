package Interfaz;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class PanelSModificacion extends JPanel implements ActionListener {

	private TextArea txtObservacion;
	private JButton bCrear;
	private PanelSolicitud ps;
	private JComboBox cbNuevoProducto;

	public PanelSModificacion(PanelSolicitud ps) {

		this.ps = ps;
		txtObservacion = new TextArea();
		cbNuevoProducto = new JComboBox<String>();
		cbNuevoProducto.addItem(PanelSolicitud.VOZ);
		cbNuevoProducto.addItem(PanelSolicitud.DATOS);
		cbNuevoProducto.addItem(PanelSolicitud.VOZDATOS);

		bCrear = new JButton("modificar producto");
		bCrear.setActionCommand("modificar");
		bCrear.addActionListener(this);
		JPanel pAuxCb = new JPanel();
		pAuxCb.setLayout(new FlowLayout());
		JPanel pAuxModificar = new JPanel();
		pAuxModificar.setLayout(new FlowLayout());
		pAuxCb.add(new JLabel("Selecciona el producto que desea cambiar"));
		pAuxCb.add(ps.getCbTipoProducto());
		pAuxCb.add(new JLabel("Selecciona el nuevo producto"));
		pAuxCb.add(cbNuevoProducto);
		pAuxModificar.add(new JLabel("Agregar Observacion"));
		pAuxModificar.add(txtObservacion);
		pAuxModificar.add(bCrear);
		add(pAuxCb, BorderLayout.NORTH);
		add(pAuxModificar, BorderLayout.CENTER);
		revalidate();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getActionCommand().equals("modificar")) {

			String cedula = ps.getTxtCedulaCliente().getText();

			String tipo = (String) ps.getCbTipoProducto().getSelectedItem();

			String observacion = txtObservacion.getText();

			System.out.println(cedula + "\n" + tipo + "\n" + observacion);
		}
	}
}
