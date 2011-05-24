<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master" Inherits="System.Web.Mvc.ViewPage<SupportViewData>"%>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Page.Header.Title = "{0} - About Us".FormatWith(Model.SiteTitle);
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%= Html.PageHeader("Who are we?")%>
    <p>We are few followers of .NET technology from <a rel="nofollow" target="_blank" href="http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=bangladesh&sll=23.792496,90.407806&sspn=0.061337,0.119305&g=bangladesh&ie=UTF8&ll=23.553917,90.351563&spn=16.210526,30.541992&z=6">Bangladesh</a> who loves to design and develop applications.</p>
    <p><img alt="Team photo" src="<%= Url.Image("aboutus.jpg") %>"/></p>
    <ul>
        <li>Iftekhar Ahmed</li>
        <li>Abdur Rahim</li>
        <li>Kabirul Islam</li>
        <li>Faisal Hossain Khan</li>
        <li>Kazi Manzur Rashid</li>
        <li>Rezaul Karim</li>
    </ul>
</asp:Content>