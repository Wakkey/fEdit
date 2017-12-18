import java.io.*;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.sql.*;

public class sql_tbl {
  public static void main(String[] args){
   try {
       Class.forName("sql_driver");
       Connection conn = DriverManager.getConnection("jdbc:sql_type://hostsprotsNodb_name","root","password");
       Statement st = conn.createStatement();
       ResultSet rs =
       st.executeQuery("select_sql");
       ResultSetMetaData MetaData = rs.getMetaData();


       FileOutputStream fo = null;
       BufferedOutputStream bo = null;
       DataOutputStream dos = null;

       	String file_name = "list2.txt";
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

