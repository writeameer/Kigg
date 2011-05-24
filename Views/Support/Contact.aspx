<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master" Inherits="System.Web.Mvc.ViewPage<SupportViewData>"%>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        GenerateScript();

        Page.Header.Title = "{0} - Contact Us".FormatWith(Model.SiteTitle);
    }

    private void GenerateScript()
    {
        jQueryScriptManager scriptManager = jQueryScriptManager.Current;

        scriptManager.RegisterSource(Url.Asset("contact"));

        scriptManager.RegisterOnReady("Contact.init();");
        scriptManager.RegisterOnDispose("Contact.dispose();");
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%= Html.PageHeader("Contact Us")%>
    <form id="frmContact" action="<%= Url.Action("Contact", "Support") %>" method="post">
        <div class="form">
            <p>
                <label for="txtContactEmail" class="label">Email:</label>
                <input id="txtContactEmail" name="email" type="text" class="largeTextBox"/>
                <span class="error"></span>
                <span class="info">(We respect your privacy, your email will not be shared with anyone)</span>
            </p>
            <p>
                <label for="txtContactName" class="label">Name:</label>
                <input id="txtContactName" name="name" type="text" class="largeTextBox"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="txtContactMessage" class="label">Message:</label>
                <textarea id="txtContactMessage" name="message" class="largeTextArea" cols="20" rows="4"></textarea>
                <span class="error"></span>
            </p>
            <p>
                <span id="contactMessage" class="message"></span>
            </p>
            <p>
                <label class="label"></label>
                <input id="btnContactSubmit" type="submit" class="largeButton" value="Submit"/>
            </p>
        </div>
    </form>
</asp:Content>