<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.HeaderAndFooterViewModel>" %>
<div id="header_bar">
    <div id="logo" style="margin: 15px 10px 10px 30px; float: left; display: inline">
        <img src="<%=Html.Encode(VirtualPathUtility.ToAbsolute("~/Content/img/AktelLogo/Aktel_logo2.gif"))%>"
            width="200px" height="60px" alt="Twister Wireless" href="/HomePage" title="Twister Wireless" />
    </div>
    <div id="Company_Name">
        <span style="font-size: 24pt; width: 100px; color: #E93A35">Twister Wireless. <span>
            Cellular Accessories Provider. </span></span>
    </div>
    <div id="Search_box">
        <%Html.RenderPartial("Search", Model.SearchModel); %>
    </div>
</div>
<div id="dockToPopups" style="height: 40px; background-color: #999999; margin: 5px 10px 5px 10px;">
    <ul style="list-style: none; float: left; font-family: 'Arial', 'Helvetica', 'Verdana', 'sans-serif';
        font-size: 10px; padding: 6px 20px; height: 15px;">
        <li style="float: left; padding-right: 48px; font-size: 14pt; color: white; text-decoration: none">
            View Accessories By: </li>
        <li style="float: left; padding-right: 28px;"><a id="inline" href="#CarrierPopup"
            title="Select a Carrier" style="font-size: 14pt; color: white; text-decoration: none">
            Carriers</a></li>
        <li style="float: left; padding-right: 28px"><a id="inline" href="#ManufacturerPopup"
            title="Select a Manufacturer" style="font-size: 14pt; color: white; text-decoration: none">
            Manufactuers</a> </li>
        <li style="float: left; padding-right: 28px"><a id="inline" href="#BrandPopup" title="Select a Brand"
            style="font-size: 14pt; color: white; text-decoration: none">Brands</a></li>
        <li style="float: left; padding-right: 28px"><a id="inline" href="#ProductCatPopup"
            title="Select a Product Category" style="font-size: 14pt; color: white; text-decoration: none">
            Product Categories</a></li>
    </ul>
</div>
<div id="Popups">
    <div style="display: none">
        <div id="CarrierPopup" style="width: 850px">
            <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                <img src="../../Content/img/Downloads/close_btn.gif" /></a>
            <%Html.RenderPartial("~/Views/Shared/Navigator/RenderCarriers.ascx", Model.Carriers); %>
        </div>
    </div>
    <div style="display: none">
        <div id="ManufacturerPopup" style="width: 850px">
            <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                <img src="../../Content/img/Downloads/close_btn.gif" /></a>
            <%Html.RenderPartial("~/Views/Shared/Navigator/RenderManufacturers.ascx", Model.Manufacturers); %>
        </div>
    </div>
    <div style="display: none">
        <div id="BrandPopup" style="width: 850px">
            <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                <img src="../../Content/img/Downloads/close_btn.gif" /></a>
            <%Html.RenderPartial("~/Views/Shared/Navigator/RenderBrands.ascx", Model.BrandNames); %>
        </div>
    </div>
    <div style="display: none">
        <div id="ProductCatPopup" style="width: 850px">
            <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                <img src="../../Content/img/Downloads/close_btn.gif" /></a>
            <%Html.RenderPartial("~/Views/Shared/Navigator/RenderProductCategories.ascx", Model.ProductCategories); %>
        </div>
    </div>
</div>
<link href="<%VirtualPathUtility.ToAbsolute("~/Content/CSS/jquery.fancybox-1.3.4.css")%>" rel="stylesheet" type="text/css" />
<script src="<%
              VirtualPathUtility.ToAbsolute("~/Content/Scripts/jquery.fancybox-1.3.4.pack.js"); %>" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("a#inline").fancybox({
            'width': '400px',
            'height': '40%',
            'autoScale': true,
            'scrolling': 'no',
            'titleShow': true
        });
    });
</script>
