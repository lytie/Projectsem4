<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | Recover Password</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <%@include file="css.jsp" %>
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href=""><b>Admin</b><span style="color: #c59636">Haven Deluxe</span></a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">You are only one step a way from your new password, recover your password now.</p>

                <form action="Admin_RecoverPassword" method="post">
                    <div class="input-group mb-3">
                        <input type="password" id="pwd" name="password" required class="form-control" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="${email}" name="email"/>
                    <input type="hidden" value="${token}" name="token"/>
                    <div class="input-group mb-3">
                        <input type="password" id="cpwd" name="confirmpassword" required class="form-control" placeholder="Confirm Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block">Change password</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <p class="mt-3 mb-1">
                    <a href="Admin_Login">Login</a>
                    <div style="color:red">${error}</div>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <%@include file="jslink.jsp" %>
    <script>
        var password = document.getElementById('pwd'),
          confirm_password = document.getElementById('cpwd');

        function validatePassword() {
          if (password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
          } else {
            confirm_password.setCustomValidity('');
          }
        }
        password.oninput = validatePassword;
        confirm_password.oninput = validatePassword;
    </script>
</body>

</html>