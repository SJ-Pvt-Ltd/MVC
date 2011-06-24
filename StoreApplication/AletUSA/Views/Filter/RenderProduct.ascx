<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.Product>>" %>
<div class="content_content" style="min-height: 448px; margin-left:auto; margin-right:auto; width:100%">
    <% foreach (var item in Model)
       { %>
    <div class="Product_Category" style=" ">
        <div href="#" style="width: 30%; float: left; display: inline;
            border: 1px solid #E4E4E4; margin:3px;">
            <div style=" width:100%; text-align:center;">
                <img src="../../../../Content/img/Products/Products/BLKBRY8300LION.jpg" style="margin-left: auto; margin-right:auto;"/>
            </div>
            <div style="line-height: 15px; overflow: hidden; margin:3px; padding-bottom: 8px; text-align: center; font-size: 9pt">
                <a href="#" style="text-decoration: none">
                    <%=Html.Encode(item.Name)%>
                </a>
            </div>
        </div>
    </div>
    <% } %>
</div>


