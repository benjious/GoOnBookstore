<%@ page import="been.ShoppingCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="been.ShoppingCartItem" %>
<%@ page import="been.Book" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.sun.org.apache.xml.internal.resolver.Catalog" %><%--
  Created by IntelliJ IDEA.
  User: Benjious
  Date: 2017/12/22
  Time: 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp" %>
<jsp:useBean id="cart" scope="session" class="been.ShoppingCart"/>
<html>
<head>
    <title>书的细节信息</title>
</head>

<body>
<%
    String bookid = request.getParameter("Delete");
    if (bookid != null) {
        Book book = (Book) (cart.getShoppingCartItem(bookid).getItem());
        String title = book.getTitle();
        cart.remove(bookid);
%>
<h2><span style="color: red; ">你已经删除了一本书: <%=title%></span>
        <%
    }
        %>


    <h2>你的购物车里有<%=cart.getNumberOfItems()%>本书</h2>
    <table>
        <tr>
            <th>数量
            <th>书名
            <th>价格
        </tr>
        <tr>
                <%
            Iterator iterator = cart.getItems().iterator();
           while (iterator.hasNext()){
              ShoppingCartItem item =(ShoppingCartItem) iterator.next();
              Book book =(Book) item.getItem();
    %>
        <tr>
            <td bgcolor="#ffffaa"><%=item.getQuantity()%>
            </td>
            <td bgcolor="#ffffaa"><%=book.getTitle()%>
            </td>
            <td bgcolor="#ffffaa"><%=(book.getPrice()) * item.getQuantity()%>
            </td>
            <td bgcolor="#ffffaa"><a
                    href="<%=request.getContextPath()%>/showcart.jsp?Delete=<%=book.getBookId()%>">删除</a>
            </td>
        </tr>

        <tr>
            <td colspan="5" bgcolor="white">
        </tr>

        <%
            }
        %>
        <tr>
            <td colspan="2" align="right">总金额(元)<%=cart.getTotal()%>
            </td>
        </tr>
        <tr></tr>
        <%
            for (int i = 0; i < 4; i++) {
        %>
        <tr>
            <td colspan="5" bgcolor="white">
        </tr>

        <%
            }
        %>

        <tr>
            <td>
                <a href=<%=request.getContextPath()%>/catalog.jsp>继续购物</a>
            </td>

            <td>
                <a href=<%=request.getContextPath()%>/catalog.jsp>清空购物车</a>
            </td>


        </tr>

    </table>


</body>


</html>

