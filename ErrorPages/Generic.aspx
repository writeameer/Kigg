<%@ Page Language="C#"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="-1"/>
    <meta name="robots" content="noindex,nofollow"/>
    <link href="<%= Page.ResolveClientUrl("~/Assets/StyleSheets/error.min.css") %>" rel="stylesheet" type="text/css"/>
    <title>Error</title>
</head>
<body>
    <div id="container">
        <div id="talker">
            <a href="<%= Page.ResolveClientUrl("~/")%>"><img src="<%= Page.ResolveClientUrl("~/Assets/Images/fav.png")%>" alt="Talker"/></a>
        </div>
        <div id="notice">
            <h1>Oops!</h1>
            <p>
                Something unholy just happened, we are unable to process your request at this time.
            </p>
            <p>
                You can either (a) click on the 'back' button in your browser and try to navigate through our site in a different direction, or (b) click on the following link to go to homepage.
            </p>
            <div class="back">
                <a href="<%= Page.ResolveClientUrl("~/")%>">Back to home</a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</body>
</html>