import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddResidentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data from the request
        String name = request.getParameter("name");
        String ageParam = request.getParameter("age");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");

        // Validate input
        if (name == null || name.isEmpty() || ageParam == null || ageParam.isEmpty() || gender == null
                || gender.isEmpty() || contact == null || contact.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

        int age;
        try {
            age = Integer.parseInt(ageParam);
            if (age <= 0) {
                throw new NumberFormatException("Age must be a positive integer.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid age provided.");
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
            response.sendRedirect("resident.jsp");
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "An error occurred while adding the resident: " + e.getMessage());
        }
    }
}