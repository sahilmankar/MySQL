using MySql.Data.MySqlClient;
string connStr="server=localhost; user=root; password=**** ; SslMode=none; database=classicmodels";
MySqlConnection conn=new MySqlConnection();
try{
    conn.ConnectionString=connStr;
    conn.Open();
   string query="SELECT CONCAT( lastName,' ', firstname) FROM employees;";

    MySqlCommand command=new MySqlCommand(query,conn);
    MySqlDataReader reader=command.ExecuteReader();


    while(reader.Read()){
        Console.WriteLine(reader[0]);
    }
    reader.Close();
}
catch(Exception e){
    Console.WriteLine(e.Message);
}
finally{
    conn.Close();
 

}






