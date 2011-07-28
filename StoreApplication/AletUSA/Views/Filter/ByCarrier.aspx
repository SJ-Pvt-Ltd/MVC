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
    <link href="../../Content/CSS/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    <script src="../../Content/Scripts/jquery.fancybox-1.3.4.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#NavigateTO").tabs({collapsible: true, active:false});
        });
    </script>
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
                                <li><a href="/Filter/ByCarrier/<%=Model.Name%>">Carrier:
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
                <div class="content_title_sidebar">
                    <div class="content_title_sidebar_filter_box"><span class="content_title_sidebar_filter">Browse By Carriers</span></div>
                    <div class="content_content_sidebar">
                        <%
                            foreach (var carrier in Model.filterListings.Carriers)
                            {%>
                        <a href="/Filter/ByCarrier/<%=carrier.Name %>">&#187;
                            <%=carrier.Name%></a>
                        <br />
                        <%
                            }%>
                    </div>
                </div>
            </div>
        </div>
        <div id="productsByAllFilters">
            <span class="content_title"><span class="content_title_sidebar_filter">Carrier &rsaquo;
                <%= Html.Encode(Model.Name) %>
            </span>
                <% Html.RenderPartial("RenderDevices", Model.filterListings.AssociatedDevices);   %>
            </span>
        </div>
    </div>
</body>
</html>
