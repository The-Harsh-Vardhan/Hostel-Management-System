<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Resident Management</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        header {
            background-color: #2c3e50;
            width: 100%;
            padding: 20px 0;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            color: #ecf0f1;
            text-align: center;
            margin: 0;
            font-size: 2.5em;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 10px;
        }

        nav ul li {
            display: inline;
        }

        nav ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            transition: background-color 0.3s, color 0.3s;
        }

        nav ul li a:hover {
            background-color: #f39c12;
            color: #ffffff;
        }

        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
            position: relative;
        }

        .modal-content h2 {
            margin-bottom: 20px;
        }

        .modal-content input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .modal-content input[type="submit"] {
            background-color: #2c3e50;
            color: #ffffff;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal-content input[type="submit"]:hover {
            background-color: #f39c12;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            color: #333;
            cursor: pointer;
        }

        table {
            width: 100%;
            max-width: 800px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            margin-top: 20px;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #2c3e50;
            color: #ffffff;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Button to Open Modal */
        .open-modal-btn {
            background-color: #2c3e50;
            color: #ffffff;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 20px;
        }

        .open-modal-btn:hover {
            background-color: #f39c12;
        }
        /* Modal Background */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    overflow: auto;
    align-items: center;
    justify-content: center;
}

/* Modal Content */
.modal-content {
    background-color: #fff;
    margin: auto;
    padding: 20px;
    border-radius: 8px;
    width: 400px;
    max-width: 90%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    position: relative;
    text-align: center;
}

/* Close Button */
.close {
    position: absolute;
    top: 10px;
    right: 10px;
    color: #aaa;
    font-size: 24px;
    cursor: pointer;
}

/* Heading */
.modal-content h2 {
    color: #2c3e50;
    font-size: 1.5em;
    margin-bottom: 15px;
}

/* Form Styles */
.resident-form label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
    color: #555;
    text-align: left;
}

.resident-form input[type="text"],
.resident-form .gender-options input[type="radio"] {
    width: calc(100% - 22px);
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* Gender Options */
.gender-options {
    display: flex;
    gap: 15px;
    justify-content: center;
    margin: 10px 0;
}

.gender-label {
    margin-left: 5px;
    font-weight: normal;
}

/* Submit Button */
.submit-button {
    width: 100%;
    padding: 12px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s ease;
    margin-top: 15px;
}

.submit-button:hover {
    background-color: #2980b9;
}
nav {
            margin-top: 20px;
            text-align: center;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: bold;
            background-color: #3498db;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        nav ul li a:hover {
            background-color: #f39c12;
            transform: scale(1.1);
        }
        
        
    </style>
</head>

<body style="background-image: url('images/resident_background.jpeg');" >
    <header>
        <h1>Resident Management</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
            </ul>
        </nav>
    </header>

    <button class="open-modal-btn" onclick="openModal()">Add Resident</button>

    <!-- Modal for Add Resident Form -->
    <div id="residentModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
		<h2 style="color: #000000;">Add Resident</h2>

        <form method="POST" action="resident.jsp" class="resident-form">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />

            <label for="age">Age:</label>
            <input type="text" id="age" name="age" required />

            <label>Gender:</label>
            <div class="gender-options">
                <input type="radio" id="male" name="gender" value="Male" required />
                <label for="male" class="gender-label">Male</label>
                <input type="radio" id="female" name="gender" value="Female" required />
                <label for="female" class="gender-label">Female</label>
            </div>

            <label for="contact">Contact:</label>
            <input type="text" id="contact" name="contact" required />
            
            <label for="room_id">Room ID:</label>
    		<input type="text" id="room_id" name="room_id" required><br><br>

            <input type="submit" value="Add Resident" class="submit-button" />
        </form>
    </div>
</div>
    
    </div>

    <h2>Resident List</h2>
    <table>
        <thead>
            <tr>
                <th>Resident ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Contact</th>
                <th>Room ID</th> 
                <th>Date Time</th>
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
                        String room_id = request.getParameter("room_id");
                        String admission_date = request.getParameter("admission_date");

                        // SQL query to insert new resident into the database
                        String insertSql = "INSERT INTO residents (name, age, gender, contact, room_id, status) VALUES (?, ?, ?, ?, ?, ?)";
                        try (PreparedStatement pstmt = connection.prepareStatement(insertSql)) {
                            pstmt.setString(1, name);
                            pstmt.setString(2, age);
                            pstmt.setString(3, gender);
                            pstmt.setString(4, contact);
                            pstmt.setString(5, room_id);
                            pstmt.setString(6, admission_date);
                            
                            // Execute the insert query
                            rowsAffected = pstmt.executeUpdate();
                            
                            // Provide feedback to the user
                            if (rowsAffected > 0) {
                                out.print("<p>Resident added successfully!</p>");
                                response.sendRedirect("resident.jsp");
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
                            String room_id = resultSet.getString("room_id");
                            String admission_date = resultSet.getString("admission_date");
            %>
                            <tr>
                                <td><%= residentId %></td>
                                <td><%= name %></td>
                                <td><%= age %></td>
                                <td><%= gender %></td>
                                <td><%= contact %></td>
                                <td><%= room_id %></td> <!-- New Data -->
                                <td><%= admission_date %></td> <!-- New Data -->
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

    <script>
        // Functions to open and close the modal
        function openModal() {
            document.getElementById("residentModal").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("residentModal").style.display = "none";
        }

        // Close modal if user clicks outside the modal content
        window.onclick = function(event) {
            const modal = document.getElementById("residentModal");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>

</html>