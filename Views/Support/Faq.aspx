<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master" Inherits="System.Web.Mvc.ViewPage<SupportViewData>"%>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        GenerateScript();

        Page.Header.Title = "{0} - FAQ".FormatWith(Model.SiteTitle);
    }

    private void GenerateScript()
    {
        jQueryScriptManager scriptManager = jQueryScriptManager.Current;

        scriptManager.RegisterSource(Url.Asset("faq"));

        scriptManager.RegisterOnReady("Faq.init();");
        scriptManager.RegisterOnDispose("Faq.dispose();");
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%= Html.PageHeader("Frequently Asked Questions")%>
    <ol id="faq">
        <li>
            <a class="q" href="javascript:void(0)">What kind of stories can I submit?</a>
            <div class="ans">We only accept stories that are related with .NET and must be in english. However, if you can think the .NET community can be benefited from an alien technology story, you can also submit it here.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">What is the difference between OpenID or Signed up user?</a>
            <div class="ans"><a href="http://openid.net/" target="_blank" rel="nofollow external">OpenID</a> eliminates the need for multiple usernames across different websites. We support OpenID login, which means if you have an account in <a href="http://openid.yahoo.com/" target="_blank external" rel="nofollow external">Yahoo</a>, <a href="http://openid.aol.com/" target="_blank" rel="nofollow external">AOL</a>, <a href="http://wordpress.com/" target="_blank" rel="nofollow external">Wordpress</a>, <a href="http://blogspot.com/" target="_blank" rel="nofollow external">Blogger</a>, <a href="https://www.myopenid.com/" target="_blank" rel="nofollow external">myOpenID</a> etc you can login without registering in DotNetShoutout. If you do not have any OpenID account, you can get one free from <a href="https://www.myopenid.com/signup?affiliate_id=22806&amp;openid.sreg.optional=email" target="_blank" rel="external">here</a>. There is no difference between OpenID and signed up users, we treat both the same. However, some of the OpenID providers do not provide email address of user, which is required to get the complete benefits of DotNetShoutout (e.g. comment notification via mail).</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">What is shout?</a>
            <div class="ans"><em>Shout</em> refers to the goodness of a story. It shows how the DotNetShoutout community likes the story and clicked over the <em>Shout it</em> link to show their acceptance.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">What is user score?  How does it calculate?</a>
            <div class="ans">
                User score indicates the contribution of an user in DotNetShoutout. Most of the activity of an user in DotNetShoutout has associated score:
                <table>
                    <colgroup span="1" style="text-align:left"></colgroup>
                    <colgroup span="1" style="text-align:right"></colgroup>
                    <tbody>
                        <tr>
                            <th>Activity</th>
                            <th>Score</th>
                        </tr>
                        <tr>
                            <td>Registration/OpenID</td>
                            <td>05.00</td>
                        </tr>
                        <tr>
                            <td>Story submitted</td>
                            <td>10.00</td>
                        </tr>
                        <tr>
                            <td>Story appears in front page</td>
                            <td>05.00</td>
                        </tr>
                        <tr>
                            <td>Story clicked<sup>*</sup></td>
                            <td>00.01</td>
                        </tr>
                        <tr>
                            <td>Upcoming story promoted<sup>*</sup></td>
                            <td>03.00</td>
                        </tr>
                        <tr>
                            <td>Published story promoted<sup>*</sup></td>
                            <td>02.00</td>
                        </tr>
                        <tr>
                            <td>Mark story as spam<sup>*</sup></td>
                            <td>05.00</td>
                        </tr>
                        <tr>
                            <td>Comment submitted<sup>*</sup></td>
                            <td>01.00</td>
                        </tr>
                        <tr>
                            <td>Comment marked as offended by moderator</td>
                            <td>-1.00</td>
                        </tr>
                        <tr>
                            <td>Story incorrectly marked as spam</td>
                            <td>-1.00</td>
                        </tr>
                        <tr>
                            <td>Spam story submitted</td>
                            <td>-50.0</td>
                        </tr>
                        <tr>
                            <td>Spam comment submitted</td>
                            <td>-20.0</td>
                        </tr>
                    </tbody>
                </table>
                <sup>*</sup>Story that is not older than 10 days.
                <br />
                (The above scores might change in future without prior notification)
                <br />
                If user score falls down in minus figure, the account will be automatically disabled.
            </div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">What is TopMovers & TopLeaders?</a>
            <div class="ans"><em>TopMovers</em> are the users who earned the highest score in last 24 hours and <em>TopLeaders</em> are all time highest score earners.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">How does stories get published? Why my story never get published?</a>
            <div class="ans">Stories are published based upon votes aka shouts, comments, freshness, views, user score (who voted it), source of story etc. The more the story has these values the more chance it has to be published. Once the stories are published the top ten stories are listed in the front page The story publishing process runs 4/5 times in a day depending upon the upcoming story queue.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">I am a blogger, how can I put the <em>Shout it</em> counter in my blog's post?</a>
            <div class="ans">
                The easiest way to get the counter html is from your submitted story page, just go to that page, click the <em>show counter code</em> link, copy the html and put it in your blog post. If you are a serious blogger, then go for the following:
                <ul>
                    <li><a href="http://download.live.com/writer" target="_blank" rel="nofollow external">Live Writer</a> Plugin.</li>
                    <li><a href="http://www.dotnetblogengine.net/" target="_blank" rel="nofollow external">BlogEngine.NET</a> Extension.</li>
                    <li><a href="http://graffiticms.com/" target="_blank" rel="nofollow external">Graffiti Cms</a> Chalk.</li>
                    <li><a href="http://communityserver.com/" target="_blank" rel="nofollow external">Community Server</a> ICSModule.</li>
                </ul>
                The above components have the complete customization of <em>Shout It</em> counter and the source codes are also available. To download just visit <a href="http://www.codeplex.com/Kigg/Release/ProjectReleases.aspx" target="_blank">our latest release</a> section and follow the instruction in the downloaded file. We are currently working on to add the other platforms as well,
                till then you can modify your blogging platform templates like the following:
                <br />
                <pre style="background-color:#ddd;font-size:12px">
<code>&lt;div class=&quot;shoutIt&quot;&gt;
    &lt;a rev=&quot;vote-for&quot; href=&quot;http://dotnetshoutout.com/Submit?url=YOUR_POST_ABSOLUTE_URL&quot;&gt;
        &lt;img alt=&quot;Shout it&quot; src=&quot;http://dotnetshoutout.com/image.axd?url=YOUR_POST_ABSOLUTE_URL&quot; style=&quot;border:0px&quot;/&gt;
    &lt;/a&gt;
&lt;div&gt;</code></pre>
            </div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">What are the technologies behind DotNetShoutout?</a>
            <div class="ans">
                DotNetShoutout is developed with Microsoft supported technologies:
                <ul>
                    <li>ASP.NET MVC</li>
                    <li>LinqToSQL</li>
                    <li>MS Enterprise Library Unity, Caching, Logging application block</li>
                    <li>jQuery and jQuery UI</li>
                </ul>
                Other Open Source/Commercial products:
                <ul>
                    <li><a href="http://www.codeplex.com/htmlagilitypack" target="_blank" rel="nofollow external">Html Agility Pack</a></li>
                    <li><a href="http://code.google.com/p/dotnetopenid/" target="_blank" rel="nofollow external">DotNetOpenId</a></li>
                    <li><a href="http://www.codeplex.com/xunit" target="_blank" rel="nofollow external">xUnit.net</a></li>
                    <li><a href="http://code.google.com/p/moq/" target="_blank" rel="nofollow external">Moq</a></li>
                    <li><a href="http://www.testdriven.net/" target="_blank" rel="nofollow external">TestDriven.NET</a></li>
                    <li><a href="http://www.ncover.com/" target="_blank" rel="nofollow external">NCover</a></li>
                    <li><a href="http://www.jetbrains.com/resharper/" target="_blank" rel="nofollow external">Jetbrains R#</a></li>
                    <li><a href="http://www.red-gate.com/Products/ants_profiler/index.htm" target="_blank" rel="nofollow external">Red Gate ANTS Profiler</a></li>
                </ul>
                External Services:
                <ul>
                    <li><a href="http://www.pageglimpse.com/" target="_blank" rel="nofollow external">PageGilmpse</a></li>
                    <li><a href="http://gravatar.com" target="_blank" rel="nofollow external">gravatar</a></li>
                    <li><a href="http://recaptcha.net/" target="_blank" rel="nofollow external">reCaptcha</a></li>
                    <li><a href="http://akismet.com/" target="_blank" rel="nofollow external">Akismet</a></li>
                    <li><a href="http://defensio.com/" target="_blank" rel="nofollow external">Defensio</a></li>
                    <li><a href="http://antispam.typepad.com/" target="_blank" rel="nofollow external">TypePad Antispam</a></li>
                    <li><a href="https://www.idselector.com/" target="_blank" rel="nofollow external">ID Selector</a></li>
                    <li><a href="https://www.myopenid.com/" target="_blank" rel="nofollow external">myOpenID</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">I heard it's a Open Source project, Can I host a site based upon this codebase?</a>
            <div class="ans">
                Sure you can. However, since we are running a .NET Community site with this codebase, we would not love to see a site with the same codebase for the english speaking .NET community.
                If you want be a part of the development team or want to submit a patch/enhancement, just drop <a href="mailto:admin@dotnetshoutout.com">us</a> a line.
            </div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">Okay, I think it's a cool project, how can I help?</a>
            <div class="ans">Become an active member, tell your friends to join us, just spread the word. If you have any business proposal (e.g. sponsoring this project, showing Ads in this site etc), <a href="mailto:admin@dotnetshoutout.com">we</a> look forward to hear from you.</div>
        </li>
    </ol>
</asp:Content>