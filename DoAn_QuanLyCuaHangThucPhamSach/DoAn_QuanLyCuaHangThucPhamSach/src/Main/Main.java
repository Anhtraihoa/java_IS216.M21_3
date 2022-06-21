/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

import QuanLyCuaHang.DAO.MyConnect;
import QuanLyCuaHang.GUI.DangNhapGUI;
import QuanLyCuaHang.GUI.PnQuanLyNhapHangGUI;
import java.sql.SQLException;
import QuanLyCuaHang.GUI.DangNhapGUI;
import QuanLyCuaHang.GUI.MainQuanLyGUI;
public class Main {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        new MyConnect();
        changLNF("Nimbus");
        DangNhapGUI login = new DangNhapGUI();
        login.showWindow();
        System.out.println("Get connection ... ");
        
        
       
    }
// looknfeel_GUI
    public static void changLNF(String nameLNF) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if (nameLNF.equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
        }
    }
    
}
