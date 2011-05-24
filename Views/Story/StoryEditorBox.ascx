<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BaseViewData>" %>
<div id="storyEditorBox" class="modalBox">
    <div class="titleContainer">
        <div class="title"><%= Model.SiteTitle %></div>
        <div id="storyEditorClose" class="closeButton" title="Close"></div>
    </div>
    <div class="contentContainer">
        <form id="frmStoryUpdate" action="<%= Url.Action("Update", "Story") %>" method="post">
            <div class="box">
                <input type="hidden" id="hidStoryId" name="id"/>
                <h3>Update Story</h3>
                <p>
                    <label for="txtStoryName" class="label">Name:</label>
                    <input id="txtStoryName" name="name" type="text" class="largeTextBox"/>
                    <span class="error"></span>
                </p>
                <p>
                    <label for="txtStoryCreatedAt" class="label">Created At:</label>
                    <input id="txtStoryCreatedAt" name="createdAt" type="text" class="largeTextBox"/>
                    <span class="error"></span>
                </p>
                <p>
                    <label for="txtStoryTitle" class="label">Title:</label>
                    <input id="txtStoryTitle" name="title" type="text" class="largeTextBox"/>
                    <span class="error"></span>
                </p>
                <p>
                    <label for="txtStoryDescription" class="label">Description:</label>
                    <textarea id="txtStoryDescription" name="description" cols="20" rows="4" class="largeTextArea"></textarea>
                    <span class="error"></span>
                </p>
                <p>
                    <label for="txtStoryTags" class="label">Tags:</label>
                    <input id="txtStoryTags" name="tags" type="text" class="largeTextBox"/>
                </p>
                <p>
                    <label class="label">Category:</label>
                    <% Html.RenderAction("RadioButtonList", "Category"); %>
                    <span class="error"></span>
                </p>
                <p>
                    <span id="updateStoryMessage" class="message"></span>
                </p>
                <p>
                    <label class="label"></label>
                    <input id="btnUpdateStory" type="submit" class="button" value="Update"/>
                </p>
            </div>
        </form>
    </div>
</div>