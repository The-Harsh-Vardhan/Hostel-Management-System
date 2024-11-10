<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resident Management</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Resident Management</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="room.jsp">Room Management</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <form action="AddResidentServlet" method="post" class="resident-form">
                <h2>Add Resident</h2>
    
                <label for="residentId">Resident ID:</label>
                <input type="number" name="residentId" id="residentId" required min="1" title="Please enter a valid Resident ID"><br>
    
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" required placeholder="Enter resident's name"><br>
    
                <label for="age">Age:</label>
                <input type="number" name="age" id="age" required min="18" title="Age must be at least 18"><br>
    
                <label for="gender">Gender:</label>
                <select name="gender" id="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select><br>
    
                <label for="contact">Contact:</label>
                <input type="text" name="contact" id="contact" required placeholder="Enter contact number"><br>
    
                <button type="submit">Add Resident</button>
            </form>
        </section>
    
        <section>
            <h2>Current Residents</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Contact</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Here we retrieve resident list using JSP and servlet -->
                    <%
                        ResidentDAO residentDAO = new ResidentDAO();
                        List<Resident> residents = residentDAO.getAllResidents();
                        for (Resident resident : residents) {
                    %>
                    <tr>
                        <td><%= resident.getId() %></td>
                        <td><%= resident.getName() %></td>
                        <td><%= resident.getAge() %></td>
                        <td><%= resident.getGender() %></td>
                        <td><%= resident.getContact() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>&copy; 2023 Hostel Management System. All rights reserved.</p>
    </footer>
</body>
</html>
