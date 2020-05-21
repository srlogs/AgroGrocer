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
				padding-top: 90px;
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
			#DataField
			{
				margin-bottom: 30px;
				width: 350px;
				height: 50px;
				border-style: none;
				background-color: #E9F3E7;
				border-bottom: 2px solid #DCDCDC;
			}
			input[type = submit]
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
			#DataField:focus
			{
				outline: none;
				width: 380px;
				transition: 1s ease-in-out;
				border-bottom: 2px solid green;
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
			.button
			{
				color: white;
			}
		</style>

	</head>
	<body>
		<h1>
			Agro grocer
		</h1>
		<form action="RegistrationClass" method="post">
			<div class="borderEdit">
				<input type="text" name="username" placeholder="User Name" id="DataField" required>
				<br>
				<input type="text" id="DataField" name="emailId" placeholder="Email Id" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
				<br>
				<input type="password" name="password" placeholder="Password" id="DataField" required>
				<br>
				<input type="text" name="phone" placeholder="Phone number" id="DataField" required>
				<br>
					<input type="text" name="doornumber" placeholder="Door number" id="DataField" required>
					<br>
						<input type="text" name="street" placeholder="Street" id="DataField" required>
						<br>
							<input type="text" name="district" placeholder="District" id="DataField" required>
							<br>
				<input type="hidden" name="longitude" id="longitude"/>
					<br>
					<input type="hidden" name="latitude" id="latitude"/>
						<br>
				<input type="submit" name="signup" value="REGISTER" id="signup" class="button">
			</div>
		</form>
		<script>
			window.onload = function()
			{
				myFunction();
			};
			var lat = document.getElementById("latitude");
			var lon = document.getElementById("longitude");
			function myFunction()
			{
				if (navigator.geolocation)
				{
    			navigator.geolocation.getCurrentPosition(showPosition);
  			}
			}
			function showPosition(position)
			{
				lat.setAttribute('value', position.coords.latitude);
				lon.setAttribute('value', position.coords.longitude);
			}
		</script>
	</body>
</html>
