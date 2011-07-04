<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.Carrier>>" %>
<div style="background-color: White; width: 98%; height:95%; padding:10px">
    <div style="float: left; padding-right: 30px">
        <img src="../../Content/img/Downloads/Carrier.jpg" height="150px" />
    </div>
    <%foreach (var carrier in Model)
      {%>
    <div style='display: inline; background-color: white; float: left'>
        <div class="Listof4_display">
            <a href="/Filter/ByCarrier/<%=carrier.Name%>">
                <img style="border: solid 1px black" alt='<%=carrier.Name %>' title='<%=carrier.Name %>'
                    src="/Content/img/Carriers/<%=carrier.Name %>.jpg" />
            </a>
        </div>
    </div>
    <%} %>
</div>
