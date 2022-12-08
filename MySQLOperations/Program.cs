using MySQLOperations;

MySQLDBOperations.CreateTable();  // creating table

MySQLDBOperations.Insert("earphones",500.0);
MySQLDBOperations.Insert("usb",400.10);
MySQLDBOperations.Insert("mobile",14000.10);
MySQLDBOperations.Insert("powerbank",400.50);
Console.WriteLine();
MySQLDBOperations.ShowAllItems();
Console.WriteLine();
MySQLDBOperations.Update("powerbank",790.50); //updating value using ItemName
Console.WriteLine();
MySQLDBOperations.ShowAllItems();
Console.WriteLine();
MySQLDBOperations.Delete(1);          //deleting using id
Console.WriteLine();
MySQLDBOperations.ShowAllItems();
