<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<StoryItemViewData>" %>
<script runat="server">
    string ShareLinks(string id, IEnumerable<string> socialServices)
    {
        string shareUrl = Url.Content("~/share.axd");
        StringBuilder shareHtml = new StringBuilder();

        Func<string, string> shareLink = service => "<a href=\"{0}?id={1}&amp;srv={2}\" rel=\"nofollow\" title=\"{2}\" class=\"{2}\" target=\"_blank\"><span>&nbsp;</span></a>".FormatWith(Html.AttributeEncode(shareUrl), Html.AttributeEncode(id), Html.AttributeEncode(service));

        foreach (string service in socialServices)
        {
            shareHtml.Append(shareLink(service));
        }

        return shareHtml.ToString();
    }

    string TagLinks(IEnumerable<ITag> tags)
    {
        StringBuilder tagHtml = new StringBuilder();

        int i = 0;

        foreach(ITag tag in tags)
        {
            if (i > 0)
            {
                tagHtml.Append(", ");
            }

            tagHtml.Append("<strong>");
            tagHtml.Append(Html.ActionLink(tag.Name, "Tags", "Story", new { name = tag.UniqueName }, new { rel = "tag directory" }));
            tagHtml.Append("</strong>");

            i += 1;
        }

        return tagHtml.ToString();
    }
</script>
<% const string hDateFormat = "yyyy-MM-ddThh:mm:ssZ"; %>
<% const string LongDateFormat = "F"; %>
<% IStory story = Model.Story; %>
<% IUser user = Model.User; %>
<% string attributedEncodedStoryId = Html.AttributeEncode(story.Id.Shrink()); %>
<td class="kigg">
    <div class="count">
        <span id="s-c-<%= attributedEncodedStoryId %>"><%= story.VoteCount %></span>
        <br/>
        <%= Model.CountText %>
    </div>
    <%
        string actionClass = "none";
        string spamClass = "hide";
        string kiggClass = "hide";
        string unkiggClass = "hide";

        if (user == null)
        {
            actionClass = "do";
            kiggClass = string.Empty;
        }
        else
        {
            if (!story.IsPostedBy(user))
            {
                if (story.CanPromote(user))
                {
                    actionClass = "do";
                    kiggClass = string.Empty;
                }
                else if (story.CanDemote(user))
                {
                    actionClass = "undo";
                    unkiggClass = string.Empty;
                }
                else if (story.HasMarkedAsSpam(user))
                {
                    spamClass = string.Empty;
                }
            }
        }
    %>
    <div class="action <%= actionClass %>">
        <% if (story.IsPostedBy(user)) %>
        <% { %>
            <span title="You have posted this story">mine</span>
        <% } %>
        <% else %>
        <% { %>
                <span id="s-s-<%= attributedEncodedStoryId %>" title="You have marked this story as spam." class="<%= spamClass %>">spam</span>
                <a id="a-k-<%= attributedEncodedStoryId%>" href="javascript:void(0)" onclick="javascript:Story.promote('<%= attributedEncodedStoryId %>')" class="<%= kiggClass %>"><%= ViewData.Model.PromoteText %></a>
                <a id="a-u-<%= attributedEncodedStoryId%>" href="javascript:void(0)" onclick="javascript:Story.demote('<%= attributedEncodedStoryId %>')" class="<%= unkiggClass %>"><%= ViewData.Model.DemoteText %></a>
        <% } %>
        <span id="s-p-<%= attributedEncodedStoryId%>"></span>
    </div>
