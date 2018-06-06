package Interfaz;

import java.awt.BorderLayout;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.border.TitledBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;

import org.w3c.dom.ls.LSInput;

import Interfaz.VentanaEmergenteAtencion;



public class Panel4Atencion extends JPanel implements ActionListener, ListSelectionListener {

//	public final static String CONFIRMAR = "Confirmar Acción";
	public final static String FILTRO_CLIENTE_X_PRODUCTO = "Filtrar1";
	public final static String FILTRO_SOLICITUD_X_FUNCIONARIO = "Filtrar2";
	public final static String FILTRO_SOLICITUD_X_ESTADO = "Filtrar3";
	public final static String FILTRO_SOLICITUD = "Filtrar4";



	

	public final static String ATENDER = "Atender Solicitudes";

	private VentanaEmergenteAtencion ventanaEmergente;
	
	private JList listaSolicitudes;
//	private JButton butConfirmar;
	private JButton butListarSolicitud;
	
	
	private ButtonGroup grupoButton;
	private JLabel labgrupoBotones; 
	
	private JLabel labCliente;
	private JTextField textCliente;
	private JComboBox comboSolicitud;
	private JComboBox comboProducto;

	private JComboBox comboSolicitud1;
	private JLabel labFuncionario;
	private JTextField textFuncionario;
	
	private JLabel labTipoSolicitud2;
	private JComboBox comboSolicitud2;



	private JButton butPrimerFiltro;
	private JButton butSegundoFiltro;
	private JButton butTercerFiltro;
	private JButton butCuartoFiltro;


	String[] el = { "a", "b", "c" };

