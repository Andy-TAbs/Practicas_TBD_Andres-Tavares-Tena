
package connectorj;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.time.LocalDate;
import java.time.Month;

public class ConnectorJ {

    public static void main(String[] args) {
        Connection connection;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url = "jdbc:mysql://localhost:3306/eva_3?serverTimezone=UTC";
            connection = DriverManager.getConnection(url, "root", "Jefemaestro117");
            /*
            Statement statement = connection.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT * FROM actor LIMIT 50;");
            */
            
            // ?son comodines, se enumeran en la secuencia que aparecen en el query. A través de statement.setType(pociccion, valor);
            //se cambia el comodin en la posicion indicada por el valor
            String query = "select * from actor where actor_id = ?;";
            PreparedStatement pStatement = connection.prepareStatement(query);
           pStatement.setInt(1, 152);
            ResultSet resultSet = pStatement.executeQuery();
            
            int actor_id;
            String f_name;
            String l_name;
            while (resultSet.next()) {
                actor_id = resultSet.getInt("actor_id");
                f_name = resultSet.getString("first_name");
                l_name = resultSet.getString("last_name");
                
                //Ejecutar un Insert
                String qInsert = "INSERT INTO actor (first_name, last_name)" + 
                        "values(?,?);";
                PreparedStatement pSInsert = connection.prepareStatement(qInsert);
                pSInsert.setString(1, "Mario");
                pSInsert.setString(2, "Moreno");
                pSInsert.execute();
                
                //LLMAR A FUNCION/PROCEDIMIENTO
                CallableStatement callStat = 
                        connection.prepareCall("{? = call generar_rfc(?,?,?,?)");
                //Parametro de salida
                callStat.registerOutParameter(1, Types.VARCHAR);
                
                //Parametro de entrada
                callStat.setString(2, "Juan");
                callStat.setString(3, "perez");
                callStat.setString(4, "Jolote");
                callStat.setObject(5, LocalDate.of(2004, 11, 20));
                callStat.execute();
                System.out.println("PFC: " + callStat.getString(1));
                
                System.out.println("Id: " + actor_id + "\n" + 
                    "First Name: " + f_name + "\n" + 
                    "Last Name: " + l_name + "\n");
                
                resultSet.close();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectorJ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectorJ.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("Error Code: " + ex.getErrorCode());
        }
    }
}

