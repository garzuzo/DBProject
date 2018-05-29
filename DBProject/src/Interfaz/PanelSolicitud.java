package Interfaz;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import Mundo.Cliente;

public class PanelSolicitud extends JPanel implements ActionListener {

	private Cliente cliente;
	//listener boton seleccionar
	public static final String SELECCIONAR = "SELECCIONAR";

	// tipo producto
	public static final String VOZ = "VOZ";
	public static final String DATOS = "DATOS";
	public static final String VOZDATOS = "VOZ Y DATOS";

	// cbTipoProducto contiene las opciones de producto a elegir
	private JComboBox cbTipoProducto;

	public JComboBox getCbTipoProducto() {
		return cbTipoProducto;
	}

	// RadioButtons
	private JRadioButton rbCreacion;
	private JRadioButton rbModificacion;
	private JRadioButton rbCancelacion;
	private JRadioButton rbDanio;
	private JRadioButton rbReclamo;

	// cedulaCliente
	private JTextField txtCedulaCliente;

	public JTextField getTxtCedulaCliente() {
		return txtCedulaCliente;
	}

	// paneles
	private PanelSCancelacion pCancelacion;
	private PanelSCreacion pCreacion;
	private PanelSDanio pDanio;
	private PanelSModificacion pModificacion;
	private PanelSReclamo pReclamo;

	private JButton bSeleccionar;

	
	
	private JFRegistro jfRegistro;


	public PanelSolicitud(JFRegistro jfRegistro) {

		this.jfRegistro=jfRegistro;
		
		
		// inicializo y agrego valores al cbTipoProducto
		cbTipoProducto = new JComboBox<String>();
		cbTipoProducto.addItem(VOZ);
		cbTipoProducto.addItem(DATOS);
		cbTipoProducto.addItem(VOZDATOS);

		JPanel pAux = new JPanel();

		pAux.add(new JLabel("Ingrese su Cedula"));
		pAux.add(txtCedulaCliente = new JTextField(10));

		pAux.add(new JLabel("    Seleccione el tipo de solicitud"));
		rbCreacion = new JRadioButton("Creacion");
		rbModificacion = new JRadioButton("Modificacion");
		rbCancelacion = new JRadioButton("Cancelacion");
		rbDanio = new JRadioButton("Dano");
		rbReclamo = new JRadioButton("Reclamo");
		bSeleccionar = new JButton("Seleccionar");
		bSeleccionar.addActionListener(this);
		bSeleccionar.setActionCommand(SELECCIONAR);
		pAux.add(rbCreacion);
		pAux.add(rbModificacion);
		pAux.add(rbCancelacion);
		pAux.add(rbDanio);
		pAux.add(rbReclamo);
		pAux.add(bSeleccionar);
		ButtonGroup rbGroup = new ButtonGroup();
		rbGroup.add(rbCreacion);
		rbGroup.add(rbCancelacion);
		rbGroup.add(rbModificacion);
		rbGroup.add(rbCancelacion);
		rbGroup.add(rbDanio);
		rbGroup.add(rbReclamo);
		rbCreacion.setSelected(true);
		add(pAux, BorderLayout.NORTH);

	}
	
	public void insertarSolicitud( int idProd ,int idSol, String observacion, Date fechaSol, String estAt, int cliCed) {
		try {
			cliente.insertarSolicitud(idProd,idSol, observacion, fechaSol, estAt, cliCed);
            JOptionPane.showMessageDialog( null,"El cliente se ha matriculado satisfactoriamente.", "Interfaz cliente", JOptionPane.OK_OPTION );

		} catch (Exception e) {
			
            JOptionPane.showMessageDialog( null,e.getMessage(), "Interfaz cliente", JOptionPane.ERROR_MESSAGE );
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		String evento = e.getActionCommand();

		if (pCancelacion != null)
			remove(pCancelacion);
		if (pCreacion != null)
			remove(pCreacion);
		if (pDanio != null)
			remove(pDanio);
		if (pModificacion != null)
			remove(pModificacion);
		if (pReclamo != null)
			remove(pReclamo);

		if (evento.equals(SELECCIONAR)) {
			if (rbCreacion.isSelected()) {
				pCreacion = new PanelSCreacion(this);
				add(pCreacion, BorderLayout.CENTER);

			} else if (rbModificacion.isSelected()) {
				pModificacion = new PanelSModificacion(this);
				add(pModificacion, BorderLayout.CENTER);

			} else if (rbCancelacion.isSelected()) {
				pCancelacion = new PanelSCancelacion(this);
				add(pCancelacion, BorderLayout.CENTER);

			} else if (rbDanio.isSelected()) {
				pDanio = new PanelSDanio(this);
				add(pDanio, BorderLayout.CENTER);

			} else if (rbReclamo.isSelected()) {
				pReclamo = new PanelSReclamo(this);
				add(pReclamo, BorderLayout.CENTER);

			}
			this.setSize(500,600);
			repaint();
			revalidate();
			//jfRegistro.revalidate();
		//jfRegistro.pack();
		
		
		}
		
	}
}