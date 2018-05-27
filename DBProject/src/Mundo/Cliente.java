package Mundo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class Cliente {

	private static int contadorSol;
	
	private static int contadorProd;

	public static void main(String[] args) {
		
			registrarDriver();
		
			Calendar cal= Calendar.getInstance();
			
			Date fechaSol= new Date(cal.getTimeInMillis());
			
			try {
				insertarSolicitud(1000, 15,"nada" , fechaSol, "PENDIENTE", 0);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

	}

	public static Connection conectarYConsultarBD(String username, String password) throws SQLException {
		
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@200.3.193.24:1522:ESTUD",username,password);
		
		return con;
		
	}
	
	public static Connection registrarDriver() {
		System.out.println("-------- Prueba de Registro de Oracle JDBC ------");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("Â¡Oracle JDBC Driver no encontrado!");
			e.printStackTrace();
		}
		System.out.println("Â¡Oracle JDBC Driver Registrado!");
		
		try {
		Connection con=conectarYConsultarBD("p09551_1_1", "1234");
		return con;
		} catch (SQLException e) {
		System.out.println("Fallo al conectar! Ver consola de salida");
		System.out.println(e.getMessage());
		e.printStackTrace();
		}
		return null;
	}
	
	public static void insertarCliente(int cedula, String nombre, String direccion, Date fecha, int telefono) throws Exception{

		Connection con=registrarDriver();
		String ced=""+cedula;
		if(cedula<0||ced.trim().equals("")||ced==null) {
			throw new Exception("Por favor ingrese la cedula");
		}
		
		if(nombre.trim().equals("")||nombre==null) {
			throw new Exception("Por favor ingrese el nombre del cliente");
		}
		
		if(direccion.trim().equals("")||direccion==null) {
			throw new Exception("Por favor ingrese la direccion del cliente");
		}
		CallableStatement cs = null;
		//Se realiza la llamada a la funcion de BBDD que retornará un String
	    cs = con.prepareCall("{call PKCLIENTE.pInsertar(?,?,?,?,?)}");
	    cs.setInt(1, cedula);
	    cs.setString(2, nombre);
	    cs.setString(3, direccion);
	    cs.setDate(4, fecha);
	    cs.setInt(5, telefono);
	    cs.execute(); //ejecuta la llamada y retorna un boolean, se puede usar también executeUpdate() que retorna un entero.     
	    cs.close();
	}
	
	public static void insertarSolicitud(int idProd, int idSol, String observacion, Date fechaSol, String estAt, int cliCed ) throws Exception{

		Connection con=registrarDriver();
//		String ced=""+cedula;
//		if(cedula<0||ced.trim().equals("")||ced==null) {
//			throw new Exception("Por favor ingrese la cedula");
//		}
//		
//		if(nombre.trim().equals("")||nombre==null) {
//			throw new Exception("Por favor ingrese el nombre del cliente");
//		}
//		
//		if(direccion.trim().equals("")||direccion==null) {
//			throw new Exception("Por favor ingrese la direccion del cliente");
//		}
		
		contadorSol++;
		idSol=contadorSol;
		
		contadorProd++;
		idProd=contadorProd;
		
		CallableStatement cs = null;
		//Se realiza la llamada a la funcion de BBDD que retornará un String
	    cs = con.prepareCall("{call PKREGISTRONIVEL3.pSolicitudCreacionN3(?,?,?,?,?,?)}");
	    cs.setInt(1, idProd);
	    cs.setInt(2, idSol);
	    cs.setString(3, observacion);
	    cs.setDate(4, fechaSol);
	    cs.setString(5, estAt);
	    cs.setInt(6, cliCed);
	    cs.execute(); //ejecuta la llamada y retorna un boolean, se puede usar también executeUpdate() que retorna un entero.     
	    cs.close();
	}

}
