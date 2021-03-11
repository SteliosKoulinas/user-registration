<%@ page import="java.sql.*"%>
<%
    String name = request.getParameter("name");   
    String surname = request.getParameter("surname");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("birthday");
    String workaddress = request.getParameter("workaddress");
    String homeaddress = request.getParameter("homeaddress");
    int autoIncKeyFromApi = -1;
    
    Class.forName("com.mysql.jdbc.Driver");
    try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db",
            "root", "root");
    Statement st = con.createStatement();
    

    int i = st.executeUpdate("insert into USER(name, surname, gender, birthday) values ('" + name + "','"
    	    + surname + "','" + gender + "','"+birthday+"')");
    

    ResultSet rs = st.executeQuery("SELECT LAST_INSERT_ID()");

    if (rs.next()) {
        autoIncKeyFromApi = rs.getInt(1);
    } else {
        // throw an exception from here
    }
    
    int y = st.executeUpdate("insert into ADDRESS(work_address, home_address, user_id) values ('" + workaddress + "', '"+homeaddress+"','"+autoIncKeyFromApi+"')");
    if (i > 0 && y>0) {
    	st.close();
    	rs.close();
    	con.close();
        response.sendRedirect("display.jsp");
        
    } else {
    	st.close();
    	rs.close();
    	con.close();
        response.sendRedirect("register.jsp");
    }
	    
} catch (SQLException e) {
    System.out.println("Connection Failed! Check output console");
    return;
} 
%>