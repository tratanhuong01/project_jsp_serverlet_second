package model;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    private String c = "jdbc:sqlserver://localhost:";
    private String host = "1433";
    private String tenDB = "DiDongShop";
    private String user = "sa";
    private String pass = "sa";

    public Connection openConnection() {
        Connection conn = null;
        try {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver).newInstance();
            String url = c + host;
            conn = DriverManager.getConnection(url, user, pass);
            String query = "USE DiDongShop";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return conn;
    }

    public int countAccount() {
        int count = 0;
        try (Connection conn = openConnection()) {
            String query = "SELECT COUNT(*) FROM Users";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean Register(String firstName, String lastName, String email, String pass, String numPhone, String address) {
        try (Connection conn = openConnection()) {
            String idUser = "DDSUS" + countAccount();
            String query = "INSERT INTO Users(IDUser,FirstName,LastName,Email,Passwords,NumberPhone,AddressUser)VALUES "
                    + " (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idUser);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setString(5, pass);
            ps.setString(6, numPhone);
            ps.setString(7, address);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean Login(String email, String pass) {
        try (Connection conn = openConnection()) {
            String query = "SELECT Email , Passwords FROM Users WHERE Email = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (email.equals(rs.getString(1)) && pass.equals(rs.getString(2))) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try (Connection conn = openConnection()) {
            String query = "SELECT * FROM Users WHERE Email = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        try (Connection conn = openConnection()) {
            String query = "SELECT * FROM Product INNER JOIN GroupProduct ON "
                    + " Product.IDGProduct = GroupProduct.IDGProduct";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getFloat(6),
                        rs.getString(7), rs.getInt(8), rs.getString(10), rs.getString(11), rs.getString(12));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByID(String id) {
        Product product = null;
        try (Connection conn = openConnection()) {
            String query = "SELECT * FROM Product INNER JOIN GroupProduct ON "
                    + " Product.IDGProduct = GroupProduct.IDGProduct WHERE Product.IDProduct = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getFloat(6),
                        rs.getString(7), rs.getInt(8), rs.getString(10), rs.getString(11), rs.getString(12));
            }
            return product;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Color> getColorProduct(String idGProduct) {
        List<Color> list = new ArrayList<>();
        try (Connection conn = openConnection()) {
            String query = "SELECT DISTINCT ColorProduct.IDColor,ColorProduct.NameColor,"
                    + " ColorProduct.CodeColor FROM Product INNER JOIN ColorProduct "
                    + "ON Product.IDColor = ColorProduct.IDColor "
                    + "WHERE Product.IDGProduct = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idGProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Color color = new Color(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(color);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList getMemoryProduct(String idGProduct) {
        ArrayList list = new ArrayList();
        try (Connection conn = openConnection()) {
            String query = "SELECT DISTINCT Memory FROM Product INNER JOIN GroupProduct "
                    + "ON Product.IDGProduct = GroupProduct.IDGProduct "
                    + "WHERE Product.IDGProduct = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idGProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getColorByIDColor(String id) {
        String string = null;
        try (Connection conn = openConnection()) {
            String query = "SELECT NameColor FROM ColorProduct WHERE IDColor = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                string = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return string;
    }

    public String getIDGProduct(String idproduct) {
        String string = "SPDDS0";
        try (Connection conn = openConnection()) {
            String query = "SELECT IDGProduct FROM Product WHERE IDProduct = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idproduct);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                string = rs.getString(1);
            }
            return string;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return string;
    }

    public Product getProductByBoNho(String id, String boNho, String color) {
        Product product = null;
        try (Connection conn = openConnection()) {
            String query = "SELECT * FROM Product INNER JOIN GroupProduct ON "
                    + " Product.IDGProduct = GroupProduct.IDGProduct WHERE Product.IDGProduct = ? "
                    + " AND Product.Memory = ? AND Product.IDColor = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, boNho);
            ps.setString(3, color);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getFloat(6),
                        rs.getString(7), rs.getInt(8), rs.getString(10), rs.getString(11), rs.getString(12));
            }
            return product;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public Product getProductByBoNho1(String id, String boNho, String color) {
        Product product = null;
        try (Connection conn = openConnection()) {
            String query = "SELECT * FROM Product INNER JOIN GroupProduct ON "
                    + " Product.IDGProduct = GroupProduct.IDGProduct WHERE Product.IDProduct = ? "
                    + " AND Product.Memory = ? AND Product.IDColor = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, boNho);
            ps.setString(3, color);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getFloat(6),
                        rs.getString(7), rs.getInt(8), rs.getString(10), rs.getString(11), rs.getString(12));
            }
            return product;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public boolean addCart(Cart cart) {
        try (Connection conn = openConnection()) {
            String query = "INSERT INTO Cart(IDProduct,IDUsers,Amount)VALUES "
                    + " (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cart.getIdProductBought());
            ps.setString(2, cart.getIdUSers());
            ps.setInt(3, cart.getAmount());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public int countDISTINCT(String idProduct,String idUser) {
        int dem = 0;
        try (Connection conn = openConnection()) {
            String query = "SELECT COUNT(*) FROM Cart WHERE IDProduct = ? AND IDUsers = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,idProduct);
            ps.setString(2,idUser);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dem = rs.getInt(1);
            }
            return dem;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return dem;
    }
    public ArrayList getIDProductCard(String IDuser) {
        ArrayList list = new ArrayList();
        try (Connection conn = openConnection()) {
            String query = "SELECT DISTINCT Product.IDProduct "
                    + "FROM Cart "
                    + "INNER JOIN Product ON Cart.IDProduct = Product.IDProduct "
                    + "INNER JOIN Users ON Users.IDUser = Cart.IDUsers "
                    + "WHERE Cart.IDUsers = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, IDuser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> getProductCart(String idUser) {
        List<Product> list = new ArrayList<>();
        ArrayList lista = getIDProductCard(idUser);
        for (int i = 0; i < lista.size(); i++) {
            try (Connection conn = openConnection()) {
                String query = "SELECT * FROM Product INNER JOIN GroupProduct ON "
                        + " Product.IDGProduct = GroupProduct.IDGProduct WHERE Product.IDProduct = ? ";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, lista.get(i).toString());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product(
                            rs.getString(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getInt(5), rs.getFloat(6),
                            rs.getString(7), rs.getInt(8), rs.getString(10), rs.getString(11), rs.getString(12));
                    list.add(product);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    public int CountProductCart(String idUSer) {
        int dem =  0;
        try (Connection conn = openConnection()){
            String query = "SELECT DISTINCT IDProduct FROM Cart WHERE IDUsers = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,idUSer);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dem++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dem;
    }
    public String getNameColorByIdColor(String idColor) {
        String string  = "";
        try (Connection conn = openConnection()){
            String query = "SELECT NameColor FROM ColorProduct WHERE IDColor = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,idColor);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                string = (rs.getString(1));
            }
            return string;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return string;
    }
    public int countNumProduct() {
        int dem = 0;
        try (Connection conn = openConnection()) {
            String query = "SELECT COUNT(*) FROM Product";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dem = rs.getInt(1);
            }
            return dem;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dem;
    }
    
    public List<Product> loadProductByPage(int a,int b) {
        List<Product> list = new ArrayList<>();
        try (Connection conn = openConnection()){
            String query = "SELECT * FROM Product INNER JOIN GroupProduct ON "
                    + " Product.IDGProduct = GroupProduct.IDGProduct"
                    + " ORDER BY IDProduct OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, a);
            ps.setInt(2, b);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getFloat(6),
                        rs.getString(7), rs.getInt(8), rs.getString(10), rs.getString(11), rs.getString(12));
                list.add(product);
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String args[]) {
        DAO dao = new DAO();
        List<Product> list = dao.loadProductByPage(8, 8);
        System.out.println(list.size());
    }
}
