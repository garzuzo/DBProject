package Interfaz;

import java.awt.FlowLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class PanelSCreacion extends JPanel implements ActionListener {
	
	public static final String VOZ = "VOZ";
	public static final String DATOS = "DATOS";
	public static final String VOZDATOS = "VOZ Y DATOS";
	
	private PanelSolicitud ps;

	private TextArea txtObservacion;
	private JButton bCrear;
	
	private JComboBox cbTipoProducto;

	public PanelSCreacion(PanelSolicitud ps) {
		this.ps = ps;
		
		// inicializo y agrego valores al cbTipoProducto
		cbTipoProducto = new JComboBox<String>();
		cbTipoProducto.addItem(VOZ);
		cbTipoProducto.addItem(DATOS);
		cbTipoProducto.addItem(VOZDATOS);

		txtObservacion = new TextArea();

		bCrear = new JButton("Crear producto");
		bCrear.setActionCommand("crear");
		bCrear.addActionListener(this);
		setLayout(new FlowLayout());
		add(new JLabel("Selecciona el producto"));
		add(cbTipoProducto);
		add(new JLabel("Agregar Observacion"));
		add(txtObservacion);
		add(bCrear);
		revalidate();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

		if (e.getActionCommand().equals("crear")) {

			int cedula=0;
			try {
				cedula = Integer.parseInt(ps.getTxtCedulaCliente().getText());

			}catch(Exception e1) {
				JOptionPane.showMessageDialog( null,"Debe ingresar una cedula del cliente valida", "Interfaz solicitud", JOptionPane.ERROR_MESSAGE );
			}
			String tipoProd = (String) cbTipoProducto.getSelectedItem();
			System.out.println(tipoProd);
			
			int tipoPro=-1;
			if(tipoProd.equals(VOZ)) {
				tipoPro=1;
			}
			else if(tipoProd.equals(DATOS)) {
				tipoPro=2;
			}else {
				tipoPro=3;
			}

			String observacion = txtObservacion.getText();
			
			Calendar cal= Calendar.getInstance();
			
			java.sql.Date fechaSol= new java.sql.Date(cal.getTimeInMillis());
			
			ps.insertarSolicitudCreacion(tipoPro,0, observacion, fechaSol, "PENDIENTE", cedula);

		}
	}
}
