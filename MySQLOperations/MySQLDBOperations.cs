using MySql.Data.MySqlClient;

namespace MySQLOperations;

public class MySQLDBOperations{
public static string connStr= "server=localhost; user=root; password=toxic ; SslMode=none; database=classicmodels";


public static bool CreateTable(){
     
      
        bool status=false;
        
        MySqlConnection con=new MySqlConnection();
        con.ConnectionString=connStr;
        try{

            /*  Create Command */
            // con.Open();
            // string q="DROP TABLE IF EXISTS Items";
            // MySqlCommand command=new MySqlCommand(q,con);
            // command.ExecuteNonQuery();
            string query="CREATE TABLE Items (Itemid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,ItemName VARCHAR(25),price double );";
            Console.WriteLine(query);
            MySqlCommand cmd=new MySqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();  
            status=true;
        }
        catch(Exception e){
            Console.WriteLine(e.Message);

        }
        finally{
            con.Close();
        }
                return status;
    }
     public static bool Insert(string IName, double pr){

      bool status=false;
        
        MySqlConnection con=new MySqlConnection();
        con.ConnectionString=connStr;
        try{
            /* Insert Command */
           string query="INSERT INTO Items (ItemName,price) values('"+IName+"'," +pr+" )";

            Console.WriteLine(query);

            MySqlCommand cmd=new MySqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();  
            status=true;
        }
        catch(Exception ee){
            Console.WriteLine(ee.Message);
        }
        finally{
            con.Close();
        }
        return status;
    }
     public static bool Update(string IName,  double pr ){
        //updating price of item using its name

      bool status=false;
        
        MySqlConnection con=new MySqlConnection();
        con.ConnectionString=connStr;
        try{
            /* Update Command */
           string query="UPDATE Items SET price="+pr+ " WHERE ItemName='"+IName+"'";
             Console.WriteLine(query);
            MySqlCommand cmd=new MySqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();  
            status=true;
        }
        catch(Exception e){
            Console.WriteLine(e.Message);
        }
        finally{
            con.Close();
        }
        return status;
    }

      public static bool Delete(int id){

      bool status=false;
        
        MySqlConnection con=new MySqlConnection();
        con.ConnectionString=connStr;
        try{
            /* Delete Command */
            string query="DELETE from Items  WHERE Itemid="+id;
            Console.WriteLine(query);
            MySqlCommand cmd=new MySqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();  
            status=true;
        }
        catch(Exception e){
            Console.WriteLine(e.Message);
        }
        finally{
            con.Close();
        }
        return status;
    }
    public static void ShowAllItems(){
        MySqlConnection con=new MySqlConnection();
        try{
            con.ConnectionString=connStr;
            con.Open();
            string query = "SELECT * FROM Items";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                {
                    Console.WriteLine(reader[0]+" -- "+reader[1]+" -- "+reader[2]); //It will show table in default order

                  //  Console.WriteLine(reader["ItemName"]+" -- " + reader["Itemid"]+" -- "+reader["price"]);
                    //we can specify the order of columns in table 
                }
                reader.Close();
            }

        catch(Exception e){
            Console.WriteLine("Exception :  "+e.Message);
        }

        finally{
            con.Close();
        }

}
}

