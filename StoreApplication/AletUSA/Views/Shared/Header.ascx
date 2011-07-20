<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.HeaderAndFooterViewModel>" %>
<div id="header_bar">
    <div id="logo" style="margin: 15px 10px 10px 30px; float: left; display: inline;">
        <a href="/HomePage">
            <img src="<%=Html.Encode(VirtualPathUtility.ToAbsolute("~/Content/img/AktelLogo/Aktel_logo2.gif"))%>"
                width="200px" height="60px" alt="Twister Wireless" title="Twister Wireless" />
        </a>
    </div>
    <div id="Company_Name" >
        <span style="font-size: 24pt; width: 100px; color: #E93A35">Twister Wireless. <span>
            Cellular Accessories Provider. </span></span>
    </div>
    <div id="Search_box" style="width:30%">
        <%Html.RenderPartial("Search", Model.SearchModel); %>
    </div>
</div>
<div id="dockToPopups" style="height: 40px; background-color: #999999; margin: 5px 10px 5px 10px;">
    <ul style="list-style: none; float: left; font-family: 'Arial', 'Helvetica', 'Verdana', 'sans-serif';
        font-size: 10px; padding: 6px 20px; height: 15px;">
        <li style="float: left; padding-right: 48px; font-size: 14pt; color: white; text-decoration: none">
            View Accessories By: </li>
        <li style="float: left; padding-right: 28px;"><a id="dropDown" href="#Carrier" title="Select a Carrier"
            style="font-size: 14pt; color: white; text-decoration: none">Carriers</a>
            <div id="dropDowns" style="display: none;">
                <div id='Carrier' class='drop'>
                    Test C
                </div>
            </div>
        </li>
        <li style="float: left; padding-right: 28px"><a id="dropDown" href="#Manufacturer"
            title="Select a Manufacturer" style="font-size: 14pt; color: white; text-decoration: none">
            Manufactuers</a>
            <div id="dropDowns" style="display: none;">
                <div id='Manufacturer' class='drop'>
                    Test M
                </div>
            </div>
        </li>
        <li style="float: left; padding-right: 28px"><a id="dropDown" href="#Brand" title="Select a Brand"
            style="font-size: 14pt; color: white; text-decoration: none">Brands</a>
            <div id="dropDowns" style="display: none;">
                <div id='Brand' class='drop'>
                    Test B
                </div>
            </div>
        </li>
        <li style="float: left; padding-right: 28px"><a id="dropDown" href="#ProductCat"
            title="Select a Product Category" style="font-size: 14pt; color: white; text-decoration: none">
            Product Categories</a>
            <div id="dropDowns" style="display: none;">
                <div id='ProductCat' class='drop'>
                    Test P
                </div>
            </div>
        </li>
    </ul>
</div>
