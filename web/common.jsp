<%@ page import="sun.security.pkcs11.wrapper.CK_ATTRIBUTE" %>
<%@ page import="com.sun.org.apache.regexp.internal.RE" %><%--
  Created by IntelliJ IDEA.
  User: Benjious
  Date: 2017/12/24
  Time: 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<%@ include file="banner.jsp"%>

<jsp:useBean id="DBHelper" scope="application" class="database.DBHelper"/>

<%!
    public String convert(String s){
        try {
            return new String(s.getBytes("ISO-8859-1"), "GB2312");
        } catch (Exception e) {
            return  null;
        }
    }
%>