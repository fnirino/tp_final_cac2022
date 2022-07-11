package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	public String driver="com.mysql.cj.jdbc.Driver";
	
	public Connection getConnection() throws ClassNotFoundException {
		Connection conexion = null;
		try {
			Class.forName(driver);
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_22025_fnirino", "root", "");
		} catch (SQLException i){
			System.out.println("Error de conexion");
			i.printStackTrace();
		}	
		return conexion;
	}
	
}
