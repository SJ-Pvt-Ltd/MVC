﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.Product>>" %>
<% foreach (var item in Model)
   { %>
<div style="background-color: white; display: block; float: left; font-size: 10pt;
    padding-left: 25px; border-bottom: 1px solid #C3C3C3">
    <div style="text-align: center; width: 120px; padding: 15px 0; vertical-align: top;
        float: left; display: inline">
        <span style="display: block; position: relative; height: 100px; width: 81px;"><a
            href="#">
            <img src="../../../../Content/img/Products/Products/BLKBRY8300LION.jpg" style="height: 100px;
                margin-left: auto; margin-right: auto;" />
        </a></span>
    </div>
    <div style="padding: 15px 0; vertical-align: top; float: left; display: inline; margin-right: 15px;
        width: 250px; font-size: 9pt;">
        <p style="margin: 0; padding: 0; color: #333;">
            <a href="#">
                <%=Html.Encode(item.Name)%></a>
        </p>
    </div>
    <div style="padding: 15px 0; vertical-align: top; width: 170px; float: left; display: inline">
        <p style="margin: 0; padding: 0; color: #333;">
            List Price: $159.00</p>
        <p style="margin: 0; padding: 0; color: #333; margin: 7px 0; color: #666;">
            item #072-07-0700</p>
        <p style="margin: 7px 0; color: #666;">
            Temporarily Unavailable</p>
    </div>
    <div style="text-align: center; padding: 15px 0; vertical-align: top; font-size: 11px;
        font-family: verdana,arial,helvetica,sans-serif; color: #666; display: inline;
        float: left; width:100px">
        <% using (Html.BeginForm("AddToCart", "Cart", new {item.Id }, FormMethod.Post))
           {%>
            <p style="display: block">
                <span>Enter the Qty</span>
                <span>
                    <%=Html.TextBox("qty", 0, new {@maxlength = "4", @style = "border:1px solid gray; text-align:center;width:40px;"})%>
                </span>
            </p>
            <p style="margin-left: 7px;">
            <input id="AddTOCart_submit_<%=item.Id%>" type="submit" value="" 
                style="cursor: pointer; width: 100px; height: 20px; background-repeat:no-repeat;
                     color: #A9373A;background-color: transparent; float: left;background-image: url(http://g-ecx.images-amazon.com/images/G/16/MOL/backgrounds/btn_addtocart._V156426865_.png);" /></p>
            <%--<a >
                
                <img src="http://ecx.images-amazon.com/images/G/16/MOL/global/spacer" alt="Add to Cart"
                    height="22" width="88"/></a>--%>
        <%}%>
    </div>
</div>
<%} %>