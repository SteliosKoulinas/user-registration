<%@ page import="java.sql.*" import="java.util.ArrayList"
	import="java.util.List" import="registration.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register New User</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

</head>
<body>
	<nav class="navbar bg-dark">
		<a class='nav-link' href="index.jsp">Home</a> <a class='nav-link'
			href="display.jsp">Display Users</a> <a class='nav-link'
			href="register.jsp">Register New User</a>

	</nav>
	<div class="fluid-container">
		<div class="row d-flex justify-content-center">
			<table border=1 cellpadding=2 cellspacing=0>
				<tr>
					<th>id</th>
					<th>Name</th>
					<th>Surname</th>
					<th>Gender</th>
					<th>Birthday</th>
					<th>Work Address</th>
					<th>Home Address</th>
					
				</tr>
				<%
				ResultSet rset;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "root");
				Statement st = con.createStatement();

				ArrayList<User> listUsers = new ArrayList<User>();

			

				rset = st.executeQuery("SELECT * FROM USER, ADDRESS WHERE USER.id = ADDRESS.user_id");
				while (rset.next()) {
					int id = rset.getInt("id");
					String name = rset.getString("name");
					String surname = rset.getString("surname");
					String gender = rset.getString("gender");
					String birthday = rset.getString("birthday");
					String workaddress = rset.getString("work_address");
					String homeaddress = rset.getString("home_address");
					

					User user = new User(id, name, surname, gender, birthday, workaddress, homeaddress);
					listUsers.add(user);
				%>
				<tr>
					<td><%=id%></td>
					<td id="<%=id%>" onclick="reply_click(this.id)"><%=name%></td>
					<td><%=surname%></td>
					<td><%=gender%></td>
					<td><%=birthday%></td>
					<td><%=workaddress%></td>
					<td><%=homeaddress%></td>
					
				</tr>
				<%
				}

				rset.close();
				st.close();
				con.close();
				%>
			</table>
		</div>
	</div>
</body>

<script type="text/javascript">

	function reply_click(id) {
		console.log(id);
	}
</script>