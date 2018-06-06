package Interfaz;
import java.awt.BorderLayout;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class VentanaTablaClientes extends JFrame{

	
	public VentanaTablaClientes(ArrayList<String[]> clientes) {
		// TODO Auto-generated constructor stub
		setResizable(false);
		setLocation(40, 100);
		
		String[] columnNames = {"Cedula","Nombre","Direccion","Fecha Nacimiento","Telefono"};
		
		Object[][] data = new Object [clientes.size()] [5];
		
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data[i].length; j++) {
				if(j==3)
					data [i] [j] = clientes.get(i)[j].substring(0, 10);
				else
				data [i] [j] = clientes.get(i)[j];
			}
		}
		
		JTable table = new JTable(data, columnNames);
		JScrollPane scrollPane = new JScrollPane(table);
		table.setFillsViewportHeight(true);
	  

	      getContentPane().add(scrollPane, BorderLayout.CENTER);
		pack();
		
	}
	
}