<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Aktel.Mvc.Models.CartViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />
    <script src="../../Content/Scripts/jquery.js" type="text/javascript"></script>
    <script src="../../Content/Scripts/jquery-ui.js" type="text/javascript"></script>
</head>
<body class="main_bg">
    <div class="content">
        <div id="Header" style="">
            <%Html.RenderPartial("~/Views/Shared/Header.ascx", Model.HeaderandFooter); %>
        </div>        
        <div id="BreadCrumb">
            <%Html.RenderPartial("~/Views/Filter/breadcrumb.ascx", Model.Breadcrumb); %>
        </div>

        <div id="productListingMain" class="content_title" style="margin: 3px 5px;">
            <div id="productListing" style="display: inline; float: left; width: 75%; margin: 10px 0px 10px 20px;
                min-height: 300px;">
                <span class="content_title_sidebar_filter">Your ShoppingCart. Checkout or Continue Shopping
                </span>
                <%if(Model.Cart.Items.Count > 0) Html.RenderPartial("RenderCartItems", Model.Cart.Items);%>
            </div>
            <div id="CartSummary">
                <div id="CartSummaryBar" style="display: inline; float: right; border: 1px solid #A3A3A3;
                    margin-top: 15px; padding: 3px; background-color: #F3F3F3; width: 205px;">
                    <span class="content_title_sidebar_filter">CartSumary</span>
                    <div style="list-style: none; font-size: 11pt; color: #737373">
                        <div id="viewCart" href="#InlineCart" style="margin: 7px;">
                            <span>View Cart</span>
                            
                        </div>
                        
                    </div>
                </div>
                <div id="QuickContact" style="display: inline; float: right; border: 1px solid #A3A3A3;
                    margin-top: 15px; padding: 3px; background-color: #F3F3F3; width: 170px;">
                    <span class="content_title_sidebar_filter">Quick Contact</span>
                    <div style="list-style: none; font-size: 11pt; color: #737373">
                        <span style="margin: 7px;">Send An Email</span><br />
                        <span style="margin: 7px;">Or Call @405-808-3893</span><br />
                    </div>
                </div>
                <div id="QuickLinks" style="display: inline; float: right; border: 1px solid #A3A3A3;
                    margin-top: 15px; padding: 3px; background-color: #F3F3F3; width: 170px;">
                    <span class="content_title_sidebar_filter">Browse By Latest</span>
                    <div style="list-style: none; font-size: 11pt; color: #737373">
                        <span style="margin: 7px;">Latest Product Category</span><br />
                        <span style="margin: 7px;">Latest Phone</span><br />
                        <span style="margin: 7px;">Hot Sellers</span><br />
                    </div>
                </div>
            </div>
            <div class="clearer">
                &nbsp;</div>
        </div>
    </div>
</body>
</html>
