import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResidentDAO {
    private Connection connection;

    public ResidentDAO() throws SQLException {
        // Initialize your database connection here
        // Example: connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel_management", "root", "");
    }

    public void addResident(String name, int age, String gender, String contact, int roomId) throws SQLException {
        // SQL to insert a resident
        String sql = "INSERT INTO residents (name, age, gender, contact, room_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setInt(2, age);
            stmt.setString(3, gender);
            stmt.setString(4, contact);
            stmt.setInt(5, roomId);
            stmt.executeUpdate();
        }
        // Mark the room as occupied
        markRoomAsOccupied(roomId);
    }

    public int assignRoom() throws SQLException {
        // SQL to find an available room
        String sql = "SELECT room_id FROM rooms WHERE is_available = 1 LIMIT 1";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("room_id");
            } else {
                throw new SQLException("No available rooms.");
            }
        }
    }

    private void markRoomAsOccupied(int roomId) throws SQLException {
        // SQL to update room status
        String sql = "UPDATE rooms SET is_available = 0 WHERE room_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, roomId);
            stmt.executeUpdate();
        }
    }
}