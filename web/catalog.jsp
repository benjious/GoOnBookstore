<%@ page import="database.DBHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="been.Book" %><%--
  Created by IntelliJ IDEA.
  User: Benjious
  Date: 2017/12/22
Time: 4:39
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp" %>

<jsp:useBean id="cart" scope="session" class="been.ShoppingCart"/>

<html>
<head>
    <title>书目</title>
</head>
<body>

<%
    String bookId = request.getParameter("Add");
    if (bookId != null) {
        Book book = DBHelper.getBookById(bookId);
        cart.add(bookId, book);

%>
<p>
<h3><span style="color: red; ">
    你已经将<%=book.getTitle()%>加入到购物车中
</span>
</h3>
</p>
<%
    }
    if (cart.getNumberOfItems() != 0) {
%>
<p><a href="<%=request.getContextPath()%>/showcart.jsp">查看购物车</a>
    <a href="<%=request.getContextPath()%>/cashier.jsp">付款</a></strong>
</p>

<%
    }
%>
<h3>请选择你想要的书:</h3>
<table>
    <%
        ArrayList books = new ArrayList();
        DBHelper helper = new DBHelper();
        books = helper.getAllBooks();
        for (int i = 0; i < books.size(); i++) {
            Book book = (Book) books.get(i);

    %>

    <tr>
        <td bgcolor="#ffffaa"><a
                href="<%=request.getContextPath()%>/bookdetails.jsp"><strong><%=book.getTitle()%>&nbsp;</strong></a>
        </td>
        <td bgcolor="#ffffaa" rowspan="2"></td>
        <td bgcolor="#ffffaa" rowspan="2"><a
                href="<%=request.getContextPath()%>/catalog.jsp?Add=<%=book.getBookId()%>">&nbsp;加入购物车&nbsp;</a>
        </td>
    </tr>
    <tr>
        <td>作者: <%=book.getName()%></td>
    </tr>
    <%}%>
</table>

</body>
</html>
