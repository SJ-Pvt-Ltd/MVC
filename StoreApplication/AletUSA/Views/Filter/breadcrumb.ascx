<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.Breadcrumb>" %>

<div id="navigation" style="margin: 3px; padding: 2px; border: 1px solid #333333;
            background-color: #F6F6F6;">
            <ul id="breadcrumb_panel" class="tabbed" style="text-transform: capitalize;">
                <li><a style="text-decoration: none">You are here </a></li>
                <li><a>&rsaquo;&rsaquo;</a></li>
                <li class="current_page_item"><a href="/HomePage">Home</a></li>
                <li><a>&rsaquo;&rsaquo;</a></li>
                <li><a href="/Filter/ByManufacturer/<%=Model.Name%>">Manufacturer:
                    <%=Model.Name%></a></li>
            </ul>
        </div>