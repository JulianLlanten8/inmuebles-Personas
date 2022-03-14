package modelo;

import config.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PersonasDAO {
    static Connection conexion;

    public PersonasDAO() throws ClassNotFoundException {
        Conexion con = new Conexion();
        conexion = con.getConexion();

    }

    public List<Personas> listarpersonas() {
        PreparedStatement ps;
        ResultSet rs;

        List<Personas> lista = new ArrayList<>();

        try {
            ps = conexion.prepareStatement("select id,nombre,apellido,correo,direccion from personas JOIN direcciones WHERE personas.direccion = direcciones.idDireccion");
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String correo = rs.getString("correo");
                int direccion = rs.getInt("direccion");

                Personas personas = new Personas(id, nombre, apellido, correo, direccion);
                lista.add(personas);
            }
            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Ha ocurrido un error en la consulta");
            return null;
        }

    }

    public Personas mostrarPersonas(int _id) {
        PreparedStatement ps;
        ResultSet rs;

        Personas persona = null;

        try {
            ps = conexion.prepareStatement("select id,nombre,apellido,correo,direccion from personas where id =?");
            ps.setInt(1, _id);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String correo = rs.getString("correo");
                int direccion = rs.getInt("direccion");

                persona = new Personas(id, nombre, apellido, correo, direccion);

            }
            return persona;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Ha ocurrido un error en la consulta");
            return null;
        }

    }

    public static Boolean insertar(Personas persona) {
        PreparedStatement ps;
        persona = null;

        try {
            ps = conexion.prepareStatement("insert into personas(id,nombre,apellido, correo, direccion) values (?,?,?,?,?)");

            ps.setString(2, persona.getNombre());
            ps.setString(3, persona.getApellido());
            ps.setString(4, persona.getCorreo());
            ps.setInt(5, persona.getDireccion());

            ps.execute();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Ha ocurrido un error en la consulta");
            return false;
        }

    }

    public Boolean actualizar(Personas persona) {
        PreparedStatement ps;


        persona = null;

        try {
            ps = conexion.prepareStatement("update personas set id =?,nombre=?,apellido=?, correo=?, direccion=? where id =?");

            ps.setString(2, persona.getNombre());
            ps.setString(3, persona.getApellido());
            ps.setString(4, persona.getCorreo());
            ps.setInt(5, persona.getDireccion());
            ps.setInt(6, persona.getId());

            ps.execute();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Ha ocurrido un error en la consulta");
            return false;
        }

    }

    public Boolean eliminar(int _id) {
        PreparedStatement ps;

        try {
            ps = conexion.prepareStatement("delete from personas  where id =?");

            ps.setInt(1, _id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Ha ocurrido un error en la consulta");
            return false;
        }

    }
}
