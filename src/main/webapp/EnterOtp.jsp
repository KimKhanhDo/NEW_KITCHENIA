<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<style type="text/css">
.form-gap {
	padding-top: 70px;
}
</style>
</head>

<body>
	<div class="form-gap"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Enter OTP</h2>
							<%
							if (request.getAttribute("message") != null) {
								out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
							}
							%>

							<div class="panel-body">


								<!-- Form for entering OTP -->
								<form id="otp-form" action="ResetPassword?action=VALIDATE_OTP"
									method="post" role="form" autocomplete="off" class="form">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope color-blue"></i></span> <input
												id="otp" name="otp" placeholder="Enter OTP"
												class="form-control" type="text" required="required">
										</div>
									</div>
									<div class="form-group">
										<input name="validate-otp"
											class="btn btn-lg btn-primary btn-block" value="Validate OTP"
											type="submit">
									</div>
								</form>

								<!-- Form for resending OTP -->
								<form id="resend-otp-form"
									action="ResetPassword?action=RESEND_OTP" method="post"
									role="form" autocomplete="off">
									<div class="form-group">
										<button type="submit" class="btn btn-lg btn-info btn-block">Resend
											OTP</button>
									</div>
								</form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>