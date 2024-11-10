<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Management</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Room Management</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="resident.jsp">Resident Management</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <form action="AssignRoomServlet" method="post" class="room-form">
                <h2>Assign Room</h2>
                <label for="residentId">Resident ID:</label>
                <input type="number" name="residentId" id="residentId" required min="1" title="Please enter a valid Resident ID"><br>
        
                <label for="roomId">Room ID:</label>
                <input type="number" name="roomId" id="roomId" required min="1" title="Please enter a valid Room ID"><br>
        
                <button type="submit">Assign Room</button>
            </form>
        </section>

        <section>
            <h2>Available Rooms</h2>
            <table>
                <thead>
                    <tr>
                        <th>Room ID</th>
                        <th>Type</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        RoomDAO roomDAO = new RoomDAO();
                        List<Room> rooms = roomDAO.getAvailableRooms();
                        for (Room room : rooms) {
                    %>
                    <tr>
                        <td><%= room.getRoomId() %></td>
                        <td><%= room.getRoomType() %></td>
                        <td><%= room.getRoomStatus() %></td>
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