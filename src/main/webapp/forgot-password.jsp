<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Forgot Password</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/general.css">
<!-- Assuming this is your general stylesheet -->

<style>
body {
	background-color: #fff;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none;
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf;
}

.padding-bottom-3x {
	padding-bottom: 72px !important;
}

.card-footer {
	background-color: #fff;
}

.btn {
	font-size: 13px;
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745;
}

.center-content {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh; /* Adjust as needed */
}

.vh-100 {
	height: 100vh;
}

/* Add your custom styles here */
.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

@media ( max-width : 450px) {
	.h-custom {
		height: 100%;
	}
}

/* Custom Styles */
label {
	font-weight: bold;
}

/* Lighter and More Orangeish Theme Color */
.btn-primary, .bg-primary {
	background-color: #DC5434 !important; /* Lighter Orange */
	border-color: #DC5434 !important;
}

/* Dark Brown color for Forgot password */
a.text-body {
	font-weight: bold;
	color: #8B4513;
}

/* Remove blue block color in the footer */
.bg-primary {
	background-color: transparent !important;
}

.small {
	font-size: 18px; /* Change to your desired font size */
}

/* Matching font styles with the login page */
.forgot h2, .forgot p, .forgot ol, .forgot li, .card-body, .form-group,
	.form-label, .form-control, .form-text, .card-footer, .btn {
	font-family: "Poppins", sans-serif;
}
}
</style>
</head>

<body oncontextmenu='return false' class='snippet-body'>
	<section class="vh-100">
		<div class="container py-5 h-100">
			<div
				class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
						class="img-fluid" alt="Phone image">
				</div>
				<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
					<div class="forgot">
						<h2>Forgot your password?</h2>
						<p>Change your password in three easy steps. This will help
							you secure your password!</p>
						<ol class="list-unstyled">
							<li><span class="text-primary text-medium">1. </span>Enter
								your email address below.</li>
							<li><span class="text-primary text-medium">2. </span>Our
								system will send you an OTP to your email</li>
							<li><span class="text-primary text-medium">3. </span>Enter
								the OTP on the next page</li>
						</ol>
					</div>
					<form class="card mt-4"
						action="ResetPasswordController?action=FORGOT_PASSWORD"
						method="POST">
						<div class="card-body">
							<div class="form-group">
								<label for="email-for-pass">Enter your email address</label> <input
									class="form-control" type="text" name="email"
									id="email-for-pass" required=""> <small
									class="form-text text-muted">Enter the registered email
									address. Then we'll email an OTP to this address.</small>
							</div>
						</div>
						<div class="card-footer">
							<button class="btn btn-success" type="submit">Get New
								Password</button>
							<a href="login.html" class="btn btn-danger">Back to Login</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/jquery-2.1.0.min.js"></script>
	<!-- Make sure jQuery is included -->
	<script src="assets/js/custom.js"></script>
	<!-- Include your custom scripts -->
</body>

</html>
