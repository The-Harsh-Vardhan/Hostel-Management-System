// Main.java
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        ResidentDAO residentDAO = new ResidentDAO();
        RoomDAO roomDAO = new RoomDAO();
        FeeDAO feeDAO = new FeeDAO();

        try {
            // Add a resident
            residentDAO.addResident("John Doe", 21, "Male", "1234567890", 1);

            // Assign a room to the resident
            roomDAO.assignRoom(1, 1); // resident_id = 1, room_id = 1

            // Add a fee record
            feeDAO.addFee(1, 1000.00, "2024-11-30"); // resident_id = 1

            // Update fee payment
            feeDAO.updateFeePayment(1, 500.00); // partial payment
            
            // Output to confirm operations
            System.out.println("Operations completed successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
