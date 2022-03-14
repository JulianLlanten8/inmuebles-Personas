package controlador;


import modelo.Personas;
import modelo.PersonasDAO;

/*Convierte el archivo en json*/
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "PersonasController", value = "/PersonasController")
public class PersonasController extends HttpServlet {
    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PersonasDAO personaDAO = null;
        try {
            personaDAO = new PersonasDAO();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        String accion;

        //RequestDispatcher dispatcher = null;

        accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            assert personaDAO != null;
            List<Personas> listaPersonas = personaDAO.listarpersonas();
            request.setAttribute("lista", listaPersonas);

            String personaJsonString = this.gson.toJson(listaPersonas);
            PrintWriter pw = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            pw.print(personaJsonString);
            pw.flush();

        } else if ("nuevo".equals(accion)) {
            //Nuevo vista;
        } else if ("insertar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("direccion");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("direccion");
            int direccion = Integer.parseInt(request.getParameter("direccion"));

            Personas persona = new Personas(id,nombre,apellido,correo,direccion);
            //PersonasController?accion=insertar(0,Pepito,perez,correo@gmail.com,1);

            PersonasDAO.insertar(persona);

            String personaJsonString = this.gson.toJson(persona);
            PrintWriter pw = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            pw.print(personaJsonString);
            pw.flush();
        }else if("eliminar".equals(accion)) {
            //
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
