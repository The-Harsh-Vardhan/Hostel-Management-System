<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<head>
    <title>Resident Management</title>
    <link rel="stylesheet" href="styles.css">
    <style>
    	
    </style>
</head>

<body>
    <header>
        <h1>Home Page</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="room.jsp">Room Management</a></li>
            </ul>
        </nav>
    </header>

    <h1>Add Resident</h1>
    <!-- Form for adding resident -->
    <form method="POST" action="resident.jsp">
        Name: <input type="text" name="name" required /><br />
        Age: <input type="text" name="age" required /><br />
        Gender: <input type="text" name="gender" required /><br />
        Contact: <input type="text" name="contact" required /><br />
        <input type="submit" value="Add Resident" />
    </form>

    <h2>Resident List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Resident ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <% 
            
		        // Load the MySQL JDBC driver
		        Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/hostels_management";
                String user = "root"; // Replace with your DB username
                String password = ""; // Replace with your DB password
                int rowsAffected = 0;

                try (Connection connection = DriverManager.getConnection(url, user, password)) {
                    
                    // Insert Resident Data if form is submitted
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String name = request.getParameter("name");
                        String age = request.getParameter("age");
                        String gender = request.getParameter("gender");
                        String contact = request.getParameter("contact");

                        // SQL query to insert new resident into the database
                        String insertSql = "INSERT INTO residents (name, age, gender, contact) VALUES (?, ?, ?, ?)";
                        try (PreparedStatement pstmt = connection.prepareStatement(insertSql)) {
                            pstmt.setString(1, name);
                            pstmt.setString(2, age);
                            pstmt.setString(3, gender);
                            pstmt.setString(4, contact);
                            
                            // Execute the insert query
                            rowsAffected = pstmt.executeUpdate();
                            
                            // Provide feedback to the user
                            if (rowsAffected > 0) {
                                out.print("<p>Resident added successfully!</p>");
                            } else {
                                out.print("<p>Error adding resident.</p>");
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.print("<p>Error: " + e.getMessage() + "</p>");
                        }
                    }

                    // Query to display all residents
                    String query = "SELECT * FROM residents";
                    try (PreparedStatement pstmt = connection.prepareStatement(query);
                         ResultSet resultSet = pstmt.executeQuery()) {
                        
                        // Loop through the result set and display each resident
                        while (resultSet.next()) {
                            int residentId = resultSet.getInt("resident_id");
                            String name = resultSet.getString("name");
                            int age = resultSet.getInt("age");
                            String gender = resultSet.getString("gender");
                            String contact = resultSet.getString("contact");
            %>
                            <tr>
                                <td><%= residentId %></td>
                                <td><%= name %></td>
                                <td><%= age %></td>
                                <td><%= gender %></td>
                                <td><%= contact %></td>
                            </tr>
            <% 
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.print("<p>Error: " + e.getMessage() + "</p>");
                }
            %>
        </tbody>
    </table>
</body>

</html>
