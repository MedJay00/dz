<%@page import ="java.util.Date" %>
<%@page import ="ua.itea.Auth" %>

<%!private int q=0;%>
<%! long failTime=0; %>



<%
String login=request.getParameter("login");
boolean sh=true ;
String mes="<h1 style='color:red;'>ACCESS DENIED try:</h1>";
String password=request.getParameter("password");


if(login!=null&&password!=null){

	if(new Auth().get(login,password)){
		sh=false;
		mes="<h1 style='color:green;'>ACCESS GRANTED</h1>";
	} else if(q>=2){
		sh=false;
		
		if(failTime==0){
			failTime=new Date().getTime();
			q++;
		}
		
	}else{
		q++;	
	}
   
	
	out.write(mes);
	out.write("<br/> Try# "+q);
	if(failTime!=0){
		long curTime=((failTime+60000)-new Date().getTime())/1000;
		if(curTime<0){
			q=0;
			failTime=0;
			sh=true;
		}
		
		out.write("<br/> Time Left: "+curTime);
	}
	
	
	
	
}

//----------------------------------------------
if(sh){
%>


						<center>
				<br/>
				<form action="form02.jsp">
				<table>
				<tr>
				<td>Login<td>
				<td> <input type="text" name="login"/> <td>
				</tr>
				<td>Password<td>
				<td> <input type="text" name="password"/><td>
				<tr>
				<td><td>
				<td align="right"><input type="submit" value="ok" /><td>
				</tr>


				</table>

				</form>
				
<%}%>
