import java.io.*;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.sql.*;

public class sql_set {
  public static void main(String[] args){
   try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql:localhost:3306/","root","m0jpw10p");
       Statement st = conn.createStatement();
       ResultSet rs =
       st.executeQuery("show databases");
       ResultSetMetaData MetaData = rs.getMetaData();


       FileOutputStream fo = null;
       BufferedOutputStream bo = null;
       DataOutputStream dos = null;

       	String file_name = "list.txt";
        try{
          File file = new File(file_name);
          FileWriter filewriter = new FileWriter(file);


          while(rs.next()) {
           for (int i = 1 ; i <= MetaData.getColumnCount(); i++){

               String getdata = rs.getString(i);
               String source = getdata;
               filewriter.write( source );
               filewriter.write( "\r\n" );
           }
         }

          filewriter.close();
         }catch(IOException e){
           System.out.println(e);
         }

           rs.close();
           st.close();
           conn.close();
           System.exit(0);
   } catch (ClassNotFoundException e) {
       System.out.println("ドライバを読み込めませんでした "+ e);
   } catch (SQLException e) {
       System.out.println("データベース接続エラー"+ e);
   }
  }
}

