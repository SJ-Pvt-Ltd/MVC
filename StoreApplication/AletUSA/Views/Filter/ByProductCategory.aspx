<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Aktel.Mvc.Models.FacetViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Index1</title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />
    <script src="../../Content/Scripts/jquery.js" type="text/javascript"></script>
    <script src="../../Content/Scripts/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#NavigateTO").tabs({
                selected: 0
            });
        });
    </script>
</head>
<body class="main_bg">
    <div class="content">
        <div id="Header" style="">
            <%Html.RenderPartial("~/Views/Shared/Header.ascx", Model.HeaderandFooter); %>
        </div>
        <div id="nav_bar" >
            <div id="navigation-wrapper">
                <div id="navigation-wrapper-2">
                    <div class="center-wrapper">
                        <div id="navigation">
                            <ul class="tabbed">
                                <li><a style="text-decoration: none">You are here </a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li class="current_page_item"><a href="/HomePage">Home</a></li>
                                <li><a>&rsaquo;&rsaquo;</a></li>
                                <li><a href="/Filter/ByProductCategory/<%=Model.Name%>">Product Category:
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
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box"><span class="content_title_sidebar_filter">All Product Categories</span></div>
                    <div class="content_content_sidebar">
                        <%
                            foreach (var category in Model.ProductCategories)
                            {%>
                        <a href="/Filter/ByProductCategory/<%=category.Name %>">
                            &#187; <%=category.Name%></a>
                        <br />
                        <%
                       }%>
                    </div>
                </div>
            </div>
        </div>
        <div id="productsByAllFilters" style="padding: 3px 5px 10px 5px;">
            <span class="content_title"><span class="content_title_sidebar_filter">All Products
                Categories for &rsaquo;
                <%= Html.Encode(Model.Name) %>
            </span>
                <% Html.RenderPartial("RenderSubCategories", Model.SubCategoryViewModel.ProductSubCategories);   %>
            </span>
        </div>
    </div>
</body>
</html>
