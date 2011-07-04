<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Aktel.Mvc.Models.HomePageViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Index1</title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />
    <script src="../../Content/Scripts/jquery.js" type="text/javascript"></script>
    <script src="../../Content/Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../../Content/CSS/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    <script src="../../Content/Scripts/jquery.fancybox-1.3.4.pack.js" type="text/javascript"></script>
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
<script type="text/javascript">
    $(document).ready(function () {
        $("a#dropDown").hover(function () {
            $("#dropDowns").show();
        }, function () {
            $("#dropDowns").hide();
        });
    });
</script>  
</head>
<body class="main_bg">
    <div class="content" style="background-image: url(../Content/img/background_content1.png);
        background-repeat: repeat-x; background-position: bottom; border: 1px solid black;
        background-color: white; min-height: 650px">
        <div id="Header" style="">
            <%Html.RenderPartial("~/Views/Shared/Header.ascx", Model.HeaderandFooter); %>
        </div>
        <div>
            <div id="sidebar" style="margin: 0 5px 2px 5px; display: block; float: left; width: 22%;
                background-color: #F3F3F3;">
                <div>
                    <div id="sidebar_content" class="sidebar_content_content">
                        <div class="sidebar_content_title">
                            <span>Shop</span></div>
                        <div style="margin-bottom: 2px; color: #666; font-size: 12px; font-weight: bold;">
                            <ul style="list-style: none;">
                                <li><a id="inline" href="#CarrierPopup" title="Select a Carrier" style="font-size: 12pt;
                                    color: gray; text-decoration: none;">Carriers</a></li>
                                <li><a id="inline" href="#ManufacturerPopup" title="Select a Manufacturer" style="font-size: 12pt;
                                    color: gray; text-decoration: none">Manufactuers</a></li>
                                <li><a id="inline" href="#BrandPopup" title="Select a Brand" style="font-size: 12pt;
                                    color: gray; text-decoration: none">Brands</a></li>
                                <li><a id="inline" href="#ProductCatPopup" title="Select a Product Category" style="font-size: 12pt;
                                    color: gray; text-decoration: none">Product Categories</a></li>
                            </ul>
                            <div id="Popups">
                                <div style="display: none">
                                    <div id="CarrierPopup" style="width: 850px">
                                        <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                                            <img src="../../Content/img/Downloads/close_btn.gif" /></a>
                                        <%Html.RenderPartial("~/Views/Shared/Navigator/RenderCarriers.ascx", Model.HeaderandFooter.Carriers); %>
                                    </div>
                                </div>
                                <div style="display: none">
                                    <div id="ManufacturerPopup" style="width: 850px">
                                        <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                                            <img src="../../Content/img/Downloads/close_btn.gif" /></a>
                                        <%Html.RenderPartial("~/Views/Shared/Navigator/RenderManufacturers.ascx", Model.HeaderandFooter.Manufacturers); %>
                                    </div>
                                </div>
                                <div style="display: none">
                                    <div id="BrandPopup" style="width: 850px">
                                        <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                                            <img src="../../Content/img/Downloads/close_btn.gif" /></a>
                                        <%Html.RenderPartial("~/Views/Shared/Navigator/RenderBrands.ascx", Model.HeaderandFooter.BrandNames); %>
                                    </div>
                                </div>
                                <div style="display: none">
                                    <div id="ProductCatPopup" style="width: 850px">
                                        <a onclick="$.fancybox.close();" href="#" style="display: inline; float: right">
                                            <img src="../../Content/img/Downloads/close_btn.gif" /></a>
                                        <%Html.RenderPartial("~/Views/Shared/Navigator/RenderProductCategories.ascx", Model.HeaderandFooter.ProductCategories); %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-top: 4px;">
                    </div>
                    <div id="Div2" class="sidebar_content_content">
                        <div class="sidebar_content_title">
                            <span>Explore</span></div>
                        <div style="margin-bottom: 2px; color: #666; font-size: 12px; font-weight: bold;">
                            <ul style="list-style: none;">
                                <li><a id="A1" href="#" style="font-size: 12pt; color: gray; text-decoration: none">
                                    Contact Us</a></li>
                                <li><a id="A2" href="#" style="font-size: 12pt; color: gray; text-decoration: none">
                                    About Us</a></li>
                            </ul>
                        </div>
                        <div class="clearer">
                            &nbsp;</div>
                    </div>
                    <div style="padding-top: 4px;">
                    </div>
                    <div id="Div3" class="sidebar_content_content">
                        <span class="sidebar_content_title">Click and Save</span>
                        <div style="min-height: 100px">
                        </div>
                    </div>
                </div>
            </div>
            <%--<div style="height:400px; border:1px solid grey; width:0.1%; display:inline; float:left;"></div>--%>
            <div id="productsByAllFilters" class="main_content_title" style="display: inline;
                float: left; width: 74%;">
                <div id="latest_window_models" class="main_page_content_content">
                    <span class="main_page_content_title">Shop Accessories for the Latest Models</span>
                    <div style="min-height: 100px">
                    </div>
                </div>
                <div style="padding-top: 4px;">
                </div>
                <div id="latest_window_products" class="main_page_content_content">
                    <span class="main_page_content_title">Shop By Latest Products</span>
                    <div style="min-height: 100px;">
                    </div>
                </div>
                <div style="padding-top: 4px;">
                </div>
                <div id="latest_window_featured_products" class="main_page_content_content">
                    <span class="main_page_content_title">Shop By Featured Products</span>
                    <div style="min-height: 100px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="Footer" style="padding: 20px 0px 0px 50px; float: left; display: inline;">
    </div>
</body>
</html>
