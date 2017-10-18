<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %>
<%@ page import="com.sd.common.database.*" %> 
<%@ page import="com.sd.common.*" %> 
<%@ page import="com.sd.bap.ui.*" %> 
<%@ page import="com.sd.bap.admin.model.*" %> 
<%
  StrUtil vUtil=new StrUtil();

  String userid = vUtil.trimmed(request.getParameter("user"));
  String nasid  = vUtil.trimmed(request.getParameter("site"));
  
  String error = "";
  String logo = "/cn3k/images/sd_logo.jpg";

  ResultSet rs = null;

  dbConnection cnnWAT = new dbConnection();

  cnnWAT.ConnectWAT();
  rs = cnnWAT.executeQuery("select path from files where filtypid = 3 and nasid = '"+nasid+"' limit 1;");
  if (rs.next()) logo = rs.getString("path");
  rs.close();
  cnnWAT.Disconnect();

  if (vUtil.isValidUsername(userid) != 0) error = "Invalid Username, please try again.";
  else error = "Invalid login credentials.";
%>
<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Login Error</title>
<link href="/common/singledigits.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FFFFFF">

<table border="0" width="99%" height="70%" cellspacing="0" cellpadding="0">
 <tr>
  <td align="center" valign="middle">
  <table border="0" width="300" cellspacing="0" cellpadding="3">
   <tr bgcolor="#FFFFFF">
    <td align="center"><img src="<%=logo%>" alt="" border="0"> </td>
   </tr>
  </table>
  <table border="0" width="300" cellspacing="0" cellpadding="3" bgcolor="#0066CC">
   <tr>
    <td align="center" valign="middle" colspan="2">
    <table border="0" width="300" cellspacing="0" cellpadding="4" bgcolor="#CCCCCC">
     <tr>
      <td align="center" valign="middle"><br>
      <b><%=error%></b><br>
      <br>
<!--      For assistance, please call our technical support hotline at 888-266-1096.<br>
      <br>
      To try again, click your browser&#39;s <i>Back</i> button.
-->
      </td>
     </tr>
    </table>
    </td>
   </tr>
  </table>
  </td>
 </tr>
</table>
<%@ include file="/common/cr.inc" %>

</body>

</html>
