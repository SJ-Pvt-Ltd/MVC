<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.ProductCategory>>" %>

<div style="display: inline;">
    <%foreach (var item in Model)
      {%>
    <div class="Carrier">
        <a href="/Filter/ByCarrier/<%=item.Name%>">
            <img alt='<%=item.Name %>' title='<%=item.Name %>' src="/Content/img/Carriers/<%=item.Name %>.jpg" />
        </a>
    </div>
    <%} %>
</div>

