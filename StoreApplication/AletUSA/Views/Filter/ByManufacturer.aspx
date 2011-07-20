<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Aktel.Mvc.Models.FacetViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Index1</title>
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
        <div id="nav_bar">
            <div id="navigation-wrapper">
                <div id="navigation-wrapper-2">
                    <div class="center-wrapper">
                        <div id="navigation">
                            <ul class="tabbed" style="text-transform: capitalize;">
                                <li><a style="text-decoration: none">You are here </a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li class="current_page_item"><a href="/HomePage">Home</a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li><a href="/Filter/ByManufacturer/<%=Model.Name%>">Manufacturer:
                                    <%=Model.Name%></a></li>
                            </ul>
                            <div class="clearer">
                                &nbsp;</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="filter_categories">
            <div class="filter_bar">
                <span class="content_title_sidebar_filter" style="margin-left: 40px; color: #666666">
                    Filter By ..</span>
                <%if (Model.ProductCategories.Count > 0)
                  {%>
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box">
                        <span class="content_title_sidebar_filter">Categories:</span></div>
                    <div class="content_content_sidebar" style="text-transform: capitalize">
                        <%foreach (var productCategory in Model.ProductCategories)
                          {%>
                        <a href="/Filter/ByManufacturer/<%=Model.Name %>?category=<%=productCategory.Name%>">
                            &#187;
                            <%=productCategory.Name%></a>
                        <br />
                        <%}%>
                    </div>
                </div>
                <%}%>
                <% if (Model.BrandNames.Count > 0)
                   {%>
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box">
                        <span class="content_title_sidebar_filter">Brand Names</span></div>
                    <div class="content_content_sidebar" style="text-transform: capitalize">
                        <%foreach (var brand in Model.BrandNames)
                          {%>
                        <a href="/Filter/ByManufacturer/<%=Model.Name %>?brand=<%=brand.Name%>">&#187;
                            <%=brand.Name%></a>
                        <br />
                        <%}%>
                    </div>
                </div>
                <%}%>
                <% if (Model.AssociatedDevices.Count > 0)
                   {%>
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box">
                        <span class="content_title_sidebar_filter">Cellphone Devices</span></div>
                    <div class="content_content_sidebar">
                        <%
                       foreach (var device in Model.AssociatedDevices)
                       {%>
                        <a href="/Filter/ByManufacturer/<%=Model.Name%>?device=<%=device.Name%>">&#187;
                            <%=device.Name%></a>
                        <br />
                        <%
                       }%>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <div id="productsByAllFilters" style="padding: 3px 5px 10px 5px; display: inline">
            <div class="content_title">
                <div id="productListing" style="display: inline; float: left; width: 75%">
                    <span class="content_title_sidebar_filter">Products Manufactuered By &rsaquo;
                        <%= Html.Encode(Model.Name) %>
                        <%= Model.FilterName %>
                    </span>
                    <%Html.RenderPartial("RenderProduct", Model.GetAllProducts());%>
                </div>
                <div id="InlineCart" style="display: inline; float: left; width: 25%">
                    <span class="content_title_sidebar_filter">Cart &rsaquo;</span>
                    <%if (Model.cart.Cart.Items.Count > 0)
                      { %>
                    <div style="font-size: 9pt;">
                        <div>
                            <%foreach (var item in Model.cart.Cart.Items)
                              { %>
                            <div id="cartItem">
                                <span>
                                    <%=Html.Encode(item.Product.Name)%></span><br />
                                <span style="color: #A9373A;">Qty Added :
                                    <%=item.Qty%></span><br />
                                <span style="color: #A9373A;">Cost
                                    <%=item.Subtotal%></span><br />
                            </div>
                            <%}%>
                        </div>
                        <span style="border-bottom: 1px dashed black; width: 100%;"></span>
                    </div>
                    <%} %>
                </div>
                <div class="clearer">
                    &nbsp;</div>
            </div>
        </div>
    </div>
</body>
</html>
