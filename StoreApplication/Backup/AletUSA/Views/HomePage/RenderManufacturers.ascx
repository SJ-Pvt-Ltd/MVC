<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.Manufacturer>>" %>
<div style="background-color: White; width: 98%; height: 95%; padding: 10px">    
    <%foreach (var item in Model)
      {%>
    <div style='display: inline; padding-bottom: 3px'>
        <div class="Listof4_display">
            <a href="/Filter/ByManufacturer/<%=item.Name%>">
                <img style="padding:4px; border:solid 1px black" alt='<%=item.Name %>' title='<%=item.Name %>'
                    src="/Content/img/Manufacturers/make_<%=item.Name %>.gif" />
            </a>
        </div>
    </div>
    <%} %>
</div>
