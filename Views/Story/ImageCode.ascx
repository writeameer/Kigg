<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<StoryDetailViewData>" %>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        GenerateScripts();
    }

    private void GenerateScripts()
    {
        jQueryScriptManager scriptManager = jQueryScriptManager.Current;

        scriptManager.RegisterOnReady("ImageCode.set_promoteText('{0}');".FormatWith(Model.PromoteText));
        scriptManager.RegisterOnReady("ImageCode.init();");
        scriptManager.RegisterOnDispose("ImageCode.dispose();");
    }

</script>

<% string rootUrl = Model.RootUrl; %>
<div id="imageCode">
    <% string kiggUrl = "{0}{1}".FormatWith(rootUrl, Url.RouteUrl("Detail", new { name = Model.Story.UniqueName })); %>
    <% string originalUrl = Model.Story.Url; %>
    <% string imageUrl = "{0}/{1}".FormatWith(rootUrl, "image.axd"); %>
    <%= Html.Hidden("hidKiggUrl", kiggUrl)%>
    <%= Html.Hidden("hidOriginalUrl", originalUrl)%>
    <%= Html.Hidden("hidImageUrl", imageUrl)%>
    <div>
        <p>
            <label for="txtBorderColor">Border color:</label>
            <input id="txtBorderColor" type="text" maxlength="6"/>
            <input id="hidBorderColor" type="hidden" value="<%= Model.CounterColors.BorderColor %>"/>
            <span id="spnBorderColor" class="color"></span>
        </p>
        <p>
            <label for="txtTextBackColor"><%= Model.PromoteText %> Backcolor:</label>
            <input id="txtTextBackColor" type="text" maxlength="6"/>
            <input id="hidTextBackColor" type="hidden" value="<%= Model.CounterColors.TextBackColor %>"/>
            <span id="spnTextBackColor" class="color"></span>
        </p>
        <p>
            <label for="txtTextForeColor"><%= Model.PromoteText %> Forecolor:</label>
            <input id="txtTextForeColor" type="text" maxlength="6"/>
            <input id="hidTextForeColor" type="hidden" value="<%= Model.CounterColors.TextForeColor %>"/>
            <span id="spnTextForeColor" class="color"></span>
        </p>
        <p>
            <label for="txtCountBackColor">Count Backcolor:</label>
            <input id="txtCountBackColor" type="text" maxlength="6"/>
            <input id="hidCountBackColor" type="hidden" value="<%= Model.CounterColors.CountBackColor %>"/>
            <span id="spnCountBackColor" class="color"></span>
        </p>
        <p>
            <label for="txtCountForeColor">Count Forecolor:</label>
            <input id="txtCountForeColor" type="text" maxlength="6"/>
            <input id="hidCountForeColor" type="hidden" value="<%= Model.CounterColors.CountForeColor %>"/>
            <span id="spnCountForeColor" class="color"></span>
        </p>
    </div>
    <div>
        <p>
            <img id="imgPreview" alt="Preview" class="smoothImage" src="" onload="javascript:SmoothImage.show(this)"/>
        </p>
        <p>
            <textarea id="txtImageCode" cols="20" rows="4" readonly="readonly"></textarea>
        </p>
        <p>
            <a id="lnkUpdateCode" class="actionLink" href="javascript:void(0)">update</a>
            <a id="lnkResetCode" class="actionLink" href="javascript:void(0)">reset</a>
        </p>
    </div>
</div>