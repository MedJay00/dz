<%@page import="java.util.Date" %>
<%@page import="ua.itea.Auth" %>
<%@include file="includes/header.jsp" %>
<%! int tryCounter=0; %>
<%! long failTime=0; %>
<%
 String login=request.getParameter("login");
 String password=request.getParameter("password");
 boolean showForm=true;
 String message="<h1 style='color:red;'>ACCESS DENIED</h1>";
 if(login!=null && password !=null){ 
  if(new Auth().get(login,password)){
  message="<h1 style='color:green;'>ACCESS GRANTED</h1>";
   showForm=false;
  }else{
  tryCounter++; 
  } 
 if(tryCounter>3){
  showForm=false;
  if(failTime==0){
   failTime=new Date().getTime();
  }  
 } 
   out.write(message);
   out.write("<br/> Try# "+tryCounter);
   if(failTime!=0){
  long curTime=((failTime+60000)-new Date().getTime())/1000;
  if(curTime<0){
   tryCounter=0;
   failTime=0;
   showForm=true;
  }
  out.write("<br/> Time Left:  00:"+curTime);
   }
 }
 //------------------------------------------------------------------------------
 if(showForm){
%>
   <center>
   <form action="auth.jsp">
   <table border='0'>
    <tr>
     <td>Login:</td>
     <td><input type="text" name="login"/></td>
    </tr>
    <tr>
     <td>Password:</td>
     <td><input type="text" name="password"/></td>
    </tr>
    <tr>
     <td></td>
     <td align="right"><input type="submit" value="send"/></td>
    </tr>
   </table>
   </form>
   </center>

 <%}%>