	public Panel4Atencion() {

		
		ventanaEmergente= new VentanaEmergenteAtencion();
		setSize(900, 770);
		setVisible(true);
		 setLayout(new GridLayout(3, 1));
//		setLayout(new BorderLayout());
		// setLayout(new BorderLayout());
		TitledBorder t1 = new TitledBorder("listar Solicitudes");
		setBorder(t1);

		butPrimerFiltro = new JButton(FILTRO_CLIENTE_X_PRODUCTO);
		butPrimerFiltro.setActionCommand(FILTRO_CLIENTE_X_PRODUCTO);
		butPrimerFiltro.addActionListener(this);
		
		butSegundoFiltro = new JButton(FILTRO_SOLICITUD_X_FUNCIONARIO);
		butSegundoFiltro .setActionCommand(FILTRO_SOLICITUD_X_FUNCIONARIO);
		butSegundoFiltro .addActionListener(this);
		
		butTercerFiltro = new JButton(FILTRO_SOLICITUD_X_ESTADO);
		butTercerFiltro .setActionCommand(FILTRO_SOLICITUD_X_ESTADO);
		butTercerFiltro.addActionListener(this);

		
		butCuartoFiltro = new JButton(FILTRO_SOLICITUD);
		butCuartoFiltro .setActionCommand(FILTRO_SOLICITUD);
		butCuartoFiltro.addActionListener(this);
		
		labCliente= new JLabel("  ID cliente");
		textCliente= new JTextField();
		
		
		/// Este combo Box hace parte del filtrado de solicitud por tipo
		comboSolicitud = new JComboBox<>();
		comboSolicitud.addActionListener(this);
		comboSolicitud.addItem("Registrar");
		comboSolicitud.addItem(" Cancelar");
		comboSolicitud.addItem(" Reclamo");
		comboSolicitud.addItem(" Reporte");
		comboSolicitud.addItem(" Modificación");

////////////////////////////////////////////////////////////////////////////////////

		labFuncionario = new JLabel("Id Funcionario");
		textFuncionario = new JTextField();
		
		
		///Este combo box hace parte del filtro de solicitud y funcionario
		comboSolicitud1 = new JComboBox<>();
		comboSolicitud1.addActionListener(this);
		comboSolicitud1.addItem("Registrar");
		comboSolicitud1.addItem(" Cancelar");
		comboSolicitud1.addItem(" Reclamo");
		comboSolicitud1.addItem(" Reporte");
		comboSolicitud1.addItem(" Modificación");
///////////////////////////////////////////////////////////////
		

////__________//////Este combo BOX hace parte del filtro de solicitud y estado
		labTipoSolicitud2=new JLabel("       Tipo solicitud         ");
		comboSolicitud2 = new JComboBox<>();
		comboSolicitud2.addActionListener(this);
		comboSolicitud2.addItem("Registrar");
		comboSolicitud2.addItem(" Cancelar");
		comboSolicitud2.addItem(" Reclamo");
		comboSolicitud2.addItem(" Reporte");
		comboSolicitud2.addItem(" Modificación");
//////_________//////////////////////////////////////////


		
		
////////_______ESTE COMBO BOX HACE PARTE DEl filtro de cliente por producto		
		comboProducto = new JComboBox<>();
		comboProducto.addActionListener(this);
		comboProducto.addItem("Servicio de voz");
		comboProducto.addItem("Servicio de datos");
		comboProducto.addItem("Servicio integrado");
		
///////____________________________________________________________________		
		
//		butConfirmar = new JButton(CONFIRMAR);
//		butConfirmar.setActionCommand(CONFIRMAR);
//		butConfirmar.addActionListener(this);

		butListarSolicitud = new JButton(ATENDER);
		butListarSolicitud.setActionCommand(ATENDER);
		butListarSolicitud.addActionListener(this);

		listaSolicitudes = new JList<>(el);
		listaSolicitudes.setBorder(new TitledBorder("Lista de solicitudes"));
		listaSolicitudes.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		listaSolicitudes.addListSelectionListener(this);
		listaSolicitudes.setSize(200, 200);
		JScrollPane panelDesplazamiento = new JScrollPane(listaSolicitudes);

		JRadioButton b1 = new JRadioButton("Activa");
		JRadioButton b2 = new JRadioButton("Desactivo");

		labgrupoBotones = new JLabel(" Estado");
		grupoButton = new ButtonGroup();
		grupoButton.add(b1);
		grupoButton.add(b2);
		// setLayout(new GridLayout(3,1));

		
		
		
		/////Panel de lalista de solicitudes_______________________________________
		JPanel panel1 = new JPanel();
		panel1.setSize(getMaximumSize());
		panel1.setLayout(new GridLayout(1, 1));
		panel1.add(listaSolicitudes);
//		panel1.add(new JLabel());
//////////////////////////////////////_______________________________________________
		
		
// ESTOS PAneles son los filtros que se pueden observar	_____________________________________________________________________	
		JPanel panel21 = new JPanel();
		panel21.setLayout(new GridLayout(2, 3));
		panel21.add(new JLabel("TipoProducto"));
		panel21.add(comboProducto);
		panel21.add(new JLabel(""));

		panel21.add(labCliente);
		panel21.add(textCliente);
//		panel21.add(new JLabel(""));

		panel21.setBorder(new TitledBorder("Filtrado X Productos por cliente "));

		panel21.add(butPrimerFiltro);
//		panel21.add(new JLabel(""));

		JPanel panel22 = new JPanel();
		panel22.setBorder(new TitledBorder("Filtrado por solicitud y Funcionario "));
		panel22.setLayout(new GridLayout(2, 3));
		panel22.add(new JLabel("Tipo Solicitud "));
		panel22.add(comboSolicitud1);
		panel22.add(new JLabel());
		panel22.add(labFuncionario);
		panel22.add(textFuncionario);
		panel22.add(butSegundoFiltro);
		
		
		JPanel panel23= new JPanel();
		panel23.setBorder(new TitledBorder("Filtrado por solictud y Estado "));
		panel23.setLayout(new GridLayout(3, 3));
		panel23.add(labgrupoBotones);
		panel23.add(b1);
		panel23.add(b2);
		panel23.add(labTipoSolicitud2);
		panel23.add(comboSolicitud2);
		panel23.add(butTercerFiltro);
		panel23.add(new JLabel(""));
		panel23.add(new JLabel(""));
		panel23.add(new JLabel(""));



		JPanel panel24= new JPanel();
		panel24.setBorder(new TitledBorder("Filtrado Por tipo Solicitud"));
		panel24.setLayout(new GridLayout(2, 3));
		panel24.add(new JLabel("Tipo Solicitud"));
		panel24.add(comboSolicitud);
		panel24.add(butCuartoFiltro);
		
		panel24.add(new JLabel(""));
		panel24.add(new JLabel(""));
		panel24.add(new JLabel(""));



		


		
		
		

		JPanel panel2 = new JPanel();
		panel2.setLayout(new GridLayout(2, 2));
//		panel2.add(labgrupoBotones);
//		panel2.add(b1);
//		panel2.add(b2);
		panel2.add(panel21);
//		panel2.add(new JLabel());
//		panel2.add(new JLabel());
		
//		panel2.add(new JLabel());
		panel2.add(panel22);
//		panel2.add(new JLabel());
		
//		panel2.add(new JLabel());
		panel2.add(panel23);
//		panel2.add(new JLabel());
		
		
		panel2.add(panel24);
//		panel2.add(new JLabel());
//		panel2.add(new JLabel());
		
////////////////////////////////////////////////////_________________________________________________________________		
		
		



//////////////////////////PANEL DE BOTONES__________________________________________


		JPanel panel3 = new JPanel();
		panel3.add(butListarSolicitud);
//		panel3.add(butConfirmar);

		
		// add(new JLabel("hhjdfjhfdjfg"), BorderLayout.NORTH);
		// add(panel1, BorderLayout.CENTER);
		add(panel2, BorderLayout.NORTH);
		add(panel1, BorderLayout.WEST);
		add(panel3, BorderLayout.SOUTH);
//		add(new JPanel(), BorderLayout.CENTER);
		// add(new JLabel(), BorderLayout.SOUTH);
////////////////////////////_____________________________________________________________
	}
	
	
	
/////////////////////////////ESTE metodo desahilita el botón de etender cuando se filtar por cliente y producto____________________
	
