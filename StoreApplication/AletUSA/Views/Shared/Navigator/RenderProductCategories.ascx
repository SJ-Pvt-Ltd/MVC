<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.ProductCategory>>" %>
<div style="background-color: White; width: 98%; height: 95%; padding: 10px">
    <%foreach (var productCategory in Model)
      {%>
    <div style='display: inline; padding-bottom: 3px'>
        <div class="Listof4_display">
            <a id="opener" href="/Filter/ByProductCategory/<%=productCategory.Name%>">             
                <img  alt="<%=Html.Encode(productCategory.Name) %>" title="<%=Html.Encode(productCategory.Name) %>"
                    src="/Content/img/Products/<%=Html.Encode(productCategory.Name) %>.gif" />
            </a>
            <%--<div><%=Html.Encode(productCategory.Name) %></div>--%>
        </div>
    </div>
    <%}%>
</div>
