<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link href="../style/Login.css" type="text/css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="../script/login.js"></script>
</head>
<body>
<div class="form">

	<ul class="tab-group">

		<li class="tab">
			<button class="tablink active" onclick="openForm(event, 'signup')">Sign up</button>
		</li>

		<li class="tab">
			<button class="tablink" onclick="openForm(event, 'login')" >Log in</button>
		</li>
	</ul>

	<div class="tab-content">
		<div id="signup" class="tabcontent">
			<h1>Create account</h1>
			<form action="../script/signup.php" method="post">

				<div class="top-row">
					<div class="field-wrap">
						<input type="text" required autocomplete="off" name="username" placeholder="Username">
					</div>
				</div>

				<div class="field-wrap">
					<input type="email" required autocomplete="off" name="email" placeholder="Email">
				</div>

				<div class="field-wrap">
					<input type="password" required autocomplete="off" id="myPWDSignUP" name="password" placeholder="Password">
				</div>

				<button type="submit" class="button button-block">Submit form</button>

			</form>

		</div>
	</div>
		<div id="login" class="tabcontent">
			<h1>Log in</h1>

			<form action="../script/checklogin.php" method="post">

				<div class="field-wrap">
					<input type="text" required autocomplete="off" placeholder="Username" name="myusername">
				</div>

				<div class="field-wrap">
					<input type="password" required autocomplete="off" id="myPWD" placeholder="Password" name="mypassword">
				</div>

				<p class="forgot"><a href="#">Forgot password?</a></p>

				<button type="submit" class="button button-block">Log in</button>

			</form>

		</div>

	</div>


</body>
</html>
