<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master" Inherits="System.Web.Mvc.ViewPage<StoryContentViewData>"%>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        GenerateScripts();

        Page.Header.Title = "{0} - Submit New Story".FormatWith(Model.SiteTitle);
    }

    private void GenerateScripts()
    {
        jQueryScriptManager scriptManager = jQueryScriptManager.Current;

        scriptManager.RegisterSource(Url.Asset("js3"));

        scriptManager.RegisterOnReady("Story.set_autoDiscover({0});".FormatWith(Model.AutoDiscover.ToString().ToLowerInvariant()));
        scriptManager.RegisterOnReady("Story.set_captchaEnabled({0});".FormatWith(Model.CaptchaEnabled.ToString().ToLowerInvariant()));

        if (Model.AutoDiscover)
        {
            scriptManager.RegisterOnReady("Story.set_retrieveStoryUrl('{0}');".FormatWith(Url.RouteUrl("Retrieve")));
        }

        scriptManager.RegisterOnReady("Story.set_suggestTagsUrl('{0}');".FormatWith(Url.RouteUrl("SuggestTags")));

        scriptManager.RegisterOnReady("Story.init()");
        scriptManager.RegisterOnDispose("Story.dispose();");
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server"/>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%= Html.PageHeader("Submit New Story")%>
    <form id="frmStorySubmit" action="<%= Url.Action("Submit", "Story") %>" method="post">
        <div class="form">
            <p>
                <label for="txtStoryUrl" class="label">Url:</label>
                <input id="txtStoryUrl" name="url" type="text" class="largeTextBox" value="<%= Model.Url %>"/>
                <span id="errorStoryUrl" class="error"></span>
            </p>
            <p>
                <label for="txtStoryTitle" class="label">Title:</label>
                <input id="txtStoryTitle" name="title" type="text" class="largeTextBox" value="<%= Model.Title %>"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="txtStoryDescription" class="label">Description:</label>
                <input type="hidden" id="hidDescription" name="description"/>
                <textarea id="txtStoryDescription" name="storyDescription" cols="20" rows="4"><%= Model.Description %></textarea>
                <span class="error"></span>
            </p>
            <div>
                <div id="storyPreview" class="livePreview"></div>
                <div><a id="lnkStoryPreview" class="actionLink" href="javascript:void(0)">hide preview</a></div>
            </div>
            <p>
                <label for="txtStoryTags" class="label">Tags:</label>
                <input id="txtStoryTags" name="tags" type="text" class="largeTextBox"/>
                <span class="info">(optional, separate by comma for multiple tags)</span>
            </p>
            <p>
                <label class="label">Category:</label>
                <% Html.RenderAction("RadioButtonList","Category"); %>
                <span class="error"></span>
            </p>
            <%if (Model.CaptchaEnabled)%>
            <%{%>
                <kigg:reCAPTCHA id="captcha" runat="server"></kigg:reCAPTCHA>
            <%}%>
            <p>
                <span id="storyMessage" class="message"></span>
            </p>
            <p>
                <input id="btnStorySubmit" type="submit" class="largeButton" value="Submit"/>
            </p>
        </div>
    </form>
</asp:Content>