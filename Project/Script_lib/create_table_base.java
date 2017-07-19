import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
 
public class create_table {
    public static void main(String[] args) {
    try{   
       Class.forName("sql_driver");
       Connection conn = DriverManager.getConnection("jdbc:sql_type://hosts:protsNo/db_name","root","password");
                  Statement stmt = conn.createStatement(); 
            stmt.execute( select_sql );
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }
    } 
}
