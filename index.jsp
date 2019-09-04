<%
boolean shForm=true;

boolean err=false;
String errTex="<ul>";

String login=request.getParameter("login");
String password=request.getParameter("password");
String rePassword=request.getParameter("re-password");
String name=request.getParameter("name");
String region=request.getParameter("region");
String comment=request.getParameter("comment");


if(login!=null&&login.length()==0){
	err=true;
	errTex+="<li>Login is null"
}

if(password!=null&&password.length()==0){
	err=true;
	errTex+="<li>password is null"
}

if(rePassword!=null&&rePassword.length()==0&&rePassword.equals(password) ){
	err=true;
	errTex+="<li>re-password is fu"
}
if(name!=null&&name.length()==0){
	err=true;
	errTex+="<li>name is null"
}
if(region!=null&&region.length()==0){
	err=true;
	errTex+="<li>region is null"
}
if(comment.length()==0){
	err=true;
	errTex+="<li>comment is null"
}
errTex+="</ul>";

if(err){
	
	
}else{
		shForm=false
	
}





if(shForm){
%>

<center>
  <form action="register.jsp">
  <table border='1'>
  <tr> <td>
    <table border='0'>
      <tr>
        <td>Login:</td>
        <td><input type="text" name="login"/></td>
      </tr>
      <tr>
        <td>Password:</td>
        <td><input type="password" name="password"/></td>
      </tr>
      <tr>
        <td>Re-type password: </td>
        <td><input type="password" name="re-password"/></td>
      </tr>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="name"/></td>
      </tr>
      <tr>
        <td>Region: </td>
        <td>
          <select name="region">
            <option value="dnr">DNR</option>
            <option value="lnr">LNR</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Gender: </td>
        <td>
          M<input type="radio" value="male" name="gender"/>
          F<input type="radio" value="female" name="gender"/>
        </td>
      </tr>
      <tr>
        <td>Comment: </td>
        <td>
          <textarea name="comment" cols="20" rows="10"></textarea>
        </td>
      </tr>
      <tr>
        <td>I accept ...</td>
        <td><input type="checkbox" name="cb"/></td>
      </tr>
      <tr>
        <td></td>
        <td text-align="right"><input type="submit" value="Register"/></td>
      </tr>
    </table>
   </td>
	
	
	<td>
	
	
	<td>
	</tr>
   </table>
  </form>
</center>
<%}%>
