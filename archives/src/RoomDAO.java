// RoomDAO.java
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    public List<String> getAvailableRooms() throws SQLException {
    	
    	// 1) Create a connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel_management", "root", "");
    	
        List<String> rooms = new ArrayList<>();
        String query = "SELECT room_id FROM Rooms WHERE room_status = 'available'";
        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                rooms.add("Room " + rs.getInt("room_id"));
            }
        }
        return rooms;
    }

    public void assignRoom(int residentId, int roomId) throws SQLException {
        String updateResident = "UPDATE Residents SET room_id = ? WHERE resident_id = ?";
        String updateRoom = "UPDATE Rooms SET current_occupants = current_occupants + 1 WHERE room_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt1 = conn.prepareStatement(updateResident);
                PreparedStatement stmt2 = conn.prepareStatement(updateRoom)) {
            stmt1.setInt(1, roomId);
            stmt1.setInt(2, residentId);
            stmt1.executeUpdate();

            stmt2.setInt(1, roomId);
            stmt2.executeUpdate();
        }
    }
}