package QuanLyCuaHang.DAO;

import CuaHang.MyDialog;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import oracle.jdbc.OracleDriver;

// kết nối database oracle
public class MyConnect {

    public static Connection conn = null;
    private String hostName = "localhost";
    private String sid = "orclcdb";
    private String userName = "c##quanlycuahangthucphamsach1";
    private String password = "Vtt050602";

    public MyConnect() {
        docFileText();

        String strConnect = "jdbc:oracle:thin:@" + hostName + ":1521:" + sid;
        Properties pro = new Properties();
        pro.put("user", userName);
        pro.put("password", password);
        try {
            oracle.jdbc.driver.OracleDriver driver = new OracleDriver();
            conn = driver.connect(strConnect, pro);
        } catch (SQLException ex) {
            MyDialog myDialog = new MyDialog("Không kết nối được tới CSDL!", MyDialog.ERROR_DIALOG);
            System.exit(0);
        }

    }
    private void docFileText() {
        // Xử lý đọc file để lấy ra 4 tham số
        hostName = "";
        sid = "";
        userName = "";
        password = "";

        try {
            FileInputStream fis = new FileInputStream("ConnectVariable.txt");
            InputStreamReader isr = new InputStreamReader(fis);
            BufferedReader br = new BufferedReader(isr);

            hostName = br.readLine();
            sid = br.readLine();
            userName = br.readLine();
            password = br.readLine();

            if (password == null) {
                password = "";
            }

        } catch (IOException e) {
        }
    }
}

