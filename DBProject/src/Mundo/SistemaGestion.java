package Mundo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;

public class SistemaGestion {

	private static int contadorSol=0;
	
	private static int contadorDanio=0;

	public static void main(String[] args) {
		
			registrarDriver();
		
			Calendar cal= Calendar.getInstance();
			
			Date fechaSol= new Date(cal.getTimeInMillis());
			
//			try {
//				insertarSolicitudCreacion(1, 15,"nada" , fechaSol, "PENDIENTE", 0);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		

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
			System.out.println("¡Oracle JDBC Driver no encontrado!");
			e.printStackTrace();
		}
		System.out.println("¡Oracle JDBC Driver Registrado!");
		
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
		
		if(cedula<0) {
			throw new Exception("Por favor ingrese la cedula positiva");
		}
		
		if(nombre.trim().equals("")||nombre==null) {
			throw new Exception("Por favor ingrese el nombre del cliente");
		}
		
		if(direccion.trim().equals("")||direccion==null) {
			throw new Exception("Por favor ingrese la direccion del cliente");
		}
		CallableStatement cs = null;
	
	    cs = con.prepareCall("{call PKCLIENTE.pInsertar(?,?,?,?,?)}");
	    cs.setInt(1, cedula);
	    cs.setString(2, nombre);
	    cs.setString(3, direccion);
	    cs.setDate(4, fecha);
	    cs.setInt(5, telefono);
	    cs.execute();     
	    cs.close();
	}
	
	public static void insertarSolicitudCreacion(int tipoProd, int idSol, String observacion, Date fechaSol, String estAt, int cliCed ) throws Exception{

		Connection con=registrarDriver();
		
		if(observacion.trim().equals("")||observacion==null) {
			throw new Exception("Debe ingresar una observacion");
		}
		if(cliCed<0) {
			throw new Exception("Debe ingresar una cedula del cliente positiva");
		}
		
		contadorSol++;
		idSol=contadorSol;
		
		CallableStatement cs = null;
		
	    cs = con.prepareCall("{call PKREGISTRONIVEL3.pSolicitudCreacionN3(?,?,?,?,?,?)}");
	    cs.setInt(1, tipoProd);
	    cs.setInt(2, idSol);
	    cs.setString(3, observacion);
	    cs.setDate(4, fechaSol);
	    cs.setString(5, estAt);
	    cs.setInt(6, cliCed);
	    cs.execute();     
	    cs.close();
	}
	
	public static void insertarSolicitudCancelacion(int idProd, int idSol, String observacion, Date fechaSol, String estAt, int cliCed ) throws Exception{

		Connection con=registrarDriver();
		
		if(observacion.trim().equals("")||observacion==null) {
			throw new Exception("Debe ingresar una observacion");
		}
		if(cliCed<0) {
			throw new Exception("Debe ingresar la cedula del cliente positiva");
		}
		if(idProd<0) {
			throw new Exception("Debe ingresar el id del producto positivo");
		}
		
		contadorSol++;
		idSol=contadorSol;
		
		CallableStatement cs = null;
		
	    cs = con.prepareCall("{call PKREGISTRONIVEL3.pSolicitudCancelacionN3(?,?,?,?,?,?)}");
	    cs.setInt(1, idProd);
	    cs.setInt(2, idSol);
	    cs.setString(3, observacion);
	    cs.setDate(4, fechaSol);
	    cs.setString(5, estAt);
	    cs.setInt(6, cliCed);
	    cs.execute();     
	    cs.close();
	}
	
	public static void insertarSolicitudReclamo(int idProd, int idSol, String observacion, Date fechaSol, String estAt, int cliCed ) throws Exception{

		Connection con=registrarDriver();
		
		if(observacion.trim().equals("")||observacion==null) {
			throw new Exception("Debe ingresar una observacion");
		}
		if(cliCed<0) {
			throw new Exception("Debe ingresar la cedula del cliente positiva");
		}
		if(idProd<0) {
			throw new Exception("Debe ingresar el id del producto positivo");
		}
		
		contadorSol++;
		idSol=contadorSol;
		
		CallableStatement cs = null;
		
	    cs = con.prepareCall("{call PKREGISTRONIVEL3.pSolicitudReclamoN3(?,?,?,?,?,?)}");
	    cs.setInt(1, idProd);
	    cs.setInt(2, idSol);
	    cs.setString(3, observacion);
	    cs.setDate(4, fechaSol);
	    cs.setString(5, estAt);
	    cs.setInt(6, cliCed);
	    cs.execute();     
	    cs.close();
	}
	
	public static void insertarSolicitudModificacion(int idProd, int tipoProd, int idSol, String observacion,Date fechaSol, String estAt, int cliCed ) throws Exception{

		Connection con=registrarDriver();
		
		if(observacion.trim().equals("")||observacion==null) {
			throw new Exception("Debe ingresar una observacion");
		}
		if(cliCed<0) {
			throw new Exception("Debe ingresar la cedula del cliente positiva");
		}
		if(idProd<0) {
			throw new Exception("Debe ingresar el id del producto positivo");
		}
		
		contadorSol++;
		idSol=contadorSol;
		
		CallableStatement cs = null;
		
	    cs = con.prepareCall("{call PKREGISTRONIVEL3.pSolicitudModificacionN3(?,?,?,?,?,?,?)}");
	    cs.setInt(1, idProd);
	    cs.setInt(2, tipoProd);
	    cs.setInt(3, idSol);
	    cs.setString(4, observacion);
	    cs.setDate(5, fechaSol);
	    cs.setString(6, estAt);
	    cs.setInt(7, cliCed);
	    cs.execute();     
	    cs.close();
	}
	
	public static void insertarSolicitudDanio(int idProd, int idDanio, int idAnom, int idSol, String observacion, Date fechaSol, String estAt, int cliCed ) throws Exception{

		Connection con=registrarDriver();
		
		if(observacion.trim().equals("")||observacion==null) {
			throw new Exception("Debe ingresar una observacion");
		}
		if(cliCed<0) {
			throw new Exception("Debe ingresar la cedula del cliente positiva");
		}
		if(idProd<0) {
			throw new Exception("Debe ingresar el id del producto positivo");
		}
		
		contadorSol++;
		idSol=contadorSol;
		
		contadorDanio++;
		idDanio=contadorDanio;
		
		CallableStatement cs = null;
		
	    cs = con.prepareCall("{call PKREGISTRONIVEL3.pSolicitudDanioN3(?,?,?,?,?,?,?,?)}");
	    cs.setInt(1, idProd);
	    cs.setInt(2, idDanio);
	    cs.setInt(3, idAnom);
	    cs.setInt(4, idSol);
	    cs.setString(5, observacion);
	    cs.setDate(6, fechaSol);
	    cs.setString(7, estAt);
	    cs.setInt(8, cliCed);
	    cs.execute();     
	    cs.close();
	}
	

}
