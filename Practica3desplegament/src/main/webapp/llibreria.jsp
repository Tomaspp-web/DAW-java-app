<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.utils.ConnexioMariaDB" %>
<!DOCTYPE html>
<html>
<head>
    <title>Llibres - La Meva Llibreria</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Llistat de Llibres</h1>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Títol</th>
                    <th>ISBN</th>
                    <th>Any Publicació</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = ConnexioMariaDB.getConnection()) {
                        String sql = "SELECT id, titol, isbn, any_publicacio FROM llibres";
                        try (PreparedStatement stmt = conn.prepareStatement(sql);
                             ResultSet rs = stmt.executeQuery()) {
                            while (rs.next()) {
                %>
                                <tr>
                                    <td><%= rs.getInt("id") %></td>
                                    <td><%= rs.getString("titol") %></td>
                                    <td><%= rs.getString("isbn") %></td>
                                    <td><%= rs.getInt("any_publicacio") %></td>
                                </tr>
                <%
                            }
                        }
                    } catch (SQLException e) {
                %>
                        <tr>
                            <td colspan="4" class="text-danger text-center">Error accedint a la base de dades: <%= e.getMessage() %></td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
