<%@include file="includes/header.jsp" %>
<%@page import="webAuth.Check" %>
<%
	boolean showForm=true;
	
	Check check = new Check();
	
	boolean isError = false;
	String errorText = "<ul>";
	
	boolean pswEq = true;
	boolean loginError = false;
	boolean nameError = false;

	String login=request.getParameter("login");
	String password=request.getParameter("password");
	String rePsw=request.getParameter("re-password");
	String name=request.getParameter("name");
	String region=request.getParameter("region");
	String gender=request.getParameter("gender");
	String comment=request.getParameter("comment");
	String cb=request.getParameter("cb");
	
	if(showForm){
		if(login != null && login.length() == 0){
			isError = true;
			errorText += "<li> Login is empty </li>";
			loginError = true;
		} 
		if(!loginError && login != null ){
			if(!check.checkEmail(login)){
				isError = true;
				login = "";
				errorText += "<li> Invalid email </li>";
			}
		}
		if( (password != null || rePsw != null) && (password.length() == 0 || rePsw.length() == 0)){
			isError = true;
			errorText += "<li> Password or Re-type password is empty </li>";
		}
		if((password != null || rePsw != null) && (!password.equals(rePsw))){
			isError = true;
			errorText += "<li> Passwords aren't equals </li>";
			pswEq = false;
		}
		if(pswEq && (password != null || rePsw != null)){
			if(!check.checkPsw(password)){
				isError = true;
				errorText += "<li> Invalid password </li>";
			}
		}
		
		if(name != null && name.length() == 0){
			isError = true;
			errorText += "<li> Name is empty </li>";
			nameError = true;
		}
		if(!nameError && name != null){
			if(!check.checkName(name)){
				isError = true;
				name = "";
				errorText += "<li> Invalid name</li>";
			}
		}
		if(region != null && region.length() == 0){
			isError = true;
			errorText += "<li> Region is empty </li>";
		}
		if(gender == null){
			isError = true;
			errorText += "<li> Gender is empty </li>";
		}
		if(comment != null && comment.length() == 0){
			isError = true;
			errorText += "<li> Comment is empty </li>";
		} 
		if(cb == null){
			isError = true;
			errorText += "<li> Pls, install Amigo Browser </li>";
		}
	}
	if(isError){
		showForm = true;
		errorText += "</ul>";
	} else {
		showForm = false;
	}
	
	if(!showForm){
		out.write("Login: " + login + "</br>");
		out.write("Psw: " + password + "</br>");
		out.write("Re-psw: " + rePsw + "</br>");
		out.write("Name: " + name + "</br>");
		out.write("Region: " + region + "</br>");
		out.write("Gender: " + gender + "</br>");
		out.write("Comment: " + comment + "</br>");
		out.write("Cb: " + cb + "</br>");
	}else{
%>
<center>
	
	<table border = '0'>
		<tr>
			<td>
				<form action="" method="post">
					<table border='0'>
						<tr>
							<td>Login:</td>
							<td><input type="text" name="login" required pattern="^[a-zA-Z0-9.!#$%&*+/=?^_'{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" placeholder="Enter ur Email" value = <%=(login != null ? login : "")%> ></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="password" required placeholder="Enter ur Password"/></td>
						</tr>
						<tr>
							<td>Re-type password: </td>
							<td><input type="password" name="re-password" required placeholder="Repeat ur Password"/></td>
						</tr>
						<tr>
							<td>Name: </td>
							<td><input type="text" name="name" required pattern="[a-zA-Z]+" placeholder="Enter ur Name" value = <%=(name != null ? name : "")%> ></td>
						</tr>
						<tr>
							<td>Region: </td>
							<td>
								<select name="region" required>
									<option value=""></option>
									<option <%=(region != null?(region.equals("dnr")?"selected":""):"")%> value="dnr">DNR</option>
									<option <%=(region != null?(region.equals("lnr")?"selected":""):"")%> value="lnr">LNR</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Gender: </td>
							<td>
								M<input required type="radio" <%=(gender != null?(gender.equals("male")?"checked":""):"")%> value="male" name="gender"/>
								F<input required type="radio" <%=(gender != null?(gender.equals("female")?"checked":""):"")%> value="female" name="gender"/>
							</td>
						</tr>
						<tr>
							<td>Comment: </td>
							<td>
								<textarea name="comment" required cols="20" rows="10" placeholder="Leave ur cooment here"><%=(comment!=null?comment:"")%></textarea>
							</td>
						</tr>
						<tr>
							<td>Install Amigo Browser</td>
							<td><input type="checkbox" name="cb"  /></td>
						</tr>
						<tr>
							<td></td>
							<td text-align="right"><input type="submit" value="Register"/></td>
						</tr>
					</table>
				</form>
			</td>
			<td>
			<font color="red">
					<%
					out.write(errorText);
					%>
			</font>
				
			</td>
		</tr>
	</table>


	
</center>
<%}%>