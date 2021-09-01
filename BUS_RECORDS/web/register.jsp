<%-- 
    Document   : register
    Created on : Jul 20, 2021, 11:49:37 AM
    Author     : Jeedie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String bus_id =(String) session.getAttribute("Bus_id");
        if(request.getParameter("submit")!=null){
            String route = request.getParameter("route");

            String Bus_id = request.getParameter("Bus_name");
            
            
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
            pst=con.prepareStatement("INSERT into bus(Bus_name,Route_id)values(?,?)");

            

            
            pst.setString(1,Bus_id);
            pst.setString(2,route);

            
            pst.executeUpdate();
            
      
            %>
            
            <script>
                alert("Bus registered successfully")
            </script>
            
            <%
        }
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> BUS REGISTRATION</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/main.css">
    </head>
    <body>
        <div class="container">
        <h1 class="text-center mt-5"style="background-color:whitesmoke; color:red;"> BUS REGISTRATION </h1><br>
        <div class="row">
            
                <form action="#" method="POST">
                    <div align="left">
                        <label class="form-label">BUS NAME</label>
                        <input type="text" class="form-control" name="Bus_name" id="Bus_name"required>
                    </div><br>
                    
                   
                      <select id="inputState"  name="route" class="form-control">
                            <option>select route</option>
                            
        
                            
                <%
                           try{
                                    Connection con;
                                    Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
            Statement st = con.createStatement();
            String query = "select * from route";
            ResultSet rs;
            
            rs = st.executeQuery(query);
            while(rs.next()){
                %>
                <option value="<%=rs.getString("Route_id")%>"><%=rs.getString("Route_name")%></option>
                
                <%    
            }
                                       }
                                      
                                           
                               
                               catch(Exception e){
                               

}
                         %>      
                        </select>
             
                    
                        
                        
                    
                     <div align="right">
                         <input type="submit" value="submit" name="submit" class="btn btn-primary">
                    </div>
                     
                </form>
            
           </div>
           </div>
        <script src="bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </body>
</html>