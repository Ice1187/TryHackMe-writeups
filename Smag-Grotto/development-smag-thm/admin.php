
<!DOCTYPE html>
<html>
    <head>
        <title>Smag Development</title>
	<link type="text/css" rel="stylesheet" href="materialize.min.css" media="screen,projection" />
    </head>

    <body class="container">
	<div class="row">
		<div class="col s12 14 offset-14">
			<div class="card">
				<div class="card-action">
					<h1 class="center-align">Login to the admin area</h1>
				</div>
				<div class="card-content">
					<form action="login.php" method="POST">
						<div class="form-field">
							<label for="username">Username</label>
							<input type="text" name="username" placeholder="Username..." />
						</div>
						<div class="form-field">
							<label for="password">Password</label>
							<input type="password" name="password" placeholder="Password..." />
						</div>
						<br>
						<div class="form-field center-align">
							<button name="login" class="btn-large black">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
    </body>
</html>
