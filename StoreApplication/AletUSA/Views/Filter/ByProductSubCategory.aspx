<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Aktel.Mvc.Models.FacetViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Index1</title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />
    <link href="../../Content/CSS/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    <script src="../../Content/Scripts/jquery.fancybox-1.3.4.pack.js" type="text/javascript"></script>
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
                            <ul class="tabbed">
                                <li><a style="text-decoration: none">You are here </a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li class="current_page_item"><a href="/HomePage">Home</a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li><a href="/Filter/ByProductCategory/<%=Model.CategoryName%>">Product Category:
                                    <%=Model.CategoryName%></a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li><a href="/Filter/ByProductCategory/<%=Model.CategoryName%>/ByProductSubCategory/<%=Model.Name%>">
                                    Sub Category:
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
                    <div class="content_title_sidebar_filter_box"><span class="content_title_sidebar_filter">Categories:</span></div>
                    <div class="content_content_sidebar" style="text-transform: capitalize">
                        <%foreach (var productCategory in Model.ProductCategories)
                          {%>
                        <a href="/Filter/ByProductCategory/<%=Model.CategoryName %>/ByProductSubCategory/<%=Model.Name %>?category=<%=productCategory.Name%>">
                            &#187; <%=productCategory.Name%></a>
                        <br />
                        <%}%>
                    </div>
                </div>
                <%}%>
                <% if (Model.BrandNames.Count > 0)
                   {%>
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box"><span class="content_title_sidebar_filter">Brand Names</span></div>
                    <div class="content_content_sidebar" style="text-transform: capitalize">
                        <%foreach (var brand in Model.BrandNames)
                          {%>
                        <a href="/Filter/ByProductCategory/<%=Model.CategoryName %>/ByProductSubCategory/<%=Model.Name %>?brand=<%=brand.Name%>">
                            &#187; <%=brand.Name%></a>
                        <br />
                        <%}%>
                    </div>
                </div>
                <% if (Model.Manufacturers.Count > 0)
                   {%>
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box"><span class="content_title_sidebar_filter">Manufacturers</span></div>
                    <div class="content_content_sidebar">
                        <%
                       foreach (var manufacturer in Model.Manufacturers)
                       {%>
                        <a href="/Filter/ByProductCategory/<%=Model.CategoryName %>/ByProductSubCategory/<%=Model.Name %>?manufacturer=<%=manufacturer.Name%>">
                            &#187; <%=manufacturer.Name%></a>
                        <br />
                        <%
                       }%>
                    </div>
                </div>
                <%}%>
                <%}%>
                <% if (Model.AssociatedDevices.Count > 0)
                   {%>
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box"><span class="content_title_sidebar_filter">Cellphone Devices</span></div>
                    <div class="content_content_sidebar">
                        <%
                       foreach (var device in Model.AssociatedDevices)
                       {%>
                        <a href="/Filter/ByProductCategory/<%=Model.CategoryName %>/ByProductSubCategory/<%=Model.Name %>?device=<%=device.Name%>">
                            &#187; <%=device.Name%></a>
                        <br />
                        <%
                       }%>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <div id="productsByAllFilters" style="padding: 3px 5px 10px 5px;">
            <span class="content_title"><span class="content_title_sidebar_filter">All Products
                for Sub-Category &rsaquo;
                <%= Html.Encode(Model.Name) %>
                <%= Model.FilterName %>
            </span>
                <%Html.RenderPartial("RenderProduct", Model.GetAllProducts());%>
            </span>
        </div>
    </div>
</body>
</html>
