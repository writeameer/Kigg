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
    </ul>
</div>