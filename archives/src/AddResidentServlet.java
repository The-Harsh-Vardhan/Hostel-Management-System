import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addResident")
public abstract class AddResidentServlet implements javax.servlet.Servlet {

    public void init() throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html");

        // Get form data from the request
        String name = request.getParameter("name");
        String ageParam = request.getParameter("age");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");

        // Validate input
        if (name == null || name.isEmpty() || ageParam == null || ageParam.isEmpty() || gender == null
                || gender.isEmpty() || contact == null || contact.isEmpty()) {
            ((HttpServletResponse) response).setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.println("All fields are required.");
            return;
        }

        int age;
        try {
            age = Integer.parseInt(ageParam);
            if (age <= 0) {
                throw new NumberFormatException("Age must be a positive integer.");
            }
        } catch (NumberFormatException e) {
            ((HttpServletResponse) response).setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.println("Invalid age provided.");
            return;
        }

        // Create a ResidentDAO object and add the resident
        ResidentDAO residentDAO = new ResidentDAO();

        try {
            // Assuming roomId will be dynamically assigned in the database or selected by
            // the admin
            int roomId = 1; // Default room assignment, can be modified
            residentDAO.addResident(name, age, gender, contact, roomId);

            // Redirect to the same page or to another page after adding the resident
            ((HttpServletResponse) response).sendRedirect("resident.jsp");
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            ((HttpServletResponse) response).setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.println("An error occurred while adding the resident: " + e.getMessage());
        }
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}