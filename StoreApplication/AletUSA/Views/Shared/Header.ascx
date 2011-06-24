<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.HeaderAndFooterViewModel>" %>
<div id="header_bar">
    <div id="logo" style="margin: 15px 10px 10px 30px; float: left; display: inline">
        <img src="<%=Html.Encode(VirtualPathUtility.ToAbsolute("~/Content/img/AktelLogo/Aktel_logo2.gif"))%>" width="200px" height="60px" alt="Twister Wireless" href="/HomePage" title="Twister Wireless" />
    </div>
    <div id="Company_Name">
        <span style="font-size: 24pt; width: 100px; color: #E93A35">Twister Wireless. <span>
            Cellular Accessories Provider. </span></span>
    </div>
    <div id="Search_box">
        <%Html.RenderPartial("Search", Model.SearchModel); %>
    </div>
</div>
