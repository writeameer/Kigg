<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BaseViewData>" %>
<% bool isAuthenticated = Model.IsCurrentUserAuthenticated; %>
<div id="membershipBox" class="modalBox">
    <div class="titleContainer">
        <div class="title"><%= Model.SiteTitle %></div>
        <div id="membershipClose" class="closeButton" title="Close"></div>
    </div>
    <div class="contentContainer">
        <%if (!isAuthenticated) %>
        <%{ %>
            <div id="loginSection">
                <div class="box">
                    <form id="frmOpenIdLogin" action="<%= Url.Action("OpenId", "Membership") %>" method="post">
                        <h3>Open ID Login</h3>
                        <p>
                            <label for="openid_identifier" class="label">Open ID:</label>
                            <input id="openid_identifier" name="identifier" type="text" class="openIDTextBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label class="label"></label>
                            <label><input id="openid_RememberMe" name="rememberMe" type="checkbox" value="true"/>Keep me logged in on this computer</label>
                        </p>
                        <p>
                            <label class="label"></label>
                            <input id="btnOpenId" type="submit" class="button" value="Login"/>
                        </p>
                    </form>
                </div>
                <div class="divider"></div>
                <div class="box">
                    <form id="frmLogin" action="<%= Url.Action("Login", "Membership") %>" method="post">
                        <h3>Standard Login</h3>
                        <p>
                            <label for="txtLoginUserName" class="label">User Name:</label>
                            <input id="txtLoginUserName" name="userName" type="text" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label for="txtLoginPassword" class="label">Password:</label>
                            <input id="txtLoginPassword" name="password" type="password" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label class="label"></label>
                            <label><input id="chkLoginRememberMe" name="rememberMe" type="checkbox" value="true"/>Keep me logged in on this computer</label>
                        </p>
                        <p>
                            <span id="loginMessage" class="message"></span>
                        </p>
                        <p>
                            <label class="label"></label>
                            <input id="btnLogin" type="submit" class="button" value="Login"/>
                        </p>
                    </form>
                </div>
                <div class="divider"></div>
                <div class="box">
                    <form id="frmForgotPassword" action="<%= Url.Action("ForgotPassword", "Membership") %>" method="post">
                        <h3>Forgot Password?</h3>
                        <p>
                            <label for="txtForgotEmail" class="label">Email:</label>
                            <input id="txtForgotEmail" name="email" type="text" class="textBox"/>
                            <span class="error"></span>
                            <span class="info">(only works for signed up users)</span>
                        </p>
                        <p>
                            <span id="forgotPasswordMessage" class="message"></span>
                        </p>
                        <p>
                            <label class="label"></label>
                            <input id="btnForgotPassword" type="submit" class="button" value="Send Password"/>
                        </p>
                    </form>
                </div>
                <%--
                <div class="divider"></div>
                <div>
                    <iframe src="https://dotnetshoutout.rpxnow.com/openid/embed?token_url=http://dotnetshoutout.com/RpxNow" scrolling="no" frameBorder="no" style="width:400px;height:240px"></iframe>
                </div>
                --%>
            </div>
        <%}%>
        <%if ((isAuthenticated) && (!Model.CurrentUser.IsOpenIDAccount())) %>
        <%{%>
            <div id="changePasswordSection">
                <div class="box">
                    <form id="frmChangePassword" action="<%= Url.Action("ChangePassword", "Membership") %>" method="post">
                        <h3>Change Password</h3>
                        <p>
                            <label for="txtChangeOldPassword" class="label">Old:</label>
                            <input id="txtChangeOldPassword" name="oldPassword" type="password" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label for="txtChangeNewPassword" class="label">New:</label>
                            <input id="txtChangeNewPassword" name="newPassword" type="password" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label for="txtChangenConfirmPassword" class="label">Confirm:</label>
                            <input id="txtChangenConfirmPassword" name="confirmPassword" type="password" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <span id="changePasswordMessage" class="message"></span>
                        </p>
                        <p>
                            <label class="label"></label>
                            <input id="btnChangePassword" type="submit" class="button" value="Change Password"/>
                        </p>
                    </form>
                </div>
            </div>
        <%}%>
        <%if (!isAuthenticated) %>
        <%{%>
            <div id="signupSection">
                <div class="box">
                    <form id="frmSignup" action="<%= Url.Action("Signup", "Membership") %>" method="post">
                        <h3>Sign up</h3>
                        <p>
                            <label for="txtSignupUserName" class="label">User Name:</label>
                            <input id="txtSignupUserName" name="userName" type="text" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label for="txtSignupPassword" class="label">Password:</label>
                            <input id="txtSignupPassword" name="password" type="password" class="textBox"/>
                            <span class="error"></span>
                        </p>
                        <p>
                            <label for="txtSignupEmail" class="label">Email:</label>
                            <input id="txtSignupEmail" name="email" type="text" class="textBox"/>
                            <span class="error"></span>
                            <span class="info">(Please use a valid email, you have to verify it later)</span>
                        </p>
                        <p>
                            <span id="signupMessage" class="message"></span>
                        </p>
                        <p>
                            <label class="label"></label>
                            <input id="btnSignup" type="submit" class="button" value="Sign up"/>
                        </p>
                    </form>
                </div>
            </div>
        <%}%>
    </div>
</div>