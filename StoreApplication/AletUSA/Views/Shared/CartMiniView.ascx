<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.CartViewModel>" %>
<div id="InlineCart" style="display: block; float: right; width: 320px; border: 1px shadow gray;
    background-color: #F3F3F3; z-index: 100; position: absolute; margin-left: -180px; padding:5px;">
    <span class="content_title_sidebar_filter">Cart &rsaquo;</span>
    <%if (Model.Cart.Items.Count > 0)
      {
          foreach (var item in Model.Cart.Items)
          { %>
    <div class="revealItem" style="border-bottom: 1px dashed gray; color: #880000; padding-bottom: 2px;margin-bottom:3px;
        overflow: hidden">
        <div class="column1" style="float: left; width: 70px; height: 70px; display: inline;">
            <div class="productImage">
                <a href="#">
                    <img src="../../../../Content/img/Products/Products/BLKBRY8300LION.jpg" alt=""
                        width="70" height="70/">
                </a>
            </div>
        </div>
        <div class="column2" style="float: left; width: 185px; margin-left: 13px; display: inline;">
            <div class="productName">
                <a href="#"><span style="color: #666666; font-size: 9pt; font-weight: bold; line-height: 17px;">
                    <%=Html.Encode(item.Product.Name)%></span> </a>
            </div>
            <div class="priceDiv">
                <span class="priceBlock"><span class="ourPrice"><span class="price">SubTotal:
                    <%=item.Subtotal.ToString("c")%></span> </span></span>
            </div>
        </div>
        <div class="column3" style="float: right; min-width: 30px; display: inline;">
            <div class="quantity" style="text-align: right; font-size: 11pt">
                <p>
                    Qty:
                    <%=item.Qty%></p>
            </div>
        </div>
    </div>
    <%}%>
    <div id="displayTotal" style="margin: 7px; display: block; clear: both; color: #CC0000;
        font-weight: bold; font-size: 13pt; text-align: center">
        <div class="priceDiv">
            <span class="priceBlock"><span class="ourPrice"><span class="price">Total Price:
                <%=Html.Encode(Model.Cart.GetTotalPrice().ToString("c"))%></span> </span></span>
        </div>
        <div id="buttons" style="margin-top:5px">
            <a href="/Cart/ViewCart"><img src="../../Content/img/Downloads/viewcart.png"/></a>
            <a href="#"><img src="../../Content/img/Downloads/Checkout.png"/></a>
        </div>
    </div>
    <%}
      else
      {%>
    <div style="font-size: 9pt; margin: 5px 6px; clear:both">
        <div style="border-bottom: 1px dashed gray; padding-bottom: 2px">
            <span style="color: #666666">Empty</span><br />
        </div>
    </div>
    <%}%>
</div>
