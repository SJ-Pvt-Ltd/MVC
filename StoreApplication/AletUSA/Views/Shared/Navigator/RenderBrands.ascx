<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.BrandName>>" %>
<div style="background-color: White; width: 98%; height: 95%; padding: 10px">
    <%foreach (var brandName in Model)
      {%>
    <div style='display: inline; padding-bottom: 3px'>
        <div class="Listof4_display">
            <a id="opener" href="/Filter/ByProductCategory/<%=brandName.Name%>">             
                <img  alt="<%=Html.Encode(brandName.Name) %>" title="<%=Html.Encode(brandName.Name) %>"
                    src="/Content/img/Products/<%=Html.Encode(brandName.Name) %>.gif" />
            </a>
            <%--<div><%=Html.Encode(productCategory.Name) %></div>--%>
        </div>
    </div>
    <%}%>
</div>
