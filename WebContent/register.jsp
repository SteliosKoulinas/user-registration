<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register New User</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
</head>
<body>
	<nav class="navbar bg-dark">
			<a class='nav-link' href="index.jsp">Home</a>
			<a class='nav-link' href="display.jsp">Display Users</a>
			<a class='nav-link' href="register.jsp">Register New
					User</a>
		
	</nav>
	<div class="container-fluid" >
	<div class="row d-flex justify-content-center">
	<form method="post" action="userRegistration.jsp">

		<table>
			<thead>
				<tr>
					<th colspan="2">Enter Information Here</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" required /></td>
				</tr>
				<tr>
					<td>Surname</td>
					<td><input type="text" name="surname" required /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><select required name="gender">
							<option value="male">Male</option>
							<option value="female">Female</option>
					</select></td>
				</tr>
				<tr>
					<td>Birthday</td>
					<td><input type="text" name="birthday" id="datepicker"
						required /></td>
				</tr>
				<tr>
					<td>Home Address</td>
					<td><input type="text" name="homeaddress" /></td>
				</tr>
				<tr>
					<td>Work Address</td>
					<td><input type="text" name="workaddress" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit" /></td>
					<td><input type="reset" value="Reset" /></td>
				</tr>
			</tbody>
		</table>

	</form>
	</div>
	</div>
</body>
</html>