<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Benjious
  Date: 2017/12/24
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@  page isErrorPage="true"%>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
<p>服务器发生错误:<%= exception.getMessage()%></p>
<p>错误原因为: <% exception.printStackTrace(new PrintWriter(out));%></p>
</body>
</html>
