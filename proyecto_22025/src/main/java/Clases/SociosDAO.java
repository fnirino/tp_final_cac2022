package Clases;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SociosDAO {
	
	Connection conex;
	
	private Socios getDataFromResultSet(ResultSet rs) {
		Socios soc = null;
		int id, ed, dni;
		String fname, lname, email;
		Date date;
		boolean est;
		try {
			id = rs.getInt("id_socio");
			fname = rs.getString("nombre");
			lname = rs.getString("apellido");
			email = rs.getString("mail");
			dni = rs.getInt("dni");
			date = rs.getDate("fecha_alta");
			est = rs.getBoolean("estado");
			soc = new Socios(id, fname, lname, dni, email, date, est);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return soc;
	}
	
	public SociosDAO() throws ClassNotFoundException {
		Conexion con = new Conexion();
		conex = con.getConnection();
		
	}
	
	public List<Socios> listarSocios() {
		List<Socios> lsoc = new ArrayList<>();
		PreparedStatement ps;
		ResultSet rs;
		
		try {
			ps = conex.prepareStatement("select * from socios");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Socios soc = getDataFromResultSet(rs);
				lsoc.add(soc);
			}
			
		} catch (SQLException e) {
			System.out.println("Error de conexion a DB. I:1");
			e.printStackTrace();
		}

		return lsoc;
	}
	
	public Socios mostrarSocio(int idSocio) {
		PreparedStatement ps;
		ResultSet rs;
		Socios socio = null;
		
		try {
			ps = conex.prepareStatement("select * from socios where id_socio=?");
			ps.setInt(1, idSocio);
			rs = ps.executeQuery();
			if (rs.next()) {
				socio = getDataFromResultSet(rs);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Error de conexion a DB. I:2");
			e.printStackTrace();
		}
		
		return socio;
	}
	
	public boolean insertarSocio(Socios socio) {
		PreparedStatement ps;
		
		try {
			ps = conex.prepareStatement("insert into socios (nombre, apellido, dni, mail, fecha_alta, estado) values (?, ?, ?, ?, ?, ?)");
			ps.setString(1, socio.getNombre());
			ps.setString(2, socio.getApellido());
			ps.setInt(3, socio.getDni());
			ps.setString(4, socio.getEmail());
			ps.setDate(5, socio.getAlta());
			ps.setBoolean(6, true);
			ps.execute();
			
			return true;
			
		} catch (SQLException e) {
			System.out.println("Error de conexion a DB. I:3");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean actualizarSocio(Socios socio) {
		PreparedStatement ps;
		
		try {
			ps = conex.prepareStatement("update socios set nombre=?, apellido=?, dni=?, mail=?, fecha_alta=?, estado=? where id_socio=?");
			ps.setString(1, socio.getNombre());
			ps.setString(2, socio.getApellido());
			ps.setInt(3, socio.getDni());
			ps.setString(4, socio.getEmail());
			ps.setDate(5, socio.getAlta());
			ps.setBoolean(6, socio.getEstado());
			ps.setInt(7, socio.getId());
			ps.execute();
			
			return true;
			
		} catch (SQLException e) {
			System.out.println("Error de conexion a DB. I:4");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean eliminarSocio(int idSocio) {
		PreparedStatement ps;
		
		try {
			ps = conex.prepareStatement("update socios set estado=0 where id_socio=?");
			ps.setInt(1, idSocio);
			ps.execute();
			
			return true;
			
			
		} catch (SQLException e) {
			System.out.println("Error de conexion a DB. I:5");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean eliminarSocioHard(int idSocio) {
		PreparedStatement ps;
		
		try {
			ps = conex.prepareStatement("delete from socios where id_socio=?");
			ps.setInt(1, idSocio);
			ps.execute();
			
			return true;
			
			
		} catch (SQLException e) {
			System.out.println("Error de conexion a DB. I:6");
			e.printStackTrace();
			return false;
		}
	}
}
