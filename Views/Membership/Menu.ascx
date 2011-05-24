<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<UserMenuViewData>" %>
<% bool isAuthenticated = Model.IsUserAuthenticated; %>
<% IUser user = Model.CurrentUser; %>
<p class="userLinks">
    Welcome 
    <%if (isAuthenticated) %>
    <%{%>
        <% string userName = user.UserName; %>
        <img class="smoothImage" onload="javascript:SmoothImage.show(this)" alt="<%= Html.AttributeEncode(userName) %>" src="<%= Html.AttributeEncode(user.GravatarUrl(24)) %>"/> 
        <%= Html.RouteLink(userName, "User", new { name = user.Id.Shrink(), tab = UserDetailTab.Promoted, page = 1 })%>
    <%} %>
    <%else%>
    <%{%>
        Guest
    <%}%>
    ,
    <%if (isAuthenticated) %>
    <%{%>
        <%if (!user.IsOpenIDAccount()) %>
        <%{ %>
                <a id="lnkChangePassword" href="javascript:void(0)">Change Password</a> Or 
        <%} %>
        <a id="lnkLogout" href="javascript:void(0)">Logout</a>
    <%}%>
    <%else%>
    <%{%>
        <a id="lnkLogin" href="javascript:void(0)">Login</a> Or
        <a id="lnkSignup" href="javascript:void(0)">Signup</a>
    <%}%>
</p>
<p class="storyLinks">
    <%= Html.ActionLink("Submit New Story", "Submit", "Story")%>
    <%= Html.ActionLink("Upcoming Stories", "Upcoming", "Story")%>
</p>