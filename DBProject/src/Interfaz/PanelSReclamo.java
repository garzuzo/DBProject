package Interfaz;

import java.awt.FlowLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class PanelSReclamo extends JPanel implements ActionListener{

	private TextArea txtObservacion;
	private JButton bCrear;
	private PanelSolicitud ps;
	public PanelSReclamo(PanelSolicitud ps) {
		this.ps=ps;
		txtObservacion = new TextArea();

		bCrear = new JButton("reclamo producto");
		bCrear.setActionCommand("reclamo");
		bCrear.addActionListener(this);
		setLayout(new FlowLayout());
		add(new JLabel("Selecciona el producto"));
		add(ps.getCbTipoProducto());
		add(new JLabel("Agregar Observacion"));
		add(txtObservacion);
		add(bCrear);
		revalidate();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getActionCommand().equals("reclamo")) {

			String cedula = ps.getTxtCedulaCliente().getText();

			String tipo = (String) ps.getCbTipoProducto().getSelectedItem();

			String observacion = txtObservacion.getText();

			System.out.println(cedula+"\n"+tipo+"\n"+observacion);
		}
	}
}
