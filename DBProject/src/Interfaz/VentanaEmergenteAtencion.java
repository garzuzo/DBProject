package Interfaz;

import java.awt.BorderLayout;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

import com.toedter.calendar.JCalendar;

public class VentanaEmergenteAtencion extends JDialog implements ActionListener{
	public final static String CONFIRMAR= "Confirmar Acción";
	private JButton butConfirmar;

	private JLabel labFuncionario;
	private JLabel labCedula;
	private JLabel labProducto;
	private JLabel labProductoCambio;
	private JLabel LabtipoSolicitud;
	private JLabel labObservacion;
	
	private JTextField textCedula;
	private JTextField textFuncionario;

	
	private JMenu menu;
	private JComboBox comboMenu;
	private JComboBox comboProducto;
	private JComboBox comboProductoCambio;
	
	private JCalendar calendario;

	private JTextArea AtextObservacion;
	private Panel4Atencion panel4;
	
	public VentanaEmergenteAtencion() {
		
		setSize(680, 500);
//		setVisible(true);
		TitledBorder t = new TitledBorder("Atender Solicitud");
		setTitle("Atender solicutd");
		
		
		
		calendario=new JCalendar();
		butConfirmar= new JButton(CONFIRMAR);
		butConfirmar.setActionCommand(CONFIRMAR);
		butConfirmar.addActionListener(this);
		
		
		labFuncionario=new JLabel("ID Funcionario");
		labCedula = new JLabel("  Cedula Cliente");
		labProducto=new JLabel("Tipo producto");
		labProductoCambio=new JLabel("   Tipo Anomalía");
		LabtipoSolicitud = new JLabel("tipoSolicitud");
		labObservacion = new JLabel("Observación");
		textCedula = new JTextField(" cedula del cliente");
//		textCedula.setEditable(false);
		textFuncionario=new JTextField("");


		
		
//		setLayout(new GridLayout(1, 6));
		AtextObservacion = new JTextArea(18,30);

		
//		setSize(900, 770);
////		setVisible(true);
////		 setLayout(new GridLayout(5, 1));
//		setLayout(new BorderLayout());
//		setLayout(new BorderLayout());
//		TitledBorder t2 = new TitledBorder("Gestion Solicitud");
		// setLayout(new BorderLayout());


		comboMenu = new JComboBox();
		comboMenu.addActionListener(this);
//		comboMenu.addItem("Reportar solicitud");
//		comboMenu.addItem("Cancelar solicitud");
//		comboMenu.addItem("Reclamo");

		
		comboProducto= new JComboBox<>();
		comboProducto.addActionListener(this);
		comboProducto.addItem("Servicio de voz");
		comboProducto.addItem("Servicio de datos");
		comboProducto.addItem("Servicio integrado");
		
		
		comboProductoCambio=new JComboBox();
		comboProductoCambio.addActionListener(this);
		comboProductoCambio.addItem("Mal servico");
		comboProductoCambio.addItem("baja velocidad");
		comboProductoCambio.addItem("Servico inestable");
		


		
		JPanel panel1=new JPanel();
//		panel1.setSize(200000, 7000000);
		panel1.setLayout(new GridLayout(4, 4));
//		panel1.setBorder(new TitledBorder("Panel 1"));
		// comboMenu.setActionCommand(ACTION_COMBO);
		// comboMenu.setSelectedIndex(0);

//		panel1.add(new JLabel());
		panel1.add(LabtipoSolicitud);
		panel1.add(comboMenu);
//		panel1.add(new JLabel());
		///
//		panel1.add(new JLabel("JHJHJH"));
//		panel1.add(new JLabel("M;Mb,"));
//		panel1.add(new JLabel("MHNgbj"));
//		panel1.add(new JLabel("JHHJ"));
	////////////////////////////////
//		panel1.add(new JLabel());
	    panel1.add(labCedula);
	    panel1.add(textCedula );
//		panel1.add(new JLabel());
		////////////////////
		panel1.add(new JLabel());
		panel1.add(new JLabel());
		panel1.add(labFuncionario);
		panel1.add(textFuncionario);
	////////////////////////////
		panel1.add(new JLabel());
//		panel1.add(labProducto);
//		panel1.add(comboProducto);
		panel1.add(new JLabel());
		
		//////////
	//	
		/////////////////////////////////////////
		
		panel1.add(new JLabel());
//		panel1.add(labProductoCambio);
//		panel1.add(comboProductoCambio);
		panel1.add(new JLabel());

		

		panel1.add(new JLabel());
		panel1.add(new JLabel());
		panel1.add(new JLabel());
		panel1.add(new JLabel());

		 
	   
	   
	   
	   JPanel panel2= new JPanel();
	   
		/////segundo panel
	   panel2.setLayout(new GridLayout(2, 4));
	   
	   panel2.add(new JLabel());
	   panel2.add(new JLabel());
	   panel2.add(new JLabel());
	   panel2.add(new JLabel());

	//   panel2.add(new JLabel());
	//   panel2.add(labObservacion);
	//   panel2.add(AtextObservacion);
	//   panel2.add(new JLabel());



	   
	   
	   JPanel panel3 =new JPanel();
	   panel3.add(butConfirmar);
	   
	   JPanel  panel4= new JPanel();
	   panel4.add(calendario);
	   panel4.add(labObservacion);
	   panel4.add(AtextObservacion);
	   
	   add(panel1, BorderLayout.NORTH);
	//   add(new JLabel());
	//   add(panel2, BorderLayout.CENTER);
	   
	//   add(new JLabel(), BorderLayout.WEST);
	   add(panel3, BorderLayout.SOUTH);
	   
	   add(panel4 , BorderLayout.WEST);
		
	}

	
	
	

	public JTextField getTextCedula() {
		return textCedula;
	}





	public void setTextCedula(JTextField textCedula) {
		this.textCedula = textCedula;
	}





	public JTextField getTextFuncionario() {
		return textFuncionario;
	}





	public void setTextFuncionario(JTextField textFuncionario) {
		this.textFuncionario = textFuncionario;
	}





	public JComboBox getComboMenu() {
		return comboMenu;
	}





	public void setComboMenu(JComboBox comboMenu) {
		this.comboMenu = comboMenu;
	}





	public JComboBox getComboProducto() {
		return comboProducto;
	}





	public void setComboProducto(JComboBox comboProducto) {
		this.comboProducto = comboProducto;
	}





	public JComboBox getComboProductoCambio() {
		return comboProductoCambio;
	}





	public void setComboProductoCambio(JComboBox comboProductoCambio) {
		this.comboProductoCambio = comboProductoCambio;
	}





	public JTextArea getAtextObservacion() {
		return AtextObservacion;
	}





	public void setAtextObservacion(JTextArea atextObservacion) {
		AtextObservacion = atextObservacion;
	}





	@Override
	public void actionPerformed(ActionEvent e) {

       String e1= e.getActionCommand();
       
       if(CONFIRMAR.equals(e1)) {
    	   JOptionPane.showMessageDialog(null," Aquí se verifica que el funcionario tenga asiganada la solcitud"+"\n"
                                           +" correspondiente al cliente"+ "\n" +" en el campo del cliente debría aparecer la cedula del cliente asociado a esa solicitud"  );
       }
	}
	
	
	
	
	
	
	

}
