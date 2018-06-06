package Interfaz;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class PanelSModificacion extends JPanel implements ActionListener {

	private TextArea txtObservacion;
	private JButton bCrear;
	private PanelSolicitud ps;
	private JComboBox cbNuevoProducto;
	private JTextField idProd;

	public PanelSModificacion(PanelSolicitud ps) {

		this.ps = ps;
		txtObservacion = new TextArea();
		cbNuevoProducto = new JComboBox<String>();
		cbNuevoProducto.addItem(PanelSolicitud.VOZ);
		cbNuevoProducto.addItem(PanelSolicitud.DATOS);
		cbNuevoProducto.addItem(PanelSolicitud.VOZDATOS);
		setLayout(new BorderLayout());
		bCrear = new JButton("modificar producto");
		bCrear.setActionCommand("modificar");
		bCrear.addActionListener(this);
	
		setLayout(new FlowLayout());
		add(new JLabel("Selecciona el nuevo producto"));
		add(cbNuevoProducto);
		add(new JLabel("Agregar Observacion"));
		add(txtObservacion);
		add(new JLabel("Id Producto"));
		add(idProd= new JTextField(10));
		add(bCrear);
		revalidate();
		revalidate();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getActionCommand().equals("modificar")) {

			int cedula=0;
			int idPro=0;
			try {
				cedula = Integer.parseInt(ps.getTxtCedulaCliente().getText());
				idPro= Integer.parseInt(idProd.getText());

			}catch(Exception e1) {
				JOptionPane.showMessageDialog( null,"Debe ingresar una cedula del cliente o un id del producto valido", "Interfaz solicitud", JOptionPane.ERROR_MESSAGE );
			}
			String tipoProd = (String) ps.getCbTipoProducto().getSelectedItem();
			
			int tipoPro=-1;
			if(tipoProd.equals(ps.VOZ)) {
				tipoPro=1;
			}
			else if(tipoProd.equals(ps.DATOS)) {
				tipoPro=2;
			}else {
				tipoPro=3;
			}

			String observacion = txtObservacion.getText();
			
			Calendar cal= Calendar.getInstance();
			
			java.sql.Date fechaSol= new java.sql.Date(cal.getTimeInMillis());
			
			ps.insertarSolicitudModificacion(idPro,tipoPro,0, observacion,fechaSol, "PENDIENTE", cedula);
		}
	}
}
