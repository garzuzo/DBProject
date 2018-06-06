package Interfaz;

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

public class PanelSDanio extends JPanel implements ActionListener{

	public static final String CALIDAD = "Mala calidad";
	public static final String VELOCIDAD = "Baja velocidad";
	public static final String COBERTURA = "Cobertura";
	public static final String OTRA = "Otra";
	
	private TextArea txtObservacion;
	private JButton bCrear;
	private PanelSolicitud ps;
	private JTextField idProd;
	private JComboBox cbAnomalia;
	
	public PanelSDanio(PanelSolicitud ps) {
		this.ps=ps;
		txtObservacion = new TextArea();
		
		cbAnomalia = new JComboBox<String>();
		cbAnomalia.addItem(CALIDAD);
		cbAnomalia.addItem(VELOCIDAD);
		cbAnomalia.addItem(COBERTURA);
		cbAnomalia.addItem(OTRA);

		bCrear = new JButton("Dano producto");
		bCrear.setActionCommand("dano");
		bCrear.addActionListener(this);
		setLayout(new FlowLayout());
		add(new JLabel("Selecciona la anomalia"));
		add(cbAnomalia);
		add(new JLabel("Agregar Observacion"));
		add(txtObservacion);
		add(new JLabel("Id producto:"));
		add(idProd= new JTextField(10));
		add(bCrear);
		revalidate();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getActionCommand().equals("dano")) {

			int cedula=0;
			int idPro=0;
			try {
				cedula = Integer.parseInt(ps.getTxtCedulaCliente().getText());
				idPro= Integer.parseInt(idProd.getText());

			}catch(Exception e1) {
				JOptionPane.showMessageDialog( null,"Debe ingresar una cedula del cliente valida", "Interfaz solicitud", JOptionPane.ERROR_MESSAGE );
			}

			String observacion = txtObservacion.getText();
			
			String tipoAnom = (String) cbAnomalia.getSelectedItem();
			
			int tipoAn=-1;
			if(tipoAnom.equals(CALIDAD)) {
				tipoAn=1;
			}
			else if(tipoAnom.equals(VELOCIDAD)) {
				tipoAn=2;
			}else if(tipoAnom.equals(COBERTURA)) {
				tipoAn=3;
			}else {
				tipoAn=4;
			}
			
			Calendar cal= Calendar.getInstance();
			
			java.sql.Date fechaSol= new java.sql.Date(cal.getTimeInMillis());
			
			ps.insertarSolicitudDanio(idPro,0,tipoAn,0, observacion,fechaSol, "PENDIENTE", cedula);
		
		}
	}
}
