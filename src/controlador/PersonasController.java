package controlador;

import modelo.Personas;
import modelo.PersonasDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PersonasController", value = "/PersonasController")
public class PersonasController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PersonasDAO personaDAO = new PersonasDAO();

        String accion;

        RequestDispatcher dispatcher = null;

        accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/Personas/index.jsp");
            List<Personas>  listaPersonas = personaDAO.listarpersonas();
            request.setAttribute("lista",listaPersonas);
        }

        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
