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
                            <ul id="breadcrumb" class="tabbed" style="text-transform: capitalize;">
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
        <%--<div id="filter_categories">
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
        </div>--%>
        <div>
            <div id="filters">
                <div id="filterByModel" style="height: 100px; border: 1px dashed gray; background-color: White;
                    margin: 3px 5px 3px 5px;">
                    <div style="padding:3px;">
                        <%using (Html.BeginForm("ByManufacturer", "Filter"))
                          {%>
                        <%if (Model.AssociatedDevices.Count > 0)
                          { %>
                            <span> <span style="font-size:14pt;">Select a Model</span>
                                <select id="DeviceFilter" name="device" style="border:1px dashed #A3A3A3; background-color:#F3F3F3;">
                                    <%foreach (var device in Model.AssociatedDevices)
                                      {%>
                                    <option value="<%=device.Name%>">
                                        <%=Html.Encode(device.Name) %></option>
                                    <%}%>
                                </select>
                                <input id="FilterDevice" type="submit" value="Filter By Device" style="font-size: 9pt;
                            cursor: pointer; width: 65px; height: 20px; color: #A9373A; display:none" />
                            </span>
                        <%}
                      }%>
                    </div>
                </div>
            </div>
            <div id="productsByAllFilters" class="content_title" style="margin: 3px 5px 10px 5px;">
                <div id="productListing" style="display: inline; float: left; width: 75%">
                    <span class="content_title_sidebar_filter">Products Manufactuered By &rsaquo;
                        <%= Html.Encode(Model.Name) %>
                        <%= Model.FilterName %>
                    </span>
                    <%Html.RenderPartial("RenderProduct", Model.GetAllProducts());%>
                </div>
                <div id="InlineCart" style="display: inline; float: left; width: 24%; border: 1px solid gray;
                    padding: 3px; background-color: #F3F3F3">
                    <span class="content_title_sidebar_filter">Cart &rsaquo;</span>
                    <%if (Model.cart.Cart.Items.Count > 0)
                      { %>
                    <div style="font-size: 9pt; margin: 5px 6px;">
                        <div style="border-bottom: 1px dashed gray; padding-bottom: 2px">
                            <%foreach (var item in Model.cart.Cart.Items)
                              { %>
                            <div id="cartItem" style="border-bottom: 1px dashed gray">
                                <span style="color: #666666">
                                    <%=Html.Encode(item.Product.Name)%></span><br />
                                <span style="color: #A9373A;">Qty Added :
                                    <%=item.Qty%></span><br />
                                <span style="color: #A9373A;">SubTotal:
                                    <%=item.Subtotal%></span><br />
                            </div>
                            <%}%>
                        </div>
                        <div id="displayTotal" style="margin: 3px">
                            <span style="color: #A9373A; font-size: 11pt;">Total Price:
                                <%=Html.Encode(Model.cart.Cart.GetTotalPrice()) %></span>
                        </div>
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

<script type="text/javascript">
    $(document).ready(function () {
        $("#DeviceFilter").change(function () {
            $("#FilterDevice").click();
        });
    });

</script>
