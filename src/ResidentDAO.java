import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResidentDAO {
    // JDBC URL, username and password of MySQL server
    private static final String URL = "jdbc:mysql://localhost:3306/hostel_management";
    private static final String USER = "root"; // Change to your MySQL username
    private static final String PASSWORD = ""; // Change to your MySQL password

    // Load the MySQL JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }

    // Method to get a database connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Resident class
    public static class Resident {
        private int id;
        private String name;
        private int age;
        private String gender;
        private String contact;

        // Getters and Setters
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }

        public String getGender() {
            return gender;
        }

        public void setGender(String gender) {
            this.gender = gender;
        }

        public String getContact() {
            return contact;
        }

        public void setContact(String contact) {
            this.contact = contact;
        }
    }

    // Method to add a resident
    public void addResident(String name, int age, String gender, String contact, int roomId) throws SQLException {
        String query = "INSERT INTO Residents (name, age, gender, contact, room_id, admission_date) VALUES (?, ?, ?, ?, ?, CURDATE())";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setInt(2, age);
            stmt.setString(3, gender);
            stmt.setString(4, contact);
            stmt.setInt(5, roomId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error adding resident: " + e.getMessage());
            throw e; // Rethrow the exception for further handling if necessary
        }
    }

    // Method to get all residents
    public List<Resident> getAllResidents() throws SQLException {
        List<Resident> residents = new ArrayList<>();
        String query = "SELECT * FROM Residents"; // Adjusted query
        try (Connection conn = getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Resident resident = new Resident();
                resident.setId(rs.getInt("id")); // Assuming you have an 'id' field
                resident.setName(rs.getString("name"));
                resident.setAge(rs.getInt("age"));
                resident.setGender(rs.getString("gender"));
                resident.setContact(rs.getString("contact"));
                residents.add(resident);
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving residents: " + e.getMessage());
            throw e; // Rethrow the exception for further handling if necessary
        }
        return residents;
    }
}