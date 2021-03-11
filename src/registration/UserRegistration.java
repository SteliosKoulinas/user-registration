package registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int autoIncKeyFromApi = -1;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "root");
			
			PreparedStatement st = con.prepareStatement("insert into USER(name, surname, gender, birthday) values(?,?,?,?)");

			st.setString(1, request.getParameter("name"));
			st.setString(2, request.getParameter("surname"));
			st.setString(3, request.getParameter("gender"));
			st.setString(4, request.getParameter("birthday"));
			st.executeUpdate();

			ResultSet rs = st.executeQuery("SELECT LAST_INSERT_ID()");

			if (rs.next()) {
				autoIncKeyFromApi = rs.getInt(1);
			}

			if (autoIncKeyFromApi > 0) {
				st = con.prepareStatement("insert into ADDRESS(work_address, home_address, user_id) values(?,?,?)");
				st.setString(1, request.getParameter("workaddress"));
				st.setString(2, request.getParameter("homeaddress"));
				st.setInt(3, autoIncKeyFromApi);
				st.executeUpdate();
			}

		
			st.close();
			con.close();

			response.sendRedirect("display.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
