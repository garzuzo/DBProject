package Interfaz;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class PanelSCancelacion extends JPanel implements ActionListener {

	private TextArea txtObservacion;
	private JButton bCrear;
	private PanelSolicitud ps;
	private JTextField idProd;

	public PanelSCancelacion(PanelSolicitud ps) {
		this.ps = ps;
		txtObservacion = new TextArea();

		JPanel nuevo= new JPanel();
		bCrear = new JButton("Cancelar producto");
		bCrear.setActionCommand("cancelar");
		bCrear.addActionListener(this);
		setLayout(new FlowLayout());
		//add(new JLabel("Selecciona el producto"));
		//add(ps.getCbTipoProducto());
		add(new JLabel("Agregar Observacion"));
		add(txtObservacion);
		nuevo.add(new JLabel("Id Producto"));
		nuevo.add(idProd= new JTextField(10));
		nuevo.add(bCrear);
		add(nuevo);
		revalidate();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

		if (e.getActionCommand().equals("cancelar")) {

			int cedula=0;
			int idPro=0;
			try {
				cedula = Integer.parseInt(ps.getTxtCedulaCliente().getText());
				idPro= Integer.parseInt(idProd.getText());

			}catch(Exception e1) {
				JOptionPane.showMessageDialog( null,"Debe ingresar una cedula del cliente valida o un id del producto valido", "Interfaz solicitud", JOptionPane.ERROR_MESSAGE );
			}

			String observacion = txtObservacion.getText();
			
			Calendar cal= Calendar.getInstance();
			
			java.sql.Date fechaSol= new java.sql.Date(cal.getTimeInMillis());
			
			ps.insertarSolicitudCancelacion(idPro,0, observacion, fechaSol, "PENDIENTE", cedula);
		}
	}
}
