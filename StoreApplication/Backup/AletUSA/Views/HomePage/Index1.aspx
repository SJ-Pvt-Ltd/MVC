<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Aktel.Domain" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Index1</title>
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/NavigationBar.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/CSS/jquery-ui-1.7.3.custom.css" />

    <script src="../../Content/Scripts/jquery.js" type="text/javascript"></script>

    <script src="../../Content/Scripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            $("#NavigateTO").tabs({
                selected: 0
            });
        });
    </script>

</head>
<body>
    <div class="content" style="margin: 40px 150px 0px 150px; height: 550px; background-color: #E6E6AF">
        <div id="Header" style="background-color: #E6E6AF">
            <div style="height: 100px;">
            </div>
        </div>
        <div id="Content_Filterer" style="margin: 10px 30px 10px 30px">
            <div id="NavigateTO" style="">
                <ul>
                    <li><a href="#Carriers">Carriers</a></li>
                    <li><a href="#Manufacturers">Manufactuers</a></li>
                    <li><a href="#Brands">Brands</a></li>
                </ul>
                <div id="Carriers">
                    <%Html.RenderPartial("RenderCarriers", ViewData["Carriers"]); %></div>
                <div id="Manufacturers">
                    <%Html.RenderPartial("RenderManufacturers", ViewData["Manufacturers"]); %></div>
                <div id="Brands">
                    TODO
                </div>
            </div>
        </div>
        <div id="Footer" style="padding: 20px 0px 0px 50px; float: left; display:inline;">
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
    </div>
</body>
</html>
