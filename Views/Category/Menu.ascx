<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ICollection<ICategory>>"%>
<div class="category">
    <ul>
        <li>
            <strong><a rel="home" href="<%= Url.Content("~") %>">All</a></strong>
        </li>
        <%
        foreach (ICategory category in Model)
        {
        %>
            <li>
                <strong>
                    <%= Html.ActionLink(category.Name, "Category", "Story", new { name = category.UniqueName }, new { rel = "tag directory" })%>
                </strong>
            </li>
        <%
        }
        %>
        <li>
            <a href="#" onClick="RightScaleDashboard=window.open('http://my.rightscale.com','RightScaleDashboard','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1200,height=800'); return false;">RightScale Dashboard</a>
        </li>
    </ul>
</div>