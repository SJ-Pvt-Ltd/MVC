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
</head>
<body class="main_bg">
    <div class="content" style="background-image: url(../Content/img/background_content.png);
        background-repeat: repeat-x; background-position: bottom; border: 1px solid black;
        background-color: white; min-height: 650px">
        <div id="Header" style="">
            <%Html.RenderPartial("~/Views/Shared/Header.ascx", Model.HeaderandFooter); %>
        </div>
        <div>
            <div id="sidebar" style="border: 1px solid black; margin: 0 5px 2px 5px; display: inline;
                float: left; width: 22%; height: 500px">
            </div>
            <div id="Main_Content_window" style="border: 1px solid black; margin: 0 5px 2px 2px;
                display: inline; float: left; width: 75%; height: 100%">
                <div id="Content_Filterer" style="margin: 10px 30px 0px 30px; background-color: #E6E6AF;
                    background: white;">
                    <div id="Tab_title" class="content_title_sidebar_filter" style="font-size: 14pt;
                        color: #fff; border-right: 1px solid #669; border-left: 1px solid #669; background-image: url('../Content/img/nav_bar.gif');
                        background-color: White;">
                        <span style="padding-left: 30px">Shop Accessories by:</span></div>
                </div>
            </div>
        </div>
    </div>
    <div id="Footer" style="padding: 20px 0px 0px 50px; float: left; display: inline;">
        <div>
            <img src="../../Content/img/Downloads/bottombarknobgray.png" height="19px" />
            <span style="font-size: 20px">Feedback</span>
        </div>
        <div>
            <img src="../../Content/img/Downloads/bottombarknobgray.png" height="19px" />
            <span style="font-size: 20px">Contact Us</span>
        </div>
        <div>
            <img src="../../Content/img/Downloads/bottombarknobgray.png" height="19px" />
            <span style="font-size: 20px">Updates</span>
        </div>
    </div>
</body>
</html>
