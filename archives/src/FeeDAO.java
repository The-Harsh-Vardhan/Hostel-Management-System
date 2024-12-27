// FeeDAO.java
import java.sql.*;

public class FeeDAO {
    public void addFee(int residentId, double amountDue, String dueDate) throws SQLException {
        String query = "INSERT INTO Fees (resident_id, amount_due, due_date) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, residentId);
            stmt.setDouble(2, amountDue);
            stmt.setDate(3, Date.valueOf(dueDate));
            stmt.executeUpdate();
        }
    }

    public void updateFeePayment(int residentId, double amountPaid) throws SQLException {
        String query = "UPDATE Fees SET amount_paid = amount_paid + ?, payment_status = CASE WHEN amount_due <= amount_paid THEN 'paid' ELSE 'pending' END WHERE resident_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setDouble(1, amountPaid);
            stmt.setInt(2, residentId);
            stmt.executeUpdate();
        }
    }
}
