<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.ProductCategory>>" %>
<div id="ProductCategories" class="content_content" runat="server">
    <%foreach (var productCategory in Model)
      {%>
    <div style='display: inline; padding-bottom: 3px'>
        <div class="Product_Category">
            <a href="/Filter/ByProductCategory/<%=productCategory.Name%>">
                <img alt="<%=Html.Encode(productCategory.Name) %>" title="<%=Html.Encode(productCategory.Name) %>"
                    src="/Content/img/Products/<%=Html.Encode(productCategory.Name) %>.gif" />
            </a>
            <div>
                <%=Html.Encode(productCategory.Name) %></div>
        </div>
    </div>
    <%} %>
    <div class='clearer'>
        &nbsp;</div>
</div>
