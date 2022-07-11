package Clases;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SociosController")
public class SociosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public SociosController() {
        // TODO Auto-generated constructor stub
    }
    
    private static int parseToInt(String str, int def) {
    	try {
    		return Integer.parseInt(str);
    	} catch (NumberFormatException e) {
    		return def;
    	}
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	SociosDAO sociosDAO = null;
		try {
			sociosDAO = new SociosDAO();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String accion;
		RequestDispatcher disp = null;
		
		accion = request.getParameter("accion");
		
		if (accion == null || accion.isEmpty()) {
			disp = request.getRequestDispatcher("Vistas/socios.jsp");
		} else if (accion.equals("nuevo")) {
			disp = request.getRequestDispatcher("Vistas/nuevo.jsp");
		} else if (accion.equals("modificar")) {
			disp = request.getRequestDispatcher("Vistas/modif.jsp");
		} else if (accion.equals("insertar") || accion.equals("actualizar")) {
			int idSoc = parseToInt(request.getParameter("id_socio"), 0);
			String nom = request.getParameter("nombre");
			String ape = request.getParameter("apellido");
			String em = request.getParameter("email");
			int dni = parseToInt(request.getParameter("dni"), 0);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date alta = null;
			try {
				Date alta_aux = df.parse(request.getParameter("alta"));
				alta = new java.sql.Date(alta_aux.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			boolean est = (parseToInt(request.getParameter("estado"), 0) == 1 ? true : false);
			
			Socios soc = new Socios(idSoc, nom, ape, dni, em, alta, est);
			if (accion.equals("insertar")) {
				sociosDAO.insertarSocio(soc);
				response.sendRedirect("SociosController");
			} else {
				sociosDAO.actualizarSocio(soc);
				response.sendRedirect("SociosController");
			}
		} else if (accion.equals("eliminar")) {
			int idSoc = parseToInt(request.getParameter("id"), -1);
			if (idSoc > 0) {
				sociosDAO.eliminarSocioHard(idSoc);
			}
			response.sendRedirect("SociosController");
		}
		if (disp != null) {
			disp.forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
