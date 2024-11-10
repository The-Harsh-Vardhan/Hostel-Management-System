// ResidentDAO.java
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResidentDAO {
    public void addResident(String name, int age, String gender, String contact, int roomId) throws SQLException {
        String query = "INSERT INTO Residents (name, age, gender, contact, room_id, admission_date) VALUES (?, ?, ?, ?, ?, CURDATE())";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setInt(2, age);
            stmt.setString(3, gender);
            stmt.setString(4, contact);
            stmt.setInt(5, roomId);
            stmt.executeUpdate();
        }
    }

    public List<String> getAllResidents() throws SQLException {
        List<String> residents = new ArrayList<>();
        String query = "SELECT * FROM Residents WHERE status = 'active'";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                residents.add(rs.getString("name"));
            }
        }
        return residents;
    }
}
