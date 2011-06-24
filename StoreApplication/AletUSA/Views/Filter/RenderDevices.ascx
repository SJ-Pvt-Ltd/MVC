<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.PhoneDevice>>" %>
<div class="content_content" style="min-height: 448px">
    <% foreach (var item in Model)
       { %>
    <div class="Product_Category" style="">
        <div href="/Filter/ByCarrier/<%=item.Carriers[0].Name%>/ByPhoneDevice/<%=item.Name%>"
            style="width: 23%; float: left; display: inline; border: 1px solid #E4E4E4; 
            margin: 3px">
            <div style=" width:100%; text-align:center;">
                <img src="../../Content/img/Latest/iphone-4.gif" style="margin-left: auto; margin-right:auto;" />
            </div>
            <div style="line-height: 15px; overflow: hidden; margin-top:5px;padding-bottom: 8px; text-align: center;">
                <a href="/Filter/ByCarrier/<%=item.Carriers[0].Name%>/ByPhoneDevice/<%=item.Name%>"
                    style="text-decoration: none">
                    <%=Html.Encode(item.Name)%>
                </a>
            </div>
        </div>
    </div>
    <% } %>
</div>
