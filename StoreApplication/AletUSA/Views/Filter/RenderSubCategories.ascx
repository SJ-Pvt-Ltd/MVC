<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.ProductSubCategory>>" %>
<div class="content_content" style="min-height: 448px">
    <% foreach (var item in Model)
       { %>
            <div class="Product_Category">
                <a href="/Filter/ByProductCategory/<%=item.ProductCategory.Name%>/ByProductSubCategory/<%=item.Name%>">
                    <%=Html.Encode(item.Name)%>
                </a>
            </div>
    <% } %>
</div>
