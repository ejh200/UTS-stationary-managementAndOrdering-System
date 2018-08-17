import java.sql.*;

/**
 * JDBC connection test to Our SEP project DB server.  
 * 
 * @Junghyun EOM
 * @version test
 */
public class DBConnectionTest
{
    private String driver = "org.mariadb.jdbc.Driver";
    private String url = "jdbc:mariadb://sep-group1.chfmthqa5fv5.ap-southeast-2.rds.amazonaws.com:3306/SEP_group1";
    private String userId = "sepDB";
    private String userPW = "user1234";
    
    //From Library Java.sql.Connection 
    Connection connection = null;
    
    
    
    
    
     
    
    // This attirbute is for Seding sql to DB server by using Object createad by attribute preparedState
    
    
    public DBConnectionTest()
    {
        try
        {
            Class.forName(driver); // This is the process for loading DB driver
            this.connection = DriverManager.getConnection(url, userId, userPW);
            
            // DB Server connection status if==null: disconnected, !=connected 
            if (connection != null) { System.out.println("DB server connection Success!"); }
        }
        catch (ClassNotFoundException e) { System.out.println("DB driver loading Failed");}
        catch (SQLException e) { e.getMessage(); }
    }

    public void testQuery()
    {
        String sql = "SELECT * FROM Test";
        try
        {
            
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            
            //Creates an Object for sending sql to DB server
            preparedStatement =this.connection.prepareStatement(sql);
            // Seding sql to DB server by using Object above
            resultSet = preparedStatement.executeQuery();
            
       
            while(resultSet.next())
            {
                //the parameter valueX in getAccessor(X) Must have same attribute Name on DBServer
                System.out.print("id: " + resultSet.getInt("STUDENT_ID"));
                System.out.print("   name: " + resultSet.getString("NAME"));
                System.out.print("  suburb: " + resultSet.getString("SURBURB"));
                System.out.print("  Email: "+ resultSet.getString("EMAIL"));
                System.out.println("");
            }
        }
        catch (SQLException e) { e.printStackTrace(); }
    }
}
