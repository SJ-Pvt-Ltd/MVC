<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<Aktel.Domain.Carrier>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AktelUSA - Product by
        <%=Model.Name%></title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="header-wrapper">
            <div id="header-wrapper-2">
                <div class="center-wrapper">
                    <div id="header">
                        <div id="logo">
                            <h1 id="site-title">
                                <a href="#">Aktel <span>USA</span></a></h1>
                            <h2 id="site-slogan">
                                Accessories for Wireless</h2>
                        </div>
                        <div id="help-wrapper">
                            <div id="help">
                                <a href="#">Contact us</a> <span class="text-separator">|</span> <a href="#">F.A.Q</a>
                                <span class="text-separator">|</span> <a href="#">Sitemap</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="navigation-wrapper">
            <div id="navigation-wrapper-2">
                <div class="center-wrapper">
                    <div id="navigation">
                        <ul class="tabbed">
                            <li><a href="/HomePage">Home</a></li>
                            <li><a href="#">New Arrivals</a></li>
                            <li><a href="#">Comming Soon</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Register/Sign On</a></li>
                        </ul>
                        <div class="clearer">
                            &nbsp;</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="content-wrapper">
            <div class="center-wrapper">
                <div class="content">
                    <div class="content" id="content-two-columns">
                        <div id="main-wrapper">
                            <div style="padding: 12px 10px 10px 10px;">
                                <p class="content_title"> Products Manufactuered By : <%= Html.Encode(Model.Name) %> </p>
                                <% Html.RenderPartial("RenderDevices", Model.GetAllAssociatedPhoneDevices());   %>
                            </div>
                        </div>
                        <div id="sidebar-wrapper">
                            <div id="sidebar">
                                <% 
                                    //Html.RenderPartial("FilterCategories", Model.GetProductTypes()); %>
                            </div>
                        </div>
                        <div class="clearer">
                            &nbsp;</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer-wrapper">
            <div class="center-wrapper">
                <div id="footer">
                    <div class="left">
                        <a href="#">Home</a> <span class="text-separator">|</span> <a href="product_details.html">
                            Product Details</a> <span class="text-separator">|</span> <a href="blog_post.html">Blog
                                Post</a> <span class="text-separator">|</span> <a href="archives.html">Archives</a>
                        <span class="text-separator">|</span> <a href="style_demo.html">Style Demo</a> <span
                            class="text-separator">|</span> <a href="empty_page.html">Empty Page</a>
                    </div>
                    <div class="right">
                        <a href="#">Top ^</a>
                    </div>
                    <div class="clearer">
                        &nbsp;</div>
                </div>
            </div>
        </div>
        <div id="bottom">
            <div class="center-wrapper">
                <div class="left">
                    &copy; 2011 AktelUSA.com - Wireless Accessories Provider <span class="text-separator">
                        |</span> <a href="#">Privacy Policy</a> <span class="text-separator">|</span>
                    <a href="#">Terms of Use</a>
                </div>
                <div class="right">
                    <a href="#">Website designed</a> by <a href="#">Sourabh Joshi</a>
                </div>
                <div class="clearer">
                    &nbsp;</div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
