<html>
	<head>
		<title>AgroGrocer</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style type="text/css">
			h1
			{
				text-align: center;
				font-style: bold;
				font-family: 'Roboto', sans-serif;
				letter-spacing: 2.5px;
				font-weight: 500;
				padding-top: 140px;
				color: #61D245;
				text-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
			}
			body
			{
				background-color: #E9F3E7;
			}
			div
			{

				text-align: center;
			}
			#Sfield
			{
				margin-bottom: 30px;
				width: 350px;
				height: 50px;
				border-style: none;
				background-color: #E9F3E7;
				border-bottom: 2px solid #DCDCDC;
			}
			#display
			{
				border: none;
				width: 350px;
				height: 20px;
				border-style: none;
				font-family: 'Roboto', sans-serif;
				background-color: #E9F3E7;
				color: red;
				text-align: center;
			}
			.button
			{
				margin-top: 20px;
				margin-bottom: 20px;
				width: 240px;
				height: 50px;
				box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
				letter-spacing: 2.5px;
				font-weight: 500;
				font-family: 'Roboto', sans-serif;
				/*background-image: linear-gradient(#41D21D,#33A218);*/
				background-color:#71DF57;
				border-radius: 25px;
				border-style: none;
				text-align: center;
				line-height: 1px;
				padding: 0px;
				color: white;
			}
			/*input[type = submit]:hover
			{
				background-color: black;
			}*/
			input,
			input::-webkit-input-placeholder
			{
    			font-size: 20px;
    			line-height: 3;
			}
			#Sfield:focus
			{
				outline: none;
				width: 380px;
				transition: 1s ease-in-out;
				border-bottom: 2px solid green;
				background-color: #E9F3E7;
			}
			input:focus::-webkit-input-placeholder
			{
				font-size: 15px;
				transition: .5s;
			}
			/*input[type = submit]:focus
			{
				border-radius: 5px;
			}*/
			/*#signup:hover
			{
				background-color: black;
			}*/
			.button:hover
			{
  				background-color: #2EE59D;
  				box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  				color: #fff;
  				transition: 0.5s;
  				transform: translateY(-7px);
			}
			.registerPage
			{
				background-color: #E9F3E7;
				text-align: center;
				border-style: none;
				color: grey;
				font-family:  'Roboto', sans-serif;
				font-weight: 500;
				margin-top: 0px;
				text-decoration: underline;
				letter-spacing: 1.5px;
			}
			.registerPage:hover
			{
				color: green;
				letter-spacing: 2px;
				transition: 0.5s;
			}
			label
			{
				margin-top: 10px;
				text-align: center;
				font-size: 15px;
				font-family:  'Roboto', sans-serif;
				font-weight: 500;
				color: grey;
			}
			.forget
			{
				background-color: #E9F3E7;
				text-align: center;
				border-style: none;
				color: grey;
				font-family:  'Roboto', sans-serif;
				font-size: medium;
				font-weight: 500;
				margin-top: 0px;
				letter-spacing: 1.5px;
			}
			}
		</style>
	</head>
	<body>
		<%
		String i =(String) session.getAttribute("value");
			request.setAttribute("value","correct");
			%>
		<h1>
			Agro grocer
		</h1>
		<form action="Login" method="post">
			<div class="borderEdit">
				<input type="text" id="Sfield" name="emailId" placeholder="Email Id" required>
				<br>
				<input type="password" name="password" placeholder="Password" id="Sfield">
				<br>
					<%
	if(i != null)
	{
			if(i.equals("Incorrect username or password!"))
			{
				%>
					<input type="text" name="incorrect" value="<%=i%>" id="display"/>
					<%
			}
			session.invalidate();
	}
%>
<br>
				<input type="submit" name="signIn" value="LOGIN" id="signIn" class="button" required> 



			</div>
		</form>
		<br>
		<div>
		<label> OR </label> &nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="window.location='EmailIdRequester.jsp'" class="forget">Forget Password</button>
	</div>
		<div>
		<form action="RegistrationPage.jsp">
			<input type="submit" name="register" id="register" class="registerPage" value="REGISTER">
		</form>
	</div>
	</body>
</html>
