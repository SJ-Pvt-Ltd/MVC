<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<string>>" %>
<div style="padding: 12px 10px 10px 10px;">
    <p class="sidebar_title">Filter By</p>
    <div class="sidebar_content" runat="server">
        <% foreach (var item in Model)
           { %>
        <p>
            <a href="#">
                <%= Html.Encode(item) %>
            </a>
        </p>
        <% } %>
    </div>
</div>
