package config;

import java.sql.*;
import java.sql.DriverManager;


public class Conexion {

    public Connection getConexion() {

        try {
            String url = "jdbc:mysql://localhost/inmuebles";
            String user = "root";
            String password = "";

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion exitosa!!");
            return conexion;

        } catch (SQLException e) {
            System.err.println("Error en la conexion, compruebe el estado del servidor.💾\n"
                    + e);
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

}