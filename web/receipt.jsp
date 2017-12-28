
<%@ include file="common.jsp" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="cart" scope="session" class="been.ShoppingCart"/>

<%
    DBHelper.buyBooks(cart);
    // Payment received -- invalidate the session
    session.invalidate();
%>
<html>
<head><title>TitleReceipt</title>
    <%@ include file="banner.jsp" %>
</head>

<body>
<h3><%=request.
    getParameter
    (
    "cardname"
    )%>：谢谢您光临新世纪网上书店。</h3><br>
<strong><a href="<%=request.getContextPath()%>/bookstore.jsp">继续购物</a>&nbsp;&nbsp;&nbsp;</strong>
</body>
</html>
