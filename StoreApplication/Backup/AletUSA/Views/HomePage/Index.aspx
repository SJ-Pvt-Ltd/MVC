<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Aktel USA</title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />

    <script src="../../Content/Scripts/jquery.js" type="text/javascript"></script>

    <script src="../../Content/Scripts/jquery-ui.js" type="text/javascript"></script>

    <%--    <script type="text/javascript">
        $(function() {
            $("#sidebar_accordion").accordion({ autoHeight: false, collapsible: true, active: 2 });
        });              
    </script>--%>

    <script type="text/javascript">
        function nav() {
            $('div#nav ul li').mouseover(function() {
                $(this).find('ul:first').show();
            });

            $('div#nav ul li').mouseleave(function() {
                $('div#nav ul li ul').hide();
            });

            $('div#nav ul li ul').mouseleave(function() {
                $('div#nav ul li ul').hide(); ;
            });
        };

        $(document).ready(function() {
            nav();
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="header-wrapper">
            <div id="header-wrapper-2">
                <div class="center-wrapper">
                    <div id="header">
                        <div id="logo">
                            <img src="../../Content/img/AktelLogo/Aktel_logo2.gif" width="300px" height="80px" />
                            <%--<img src="../../Content/img/AktelLogo/Aktel_transparent.gif" width="270px" height="80px" />--%>
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
                            <li class="current_page_item"><a href="/HomePage">Home</a></li>
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
                <div id="nav" class="subnavlists">
                    <ul>
                        <li><a href="#"> Carriers</a>
                            <ul class="submenu">
                                <li>
                                    <%Html.RenderPartial("RenderCarriers", ViewData["Carriers"]); %></li>
                            </ul>
                        </li>
                        <li><a href="#"> Manufacturers</a>
                            <ul class="submenu">
                                <li>
                                    <%Html.RenderPartial("RenderManufacturers", ViewData["Manufacturers"]); %></li>
                            </ul>
                        </li>
                        <li><a href="#"> Brands</a>
                            <ul class="submenu">
                                <li><a href="#">TODO</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="content">
                    <div class="content" id="content-two-columns">
                        <div id="main-wrapper">
                            <div style="padding: 12px 10px 10px 10px;">
                                <p class="content_title">
                                    Shop By Product Categories:</p>
                                <%Html.RenderPartial("RenderProductCategories", ViewData["ProductCategories"]); %>
                            </div>
                            <div style="padding: 2px 10px 10px 12px;">
                                <p class="content_title">
                                    Shop by Latest Products:</p>
                                <div id="New" class="content_content" runat="server">
                                    <div class="Carrier">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="sidebar-wrapper">
                            <div id="sidebar">
                                <%--<div id="sidebar_accordion" style="padding: 12px 10px 10px 10px;">
                                <h3>
                                    <a href="#">Phone Carriers</a></h3>
                                <div class="box" style="background-color: White">
                                    <%Html.RenderPartial("RenderCarriers", ViewData["Carriers"]); %>
                                </div>
                                <h3>
                                    <a href="#">Manufacturers</a></h3>
                                <div class="box" style="background-color: White">
                                    <%Html.RenderPartial("RenderManufacturers", ViewData["Manufacturers"]); %>
                                    <div class='clearer'>
                                        &nbsp;</div>
                                </div>
                            </div>--%>
                                <div class="box">
                                    <div class="box-title">
                                        Register</div>
                                    <div class="box-content">
                                        <p>
                                            <label>
                                                UserName</label><asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine"></asp:TextBox></p>
                                        <p>
                                            <label>
                                                Password</label><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></p>
                                        <p>
                                            <asp:Button ID="Button1" runat="server" Text="Enter" />&nbsp;<asp:Button ID="Button2"
                                                runat="server" Text="Cancel" /></p>
                                    </div>
                                </div>
                                <div class="box">
                                    <div class="box-title">
                                        Search</div>
                                    <div class="box-content">
                                        <p>
                                            <asp:TextBox ID="TextBox3" runat="server" TextMode="SingleLine"></asp:TextBox></p>
                                        <p>
                                            <asp:DropDownList ID="Search_Categories" runat="server">
                                            </asp:DropDownList>
                                        </p>
                                        <p>
                                            <asp:Button ID="Button3" runat="server" Text="Search" />&nbsp;<asp:Button ID="Button4"
                                                runat="server" Text="Cancel" /></p>
                                    </div>
                                </div>
                                <div class="box">
                                    <div class="box-title">
                                        Contact Information</div>
                                    <div class="box-content">
                                        <p>
                                            Jameul Hasnat</p>
                                        <p>
                                            Contact No.: 123-45-6789 Address: 000, abcdfg street, Oklahoma City, Oklahoma -
                                            12345</p>
                                    </div>
                                </div>
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
