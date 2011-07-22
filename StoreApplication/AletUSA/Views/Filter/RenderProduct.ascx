<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.Product>>" %>
<div class="content_content" style="min-height: 448px; margin-left: auto; margin-right: auto;
    width: 100%">
    <% foreach (var item in Model)
       { %>
    <div id="Products_display_pannel" class="Product_Category" style="">
        <div id="product_display_box" href="#" style="width: 97%; height: 110px; float: left;
            display: block; border: 1px solid #E4E4E4; margin: 3px;">
            <div id="product_image" style="float: left; width: 20%; display: inline;">
                <img src="../../../../Content/img/Products/Products/BLKBRY8300LION.jpg" style="height: 100px;
                    margin-left: auto; margin-right: auto;" />
            </div>
            <div id="product_summary" style="overflow: hidden; margin: 8px 4px; padding-bottom: 8px;
                font-size: 9pt; float: left; display: inline; width: 55%">
                <div id="product_name" style="display: inline; float: left;">
                    <a href="#" style="text-decoration: none">
                        <%=Html.Encode(item.Name)%>
                    </a>
                </div>
                <div id="product_add_cart_link" style="margin: 4px 12px; padding: 1px; background-color: #F3F3F3;
                    color: #A9373A; display: inline; float: left;">
                    <% using (Html.BeginForm("AddToCart", "Cart", new { Id = item.Id }, FormMethod.Post))
                       {%>
                    <div id="product_qty_to_add" style="font-size: 10pt; margin: 5px; display: inline;
                        float: left">
                        Qty  <span style="padding-left: 2px; height:20px; "><%=Html.TextBox("qty", 0, new { @maxlength = "4", @style = "border:1px solid gray; text-align:center;width:40px" })%></span>
                    </div>
                    <div id="<%=item.Id%>" style="display: inline; float: left; margin: 5px 2px;">
                        <input id="AddTOCart_submit_<%=item.Id%>" type="submit" value="Add to Cart" style="font-size: 9pt;
                            cursor: pointer; width: 65px; height: 20px; color: #A9373A;" />
                    </div>
                    <%} %>
                </div>
            </div>
            <div id="product_details">
                <div id="product_price" style="font-size: 11pt; margin: 3px; color: #A9373A;">
                    <span>Price: $19.99</span>
                </div>
                <div id="product_availability" style="font-size: 10pt; margin: 5px;">
                    <span>status: Available</span>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div> 
