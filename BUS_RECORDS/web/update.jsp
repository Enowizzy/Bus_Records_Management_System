<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
        if(request.getParameter("submit")!=null){
             String p_id = request.getParameter("p_id");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String gender = request.getParameter("gender");
            String date = request.getParameter("date");
            String Phone_number = request.getParameter("Phone_number");
//           
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
            pst = con.prepareStatement("update passenger set fname=?, lname=?, gender=?, date=? ,Phone_number=?where p_id=?");
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, gender);
            pst.setString(4, date);
            pst.setString(5, Phone_number);
           
            pst.setString(6, p_id);
            pst.executeUpdate();
            
            
            %>
            
            <script>
                alert("Details updated successfully")
            </script>
            
            <%
        }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
      
        <div class="container row">
              <h1>Passenger Update</h1>
             <div class="col-md-4 container ">
                <form action="#" method="POST">
                    <%
                       Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
            String p_id  = request.getParameter("p_id");
            pst =con.prepareStatement("select * from passenger where p_id = ?");
            pst.setString(1, p_id);
            rs = pst.executeQuery();
            while(rs.next()){
                 %>
                    <div align="left">
                        <label class="form-label">FIRST NAME</label>
                        <input type="text" class="form-control"  value="<%= rs.getString("fname")%>" name="fname" id="fname" required>
                    </div>
                    <div align="left">
                        <label class="form-label">LAST NAME</label>
                        <input type="text" class="form-control"  value="<%= rs.getString("lname")%>" name="lname" id="lname" required>
                    </div>
                     <div align="left">
                        <label class="form-label">GENDER</label>
                        <input type="text" class="form-control"  value="<%= rs.getString("gender")%>" name="gender" id="gender" required>
                    </div>
                    <div align="left">
                        <label class="form-label">DATE</label>
                        <input type="date" class="form-control"  value="<%= rs.getString("date")%>" name="date" id="date" required>
                    </div>
                    <div align="left">
                        <label class="form-label">PHONE NUMBER</label>
                        <input type="varchar" class="form-control" value="<%= rs.getString("Phone_number")%>" name="Phone_number" id="Phone_number" required>
                    </div>
                 <%    
                     }    
                 %>
                    <br>
                     <div align="right">
                         <input type="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                    <p><a href="index.jsp">Go back</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
