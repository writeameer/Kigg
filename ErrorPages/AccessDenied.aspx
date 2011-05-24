<%@ Page Language="C#"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="robots" content="noindex,nofollow"/>
    <link href="<%= Page.ResolveClientUrl("~/Assets/StyleSheets/error.min.css") %>" rel="stylesheet" type="text/css"/>
    <title>Access Denied</title>
</head>
<body>
    <div id="container">
        <div id="talker">
            <a href="<%= Page.ResolveClientUrl("~/")%>"><img src="<%= Page.ResolveClientUrl("~/Assets/Images/fav.png")%>" alt="Talker"/></a>
        </div>
        <div id="notice">
            <h1>Access Denied!</h1>
            <p>
                Your Ip address <strong><%=Request.UserHostAddress%></strong> is currently blocked due to malicious usage of this site. If you think we have incorrectly
                blocked your Ip address, we recommend to contact us as soon as possible.
            </p>
            <p>
                DotNetShoutout Team
                <br/>
                support@dotnetshoutout.com
            </p>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</body>
</html>