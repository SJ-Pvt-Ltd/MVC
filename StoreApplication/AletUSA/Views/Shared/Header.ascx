<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.HeaderAndFooterViewModel>" %>
<div id="header_bar">
    <div id="logo" style="margin: 15px 10px 10px 30px; float: left; display: inline;">
        <a href="/HomePage">
            <img src="<%=Html.Encode(VirtualPathUtility.ToAbsolute("~/Content/img/AktelLogo/Aktel_logo2.gif"))%>"
                width="200px" height="60px" alt="Twister Wireless" title="Twister Wireless" />
        </a>
    </div>
    <div id="Company_Name">
        <span style="font-size: 24pt; width: 100px; color: #E93A35">Twister Wireless. <span>
            Cellular Accessories Provider. </span></span>
    </div>
    <div id="Search_box" style="width: 30%">
        <%Html.RenderPartial("Search", Model.SearchModel); %>
    </div>
</div>
<div id="dockToPopups" style="height: 40px; background-color: #999999; margin: 5px 10px 5px 10px;">
    <ul style="list-style: none; float: left; font-family: 'Arial', 'Helvetica', 'Verdana', 'sans-serif';
        font-size: 10px; padding: 6px 20px; height: 15px;">
        <li style="float: left; padding-right: 48px; font-size: 14pt; color: white; text-decoration: none">
            View Accessories By: </li>
        <li  style="float: left; padding-right: 28px;">
            <div id="dropDownCarrier" href="#Carrier">
                <a title="Select a Carrier" style="font-size: 14pt; color: white; text-decoration: none">
                    Carriers</a>
                <div id='Carrier' style="display: none;">
                        <%Html.RenderPartial("~/Views/Shared/HeaderNavigation/Carriers.ascx", Model.Carriers); %>                    
                </div>
            </div>
        </li>
        <li style="float: left; padding-right: 28px">
            <div id="dropDownManufacturer" href="#Manufacturer">
                <a title="Select a Manufacturer" style="font-size: 14pt; color: white; text-decoration: none">
                    Manufactuers</a>
                <div id='Manufacturer'  style="display: none;">                   
                        <%Html.RenderPartial("~/Views/Shared/HeaderNavigation/Manufacturers.ascx", Model.Manufacturers); %>                    
                </div>
            </div>
        </li>
        <li style="float: left; padding-right: 28px">
            <div id="dropDownBrand" href="#Brand">
                <a title="Select a Brand" style="font-size: 14pt; color: white; text-decoration: none">
                    Brands</a>
                <div id='Brand' style="display: none;margin-left:-100px;">                    
                       <%Html.RenderPartial("~/Views/Shared/HeaderNavigation/Brands.ascx", Model.BrandNames); %>                    
                </div>
            </div>
        </li>
        <li style="float: left; padding-right: 28px">
            <div id="dropDownCategory" href="#Category">
                <a title="Select a Product Category" style="font-size: 14pt; color: white; text-decoration: none">
                    Product Categories</a>
                <div id='Category' style="display: none;margin-left:0px;">
                       <%Html.RenderPartial("~/Views/Shared/HeaderNavigation/ProductCategories.ascx", Model.ProductCategories); %>
                    </div>
            </div>
        </li>
    </ul>
</div>
