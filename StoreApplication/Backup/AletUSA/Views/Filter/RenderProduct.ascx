﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.Product>>" %>
<div class="content_content" runat="server">
    <% foreach (var item in Model)
       { %>
    <div class="Product_Category">
        <%=Html.Encode(item.Name)%></div>
    <% } %>
</div>