	public void habilitarBotones(boolean valor) {
		
		butListarSolicitud.setEnabled(valor);
//		butConfirmar.setEnabled(valor);
	}
/////////////////////////////////______________________________________________________________________________________
	@Override
	
	
	
	
	
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

		String e1= e.getActionCommand();
		
		if(e1.equals(FILTRO_CLIENTE_X_PRODUCTO)) {
			habilitarBotones(false);
		} 
		if(e1.equals(FILTRO_SOLICITUD)) {
			habilitarBotones(true);

		}
		if(e1.equals(FILTRO_SOLICITUD_X_ESTADO)) {
			habilitarBotones(true);

		}
		if(e1.equals(FILTRO_SOLICITUD_X_FUNCIONARIO)) {
			habilitarBotones(true);
		}
		
		
		if (e1.equals(ATENDER)) {
			
			if(listaSolicitudes.isSelectionEmpty()) {
				JOptionPane.showMessageDialog(null, "Selecione una solictud de la lista");
			}else {
			
			VentanaEmergenteAtencion v= new VentanaEmergenteAtencion();
            v.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);

			v.setVisible(true);
			v.getComboMenu().addItem(listaSolicitudes.getSelectedValue());
			}
			
		}
	}

	public JList getListaSolicitudes() {
		return listaSolicitudes;
	}



	public void setListaSolicitudes(JList listaSolicitudes) {
		this.listaSolicitudes = listaSolicitudes;
	}



	public JTextField getTextCliente() {
		return textCliente;
	}



	public void setTextCliente(JTextField textCliente) {
		this.textCliente = textCliente;
	}


/////// Este combo Box hace parte del filtrado de solicitud por tipo____________________________
	public JComboBox getComboSolicitud() {
		return comboSolicitud;
	}

	public void setComboSolicitud(JComboBox comboSolicitud) {
		this.comboSolicitud = comboSolicitud;
	}
///////////////////////////////////////////////////////////////////__________________________




	
//////////////////////_______ESTE COMBO BOX HACE PARTE DEl filtro de cliente por producto		
	
	public JComboBox getComboProducto() {
		return comboProducto;
	}

	public void setComboProducto(JComboBox comboProducto) {
		this.comboProducto = comboProducto;
	}


////////////_______ESTE COMBO BOX HACE PARTE DEl filtro de cliente por producto		

	
	
	

///Este combo box hace parte del filtro de solicitud y funcionario_____________________
       public JComboBox getComboSolicitud1() {
		return comboSolicitud1;
	}

       public void setComboSolicitud1(JComboBox comboSolicitud1) {
    	   this.comboSolicitud1 = comboSolicitud1;
       }

///////////_________________________________________________________________________



	public JTextField getTextFuncionario() {
		return textFuncionario;
	}



	public void setTextFuncionario(JTextField textFuncionario) {
		this.textFuncionario = textFuncionario;
	}

	
	

////__________//////Este combo BOX hace parte del filtro de solicitud y estado

	public JComboBox getComboSolicitud2() {
		return comboSolicitud2;
	}
	
	public void setComboSolicitud2(JComboBox comboSolicitud2) {
		this.comboSolicitud2 = comboSolicitud2;
	}
////__________//////Este combo BOX hace parte del filtro de solicitud y estado


	
	
	
	

	@Override
	public void valueChanged(ListSelectionEvent e) {
		// TODO Auto-generated method stub
		// String selectedItem = (String) listaSolicitudes.getSelectedValue();
		// if(selectedItem.equals("a")) {
		// JOptionPane.showMessageDialog(null,"se selecionó este elemento "+
		// selectedItem);
		// }
	}

}