</td>
<td class="content xfolkentry">
    <table>
        <tbody>
            <tr>
                <td class="title">
                    <h2><a class="entry-title taggedlink" rel="bookmark external" href="<%= Html.AttributeEncode(story.Url) %>" target="_blank" onclick="javascript:Story.click('<%= attributedEncodedStoryId %>')"><%= Html.Encode(story.Title)%></a></h2>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="timestamp">
                        <% if (story.IsPublished()) %>
                        <% { %>
                                <span>published</span> <span class="time published" title="<%= story.PublishedAt.Value.ToString(LongDateFormat) %> GMT"><%= story.PublishedAt.Value.ToRelative() %></span> <span>ago</span> 
                        <% } %>
                        <span>posted by</span>
                        <% string userUrl = Url.RouteUrl("User", new { name = story.PostedBy.Id.Shrink(), tab = UserDetailTab.Promoted, page = 1 }); %>
                        <a class="vcard author" href="<%= Html.AttributeEncode(userUrl) %>">
                            <img alt="<%= Html.AttributeEncode(story.PostedBy.UserName) %>" src="<%= Html.AttributeEncode(story.PostedBy.GravatarUrl(15)) %>" class="photo gravatar"/><span class="fn"><%=Html.Encode(story.PostedBy.UserName)%></span>
                        </a> 
                        <span class="time" title="<%= story.CreatedAt.ToString(LongDateFormat) %> GMT"><%= story.CreatedAt.ToRelative() %></span> <span>ago</span>
                    </div>
                    <div class="hide">
                        <% if (story.IsPublished()) %>
                        <% { %>
                                <abbr class="published" title="<%= story.PublishedAt.Value.ToString(hDateFormat) %>"><%= story.PublishedAt.Value.ToString(LongDateFormat) %> GMT</abbr>
                        <% } %>
                        <abbr class="updated" title="<%= story.CreatedAt.ToString(hDateFormat) %>"><%= story.CreatedAt.ToString(LongDateFormat) %> GMT</abbr>
                    </div>
                    <div class="preview">
                        <a href="<%= Html.AttributeEncode(story.Url) %>" target="_blank" rel="external">
                            <img alt="<%= Html.AttributeEncode(story.Title) %>" src="<%= Html.AttributeEncode(story.SmallThumbnail()) %>" class="smoothImage" onload="javascript:SmoothImage.show(this)"/>
                        </a>
                    </div>
                    <% string detailUrl = Url.RouteUrl("Detail", new { name = story.UniqueName }); %>
                    <div class="entry-content description">
                        <% if (Model.DetailMode) %>
                        <% { %>
                                <%= story.HtmlDescription %>
                        <% } %>
                        <% else %>
                        <% { %>
                                <%= story.StrippedDescription() %> <a href="<%= Html.AttributeEncode(detailUrl) %>">(more)</a>
                        <% } %>
                    </div>
                    <div class="summary">
                        <span class="category">category: </span> <strong><%= Html.ActionLink(story.BelongsTo.Name, "Category", "Story", new { name = story.BelongsTo.UniqueName }, new { rel = "tag directory" })%></strong> |
                        <span class="view">clicked: </span><%= story.ViewCount %>
                        <% if (!Model.DetailMode) %>
                        <% { %>
                                <% string comment = story.HasComments() ? ("{0} " + ((story.CommentCount > 1) ? "comments" : "comment")).FormatWith(story.CommentCount) : "comment"; %>
                                | <a href="<%= Html.AttributeEncode(detailUrl) %>#comments" class="addComment"><%= comment %></a>
                        <% } %>
                         |
                         <span class="share">share:
                            <%= ShareLinks(story.Id.Shrink(), Model.SocialServices)%>
                         </span>
                         | <span class="source">source: </span><a href="http://<%= Html.AttributeEncode(story.Host()) %>" target="_blank"><%= story.Host()%></a> 
                         <% if (!story.IsPublished()) %>
                         <% { %>
                                <% string markAsSpamClass = ((user == null) || story.CanMarkAsSpam(user)) ? "inline" : "hide"; %>
                                <div id="d-m-<%= attributedEncodedStoryId %>" class="<%= markAsSpamClass %>"> | <a id="a-s-<%= attributedEncodedStoryId %>" href="javascript:void(0)" class="markSpam actionLink" onclick="javascript:Story.markAsSpam('<%= attributedEncodedStoryId %>')">flag as spam</a></div>
                         <% } %>
                         <% if (Model.DetailMode) %>
                         <% { %>
                                | <a id="a-c" href="javascript:void(0)" class="imageCode actionLink">show counter code</a>
                         <% } %>
                         <% if ((user != null) && user.CanModerate()) %>
                         <% { %>
                                | <a class="edit actionLink" href="javascript:void(0)" onclick="Moderation.editStory('<%= attributedEncodedStoryId %>')">edit</a>
                                | <a class="delete actionLink" href="javascript:void(0)" onclick="Moderation.deleteStory('<%= attributedEncodedStoryId %>')">delete</a>
                                | <a class="spam actionLink" href="javascript:void(0)" onclick="Moderation.confirmSpamStory('<%= attributedEncodedStoryId %>')">spam</a>
                                <% if (!story.IsApproved()) %>
                                <% { %>
                                    | <a class="approve actionLink" href="javascript:void(0)" onclick="Moderation.approveStory('<%= attributedEncodedStoryId %>')">approve</a>
                                <% } %>
                         <% } %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <% if (story.HasTags()) %>
                    <% { %>
                            <span class="tags">
                                <span class="text">tags: </span>
                                <%= TagLinks(story.Tags) %>
                            </span>
                    <% } %>
                </td>
            </tr>
        </tbody>
    </table>
</td>