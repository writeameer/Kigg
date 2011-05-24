<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="intro">
    <h3>Welcome!</h3>
    <div>
        <p>
            <strong>DotNetShoutout</strong> is a place where you can find the <strong>latest Microsoft .NET stories</strong> to increase your skills and share your opinions.
        </p>
        <p>
            Enjoy participating in this community and see which other people in our industry are getting <em>Shoutouts</em>.
        </p>
        <p style="text-align:right">
            <%= Html.ActionLink("faq »", "Faq", "Support")%>
        </p>
    </div>
</div>