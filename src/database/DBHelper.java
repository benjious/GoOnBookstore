package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import been.Book;
import been.ShoppingCart;
import been.ShoppingCartItem;

public class DBHelper {
    public static final String SQL_DRIVER = "com.mysql.jdbc.Driver";
    public static final String DATABASE_URL = "jdbc:mysql://127.0.0.1:3306/bookdb";
    public static final String USER = "root";
    public static final String PASSWORD = "12345678";

    private Statement stmt;
    private ResultSet mResultSet;
    private Connection connection;


    public DBHelper() {
        try {
            //加载驱动
            Class.forName(SQL_DRIVER);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public ArrayList getAllBooks() {
        PreparedStatement preparedStatement = null;
        ArrayList books = new ArrayList();
        connection =getConnection();
        try {
            String sql = "SELECT * FROM books";
            preparedStatement = connection.prepareStatement(sql);
            mResultSet = preparedStatement.executeQuery();
            while (mResultSet.next()) {
                been.Book book = new been.Book();
                book.setBookId(mResultSet.getString("id"));
                book.setName(mResultSet.getString("name"));
                book.setTitle(mResultSet.getString("title"));
                book.setPrice(mResultSet.getFloat("price"));
                book.setYear(mResultSet.getInt("yr"));
                book.setBookId(mResultSet.getString("id"));
                book.setDescription(mResultSet.getString("description"));
                book.setSaleAmount(mResultSet.getInt("sale_amount"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            closeConnection(connection);
            closeResultSet(mResultSet);
            closeStatement(preparedStatement);
        }
        return books;
    }

    private Connection getConnection() {
        //创建连接
        try {
            connection = DriverManager.getConnection(DATABASE_URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }


    private Statement getStatement() {
        //获取statement
        try {
            stmt = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public Book getBookById(String id) throws Exception {
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM books WHERE ID=?";
        Book book = new Book();
        connection = getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            mResultSet = preparedStatement.executeQuery();
            if (mResultSet.next()) {
                book.setBookId(mResultSet.getString("id"));
                book.setName(mResultSet.getString("name"));
                book.setTitle(mResultSet.getString("title"));
                book.setPrice(mResultSet.getFloat("price"));
                book.setYear(mResultSet.getInt("yr"));
                book.setBookId(mResultSet.getString("id"));
                book.setDescription(mResultSet.getString("description"));
                book.setSaleAmount(mResultSet.getInt("sale_amount"));
                preparedStatement.close();
                return book;
            } else {
                return null;
            }
        } finally {
            closeResultSet(mResultSet);
            closeStatement(preparedStatement);
            closeConnection(connection);
        }

    }

    private void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    private void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }

    private void closeResultSet(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }



    public void buyBooks(ShoppingCart cart)throws Exception {
        Connection con=null;
        Collection items = cart.getItems();
        Iterator i = items.iterator();
        try {
            con=getConnection();
            con.setAutoCommit(false);
            while (i.hasNext()) {
                ShoppingCartItem sci = (ShoppingCartItem)i.next();
                Book bd = (Book)sci.getItem();
                String id = bd.getBookId();
                int quantity = sci.getQuantity();
                buyBook(id, quantity,con);
            }
            con.commit();
            con.setAutoCommit(true);

        } catch (Exception ex) {
            con.rollback();
            throw ex;
        }finally{
            closeConnection(con);
        }
    }


    public void buyBook(String bookId, int quantity,Connection con) throws Exception {
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        try{
            String selectStatement = "select * " + "from BOOKS where ID = ? ";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, bookId);
            rs = prepStmt.executeQuery();

            if (rs.next()) {
                prepStmt.close();
                String updateStatement =
                        "update BOOKS set SALE_AMOUNT = SALE_AMOUNT + ? where ID = ?";
                prepStmt = con.prepareStatement(updateStatement);
                prepStmt.setInt(1, quantity);
                prepStmt.setString(2, bookId);
                prepStmt.executeUpdate();
                prepStmt.close();
            }

        }finally{
            closeResultSet(rs);
            closeStatement(prepStmt);
        }
    }

}
