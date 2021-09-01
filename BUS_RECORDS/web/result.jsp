7<%-- 
    Document   : result
    Created on : Jun 13, 2021, 12:41:15 PM
    Author     : madTech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results from student records</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
        <h1>PASSENGER RECORDS</h1>
        <div class="col-md-7">
                <div class="pannel-body">
                    <table id="tbl-student" class="table table-reponsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>FIRST NAME</th>
                                 <th>LAST NAME</th>
                                <th>GENDER</th>
                                 <th>PHONE NUMBER</th>
                                  <th>DATE</th>
                                <th>BUS NAME</th>
                                <th>ROUTE NAME</th>
                               
                            </tr>
                            
                            <%
                           Connection con;
                           PreparedStatement pst;
                           ResultSet rs;

                           Class.forName("com.mysql.jdbc.Driver");
                           con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");    
                            String query = "select p_id,fname,lname,gender,Phone_number,date,Bus_name,Route_name from passenger,bus,route where passenger.Bus_id=bus.Bus_id and bus.Route_id=route.Route_id";
                            Statement st = con.createStatement();
                            rs = st.executeQuery(query);
                            while(rs.next()){
                                
                                String p_id =rs.getString("p_id");
                                
                            %>
                            <tr>
                                <td><%=rs.getString("fname")%></td>
                                <td><%=rs.getString("lname")%></td>
                                <td><%=rs.getString("gender")%></td>
                                <td><%=rs.getString("Phone_number")%></td>
                                <td><%=rs.getString("date")%></td>
                                <td><%=rs.getString("Bus_name")%></td>
                                <td><%=rs.getString("Route_name")%></td>
                                
                                <td><a class="btn btn-primary"href="update.jsp?p_id=<%=p_id%>">Edit</a></td>
                                <td><a class="btn btn-danger" href="delete.jsp?p_id=<%=p_id%>">Delete</a></td>
                            </tr>
                            <%  
                                }    
                            %>
                        </head>
                    </table>
                </div>
            </div>
           </div> 
    </body>
</html>
