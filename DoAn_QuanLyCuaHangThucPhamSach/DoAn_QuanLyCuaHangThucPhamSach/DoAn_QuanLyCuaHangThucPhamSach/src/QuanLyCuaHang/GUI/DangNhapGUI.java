package QuanLyCuaHang.GUI;

import Main.Main;
import CuaHang.ImagePanel;
import CuaHang.MyDialog;
import QuanLyCuaHang.BUS.DangNhapBUS;
import QuanLyCuaHang.DTO.TaiKhoan;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class DangNhapGUI extends JFrame {

    public DangNhapGUI() {
        this.setTitle("Đăng nhập");
        this.setSize(800, 600);
        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.setUndecorated(true);
        this.setBackground(new Color(0, 0, 0, 0));
        addControls();
        xuLyTaiKhoanDaGhiNho();
        addEvents();
    }

    private void xuLyTaiKhoanDaGhiNho() {
        DangNhapBUS dangNhapBUS = new DangNhapBUS();
        String line = dangNhapBUS.getTaiKhoanGhiNho();
        try {
            String[] arr = line.split(" | ");
            ckbRemember.setSelected(true);
            txtUser.setText(arr[0]);
            txtPassword.setText(arr[2]);
            txtUser.requestFocus();
        } catch (Exception e) {
            txtUser.setText("");
            txtPassword.setText("");
            txtUser.requestFocus();
        }
    }

    private JLabel btnExit, btnLogin, btnForgot;
    private JTextField txtUser;
    private JPasswordField txtPassword;
    private JPanel pnMain;
    private JCheckBox ckbRemember;

    private void addControls() {
        Container con = getContentPane();

        pnMain = new ImagePanel("src/Resource/LoginUI/background_login.png");
        pnMain.setLayout(null);
        pnMain.setBounds(0,0,400,400);
        
        btnExit = new JLabel(new ImageIcon("src/Resource/LoginUI/btn-close.png"));
        btnExit.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnExit.setBounds(350,15, 40, 40);
        
        btnLogin = new JLabel(new ImageIcon("src/Resource/LoginUI/btn-login.png"));
        btnLogin.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnLogin.setBounds(0, 280, 392, 55);

        btnForgot = new JLabel(new ImageIcon("src/Resource/LoginUI/forgot_pass.png"));
        btnForgot.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnForgot.setBounds(115,330, 155, 40);

        
        Font fontTXT = new Font("", Font.BOLD, 12);
        txtUser = new JTextField();
        txtUser.setBackground(new Color(0, 0, 0, 0f));
        txtUser.setBorder(BorderFactory.createEmptyBorder());
        txtUser.setForeground(Color.BLACK);
        txtUser.setFont(fontTXT);
        txtUser.setHorizontalAlignment(JTextField.LEFT);
        txtUser.setBounds(160,167, 370, 50);

        txtPassword = new JPasswordField();
        txtPassword.setEchoChar('•');
        txtPassword.setBackground(new Color(0, 0, 0, 0f));
        txtPassword.setBorder(BorderFactory.createEmptyBorder());
        txtPassword.setForeground(Color.BLACK);
        txtPassword.setFont(fontTXT);
        txtPassword.setHorizontalAlignment(JTextField.LEFT);
        txtPassword.setBounds(175,210, 370, 50);

        Main.changLNF("Windows");
        ckbRemember = new JCheckBox("Ghi nhớ đăng nhập");
        ckbRemember.setFont(fontTXT);
        ckbRemember.setOpaque(false);
        ckbRemember.setForeground(Color.BLACK);
        ckbRemember.setBounds(128,260, 290, 19);
        ckbRemember.setFocusPainted(false);
        Main.changLNF("Nimbus");

        pnMain.add(btnExit);
        pnMain.add(txtUser);
        pnMain.add(txtPassword);
        pnMain.add(ckbRemember);
        pnMain.add(btnLogin);
        pnMain.add(btnForgot);

        con.add(pnMain);
    }

    private void addEvents() {
        moveFrame();
        btnExit.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                xuLyThoat();
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
            }

            @Override
            public void mouseEntered(MouseEvent e) {
                btnExit.setIcon(new ImageIcon("src/Resource/LoginUI/btn-close--hover.png"));
            }

            @Override
            public void mouseExited(MouseEvent e) {
                btnExit.setIcon(new ImageIcon("src/Resource/LoginUI/btn-close.png"));
            }
        });
        txtUser.addActionListener((ActionEvent e) -> {
            txtPassword.requestFocus();
        });
        txtPassword.addActionListener((ActionEvent e) -> {
            xuLyDangNhap();
        });
        btnForgot.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                xuLyQuenMatKhau();
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
            }

            @Override
            public void mouseEntered(MouseEvent e) {
                btnForgot.setIcon(new ImageIcon("src/Resource/LoginUI/forgot_pass.png"));
            }

            @Override
            public void mouseExited(MouseEvent e) {
                btnForgot.setIcon(new ImageIcon("src/Resource/LoginUI/forgot_pass.png"));
            }
        });
        btnLogin.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                xuLyDangNhap();
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
            }

            @Override
            public void mouseEntered(MouseEvent e) {
               /* btnLogin.setIcon(new ImageIcon("image/LoginUI/btn-login--hover.png"));*/
            }

            @Override
            public void mouseExited(MouseEvent e) {
                btnLogin.setIcon(new ImageIcon("src/Resource/LoginUI/btn-login.png"));
            }
        });
    }

    int xMouse, yMouse;

    private void moveFrame() {
        pnMain.addMouseMotionListener(new MouseMotionListener() {
            @Override
            public void mouseDragged(MouseEvent e) {
                int x = e.getXOnScreen();
                int y = e.getYOnScreen();
                Move(x, y);
            }

            @Override
            public void mouseMoved(MouseEvent e) {
                xMouse = e.getX();
                yMouse = e.getY();
            }
        });
    }

    private void Move(int x, int y) {
        this.setLocation(x - xMouse, y - yMouse);
    }

    private void xuLyThoat() {
        System.exit(0);
    }

    private void xuLyQuenMatKhau() {
        new MyDialog("Xin liên hệ Admin để giải quyết!", MyDialog.INFO_DIALOG);
    }

    public void xuLyDangNhap() {
        DangNhapBUS dangNhapBUS = new DangNhapBUS();
        TaiKhoan tk = dangNhapBUS.getTaiKhoanDangNhap(txtUser.getText(),
                txtPassword.getText(), ckbRemember.isSelected());
        if (tk != null) {
            this.dispose();
            MainQuanLyGUI gui = new MainQuanLyGUI();
            this.dispose();
            gui.showWindow();           
        }
    }

    public void showWindow() {
        Image icon = Toolkit.getDefaultToolkit().getImage("src/Resource/ManagerUI/icon-app.png");
        this.setIconImage(icon);
        this.setVisible(true);
    }

}
