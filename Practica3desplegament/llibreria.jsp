<!--
 * @file llibreria.jsp
 * @brief Pàgina JSP per mostrar el llistat de llibres.
 * @details Aquesta pàgina utilitza connexió a la base de dades MariaDB per obtenir les dades dels llibres i les mostra en una taula amb estil Bootstrap.
-->
<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.utils.ConnexioMariaDB" %>
<!DOCTYPE html>
<html>
<head>
    <!--
     * @tag title
     * @brief Títol de la pàgina.
     * @value Llibres - La Meva Llibreria
    -->
    <title>Llibres - La Meva Llibreria</title>

    <!--
     * @tag link
     * @brief Enllaç a la fulla d'estils de Bootstrap per donar format a la pàgina.
    -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <!--
         * @section heading
         * @brief Encapçalament principal de la pàgina.
        -->
        <h1 class="text-center">Llistat de Llibres</h1>

        <!--
         * @section table
         * @brief Taula per mostrar les dades dels llibres recuperats de la base de dades.
         * @details Aquesta taula inclou columnes per ID, Títol, Autor i Gènere.
        -->
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Títol</th>
                    <th>Autor</th>
                    <th>Gènere</th>
                </tr>
            </thead>
            <tbody>
                <!--
                 * @section data-fetching
                 * @brief Recuperació de dades des de la base de dades MariaDB.
                 * @details Utilitza ConnexioMariaDB per establir la connexió i executar la consulta SQL.
                -->
                <%
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        con = ConnexioMariaDB.getConnection();
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT id, titol, autor, genere FROM llibres");

                        while (rs.next()) {
                %>
                <tr>
                    <!--
                     * @tag td
                     * @brief Columnes amb dades recuperades de la base de dades.
                    -->
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("titol") %></td>
                    <td><%= rs.getString("autor") %></td>
                    <td><%= rs.getString("genere") %></td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("<tr><td colspan='4' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (con != null) try { con.close(); } catch (SQLException ignore) {}
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
