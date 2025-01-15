package com.mycompany.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexioMariaDB {
    private static final String URL = "jdbc:mariadb://192.168.50.10:3306/llibres";
    private static final String USER = "tomas";
    private static final String PASSWORD = "Cala";

    // Mètode per obtenir una connexió
    public static Connection getConnection() throws SQLException {
        try {
            // Carrega el controlador de MariaDB
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver de MariaDB/MySQL no trobat: " + e.getMessage(), e);
        }
        // Retorna la connexió a la base de dades
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
