<%
	boolean showForm=true;
	
	boolean isError = false;
	String errorText = "<ul>";

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
		}
		if( (password != null || rePsw != null) && (password.length() == 0 || rePsw.length() == 0)){
			isError = true;
			errorText += "<li> Password or Re-type password is empty </li>";
		}
		if((password != null || rePsw != null) && (!password.equals(rePsw))){
			isError = true;
			errorText += "<li> Passwords aren't equals </li>";
		}
		if(name != null && name.length() == 0){
			isError = true;
			errorText += "<li> Name is empty </li>";
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
			errorText += "<li> Not accepted... </li>";
		}
	}
	if(isError){
		showForm = true;
		errorText += "</ul>";
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
				<form action="register.jsp">
					<table border='0'>
						<tr>
							<td>Login:</td>
							<td><input type="text" name="login" value="<%=(login!=null ? login : "")%>"/></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="password" value="<%=(password!=null ? password : "")%>"/></td>
						</tr>
						<tr>
							<td>Re-type password: </td>
							<td><input type="password" name="re-password" value="<%=(rePsw!=null ? rePsw : "")%>"/></td>
						</tr>
						<tr>
							<td>Name: </td>
							<td><input type="text" name="name" value="<%=(name!=null ? name : "")%>"/></td>
						</tr>
						<tr>
							<td>Region: </td>
							<td>
								<select name="region">
									<option  value=""></option>
									<option checked value="UsA">DNR</option>
									<option value="UK">LNR</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Gender: </td>
							<td>
								M<input type="radio"<%=(gender!=null?(gender.equals("M")?"checked":""):"")%> value="male" name="gender"/>
								F<input type="radio"<%=(gender!=null?(gender.equals("F")?"checked":""):"")%> value="female" name="gender"/>
							</td>
						</tr>
						<tr>
							<td>Comment: </td>
							<td>
								<textarea name="comment" cols="20" rows="10"<%=(comment!=null ? comment : "")%> ></textarea>
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
				</form>
			</td>
			<td>
				<%
					out.write(errorText);
				%>
			</td>
		</tr>
	</table>


	
</center>
<%}%>