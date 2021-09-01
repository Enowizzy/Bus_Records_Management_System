<%@page import="java.sql.*" %>
<%
             String p_id = request.getParameter("p_id");
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
            pst = con.prepareStatement("delete from passenger where p_id = ?");
            pst.setString(1, p_id);
            pst.executeUpdate();
            %>
            
            <script>
                alert("Details deleted successfully")
            </script>
            
    