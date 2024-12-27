<%@ page import="java.sql.*" %>
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
                    <input type="number" name="residentId" id="residentId" required min="1"
                        title="Please enter a valid Resident ID"><br>

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
                    <input type="text" name="contact" id="contact" required placeholder="Enter contact number"
                        pattern="\d{10}" title="Please enter a valid 10-digit contact number"><br>

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
                        <% // Database connection details 
                        	String url="jdbc:mysql://localhost:3306/hostel_management" ;
                            String user="root" ; // replace with your DB username 
                            String password="" ; // replace withyour DB password 
                            Connection connection=null; 
                            Statement statement=null; 
                            ResultSet resultSet=null; try { // Establish connection 
                            	Class.forName("com.mysql.cj.jdbc.Driver");
                            	connection=DriverManager.getConnection(url, user, password); // Query to get all residents
                            	String query="SELECT * FROM residents" ; 
                            	statement=connection.createStatement();
                            	resultSet=statement.executeQuery(query); // Display residents 
                            	while (resultSet.next()) 
                            	{ 	int residentId=resultSet.getInt("resident_id"); 
                            		String name=resultSet.getString("name"); 
                            		int age=resultSet.getInt("age"); 
                            		String gender=resultSet.getString("gender"); 
                            		String contact=resultSet.getString("contact"); 
                    	%>
                            <tr>
                                <td>
                                    <%= residentId %>
                                </td>
                                <td>
                                    <%= name %>
                                </td>
                                <td>
                                    <%= age %>
                                </td>
                                <td>
                                    <%= gender %>
                                </td>
                                <td>
                                    <%= contact %>
                                </td>
                            </tr>
                            
                            <% 
                            	catch (SQLException e) { e.printStackTrace(); } 
                            	catch (ClassNotFoundException e) 
                            	{
                                	e.printStackTrace();
                                	finally { // Close resources 
                                			try { 
                                				if (resultSet !=null)
                                					resultSet.close(); if (statement !=null) statement.close(); 
                                					if (connection !=null)
                               						lconnection.close(); 
                               					} 
                                			catch (SQLException e) { e.printStackTrace(); 
                                	} 
                               	}
                            %>
                    </tbody>
                </table>
            </section>
        </main>
    </body>

    </html>