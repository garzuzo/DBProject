package Interfaz;

import java.awt.FlowLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class PanelSCreacion extends JPanel implements ActionListener {


	private PanelSolicitud ps;

	private TextArea txtObservacion;
	private JButton bCrear;

	public PanelSCreacion(PanelSolicitud ps) {
		this.ps = ps;
		

		txtObservacion = new TextArea();

		bCrear = new JButton("Crear producto");
		bCrear.setActionCommand("crear");
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

		if (e.getActionCommand().equals("crear")) {

			String cedula = ps.getTxtCedulaCliente().getText();

			String tipo = (String) ps.getCbTipoProducto().getSelectedItem();

			String observacion = txtObservacion.getText();

			System.out.println(cedula+"\n"+tipo+"\n"+observacion);
		}
	}
}
