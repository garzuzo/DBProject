package Interfaz;
import java.awt.BorderLayout;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class VentanaTablaSolicitudes extends JFrame{

	
	public VentanaTablaSolicitudes(ArrayList<String[]> solicitudes) {
		// TODO Auto-generated constructor stub
		setResizable(false);
		setLocation(40, 100);
		
		String[] columnNames = {"Id","Observacion","FechaSol","FechaAtencion","Estado","CedulaCliente","IdTipoSolicitud","IdFuncionario","IdProducto"};
		
		Object[][] data = new Object [solicitudes.size()] [9];
		
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data[i].length; j++) {
				if(j==3 || j==2)
					data [i] [j] = solicitudes.get(i)[j].substring(0, 10);
				else
				data [i] [j] = solicitudes.get(i)[j];
			}
		}
		
		JTable table = new JTable(data, columnNames);
		JScrollPane scrollPane = new JScrollPane(table);
		table.setFillsViewportHeight(true);
	  

	      getContentPane().add(scrollPane, BorderLayout.CENTER);
		pack();
		
	}
	
}