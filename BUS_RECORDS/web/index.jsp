<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
        if(request.getParameter("submit")!=null){
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String gender = request.getParameter("gender");
            String Phone_number = request.getParameter("Phone_number");
            String date = request.getParameter("date");
            String Origin = request.getParameter("Origin");
            String Destination = request.getParameter("Destination");
            String Bus_id = request.getParameter("Bus_name");
            
            
            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
//            pst = con.prepareStatement("INSERT into passenger(fname,lname,gender,Phone_number,date)values(?,?,?,?,?)");
//            pst1 = con.prepareStatement("INSERT into bus (Bus_name, Origin,Destination) values (?,?,?)");
             pst=con.prepareStatement("INSERT into passenger(fname,lname,gender,Phone_number,date,Bus_id)values(?,?,?,?,?,?)");
            
            
            pst.setString(1,fname);
            pst.setString(2, lname);
            pst.setString(3, gender);
            pst.setString(4,Phone_number);
            pst.setString(5, date);
            
            pst.setString(6, Bus_id);
            
          //  pst.setString(6,Bus_id);
          //  pst.setString(7,Origin);
          //  pst.setString(8,Destination);
            
            pst.executeUpdate();
            
      
            %>
            
            <script>
                alert("record added successfully")
            </script>
            
            <%
        }
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/main.css">
    </head>
    <body>
        <div class="container">
        <h1 class="text-center mt-5"style="background-color:whitesmoke; color:green;">BUS PASSENGER RECORD MANAGEMENT SYSTEM </h1><br>
        <div class="row">
            
                <form action="#" method="POST">
                    <div align="left">
                        <label class="form-label">FIRST NAME</label>
                        <input type="text" class="form-control" name="fname" id="fname"required>
                    </div>
                    <div align="left">
                        <label class="form-label">LAST NAME</label>
                        <input type="text" class="form-control" name="lname" id="lname" required>
                    </div>
                    <div align="left">
                        <label class="form-label">GENDER</label>
                        <select name="gender" class="form-control">
                            <option> select Gender</option>
                            <option value="Male"> Male</option>
                            <option value="Female"> Female</option>
                           
                        </select>
                    </div>
                     <div align="left">
                        <label class="form-label">PHONE_NO</label>
                        <input type="text" class="form-control" name="Phone_number" id="Phone_number" required>
                    </div>
                    <div align="left">
                        <label class="form-label">DATE</label>
                        <input type="date" class="form-control" name="date" id="date" required>
                    </div>
                    <div align="left">
                        <label class="form-label">BUS NAME</label>
                        
                        <select id="inputState" onchange="changeroute()" name="Bus_name" class="form-control">
                            <option>select bus name</option>
                            
        
                            
                <%
                           try{
                                    Connection con;
                                    Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/passenger_records", "root", "");
            Statement st = con.createStatement();
            String query = "select * from bus";
            ResultSet rs;
            
            rs = st.executeQuery(query);
            while(rs.next()){
                %>
                <option value="<%=rs.getString("Bus_id")%>"><%=rs.getString("Bus_name")%></option>
                <%    
            }
                                       }
                                      
                                           
                               
                               catch(Exception e){
                               

}
                         %>      
                        </select>
             
                            
                    </div>
                  
                    <br>
                     <div align="right">
                         <input type="submit" value="submit" name="submit" class="btn btn-primary">
                         <input type="reset" value="reset" name="reset" class="btn btn-danger">
                    </div>
                     
                </form>
            
           </div>
           </div>
        <a href="register.jsp" class="btn btn-primary" style="margin-right: 20px;">Register Bus</a>
        <a href="result.jsp" class="btn btn-success">check result</a>
        <script src="bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        
        <script>
            function changeroute(){
            bus = document.getElementById('inputState').value
            console.log(bus)    
    }
            </script>
    </body>
</html>
