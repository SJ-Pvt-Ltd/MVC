<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.FilterListing>" %>
<div style="border: 1px solid gray; background-color: white; margin: 3px 10px; padding: 5px 10px;
    color: #333; font: 11px/14px Verdana,Arial,Helvetica,sans-serif;">
    <%using (Html.BeginForm("ByManufacturer", "Filter"))
      {%>
    <div>
        <span style="position: absolute; left: -2000px; display: block; width: 1px; height: 1px;
            overflow: hidden;">Registry Items</span>
        <div style="padding-left: 25px">
            <%if (Model.AssociatedDevices.Count > 0)
              {%>
            <div style="float: left; text-align: left; display: inline;">
                <label for="position: relative;">
                    Model:</label>
                <select id="filterBydevice" name="device" style="border: 1px dashed #A3A3A3; width: 167px;
                    font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px; margin-top: 3px;
                    color: #333;">
                    <option value="All">All</option>
                    <%foreach (var device in Model.AssociatedDevices)
                      {%>
                    <option value="<%=device.Name%>" 
                            <%if(device.Name == Model.listingOperator.Device){%>
                                selected="selected"
                        <%} %>>
                        <%=Html.Encode(device.Name)%></option>
                    <%}%>
                </select>
            </div>
            <%}%>
            <%if (Model.ProductCategories.Count > 0)
              {%>
            <div style="float: left; text-align: left; display: inline; margin-left: 40px">
                <label for="itemFilterChannel">
                    ProductCategory:</label>
                <select id="filterBycategory" name="category" style="border: 1px dashed #A3A3A3; width: 167px;
                    font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px; margin-top: 3px;
                    color: #333;">
                    <option value="All">All</option>
                    <%foreach (var category in Model.ProductCategories)
                      {%>
                    <option value="<%=category.Name%>" 
                        <%if(category.Name == Model.listingOperator.Category){%>
                            selected="selected"
                        <%}%>>
                        <%=Html.Encode(category.Name)%></option>
                    <%}%>
                </select>
            </div>
            <%}%>
            <%if (Model.BrandNames.Count > 0)
              {%>
            <div style="float: left; text-align: left; display: inline; margin-left: 40px">
                <label for="itemSortOption">
                    Brand Name:</label>
                <select id="filterBybrand" name="brand" size="1">
                    <option value="All">All</option>
                    <%foreach (var brandName in Model.BrandNames)
                      {%>
                    <option value="<%=brandName.Name%>"
                        <%if(brandName.Name == Model.listingOperator.Brand){%>
                            selected="selected"
                        <%}%>>
                        <%=Html.Encode(brandName.Name)%></option>
                    <%}%>
                </select>
            </div>
            <%}%>
            <%if (Model.Manufacturers.Count > 0)
              {%>
            <div style="float: left; text-align: left; display: inline; margin-left: 40px">
                <label for="itemSortOption">
                    Brand Name:</label>
                <select id="filterBymanufacturer" name="manufacturer" size="1">
                    <option value="All">All</option>
                    <%foreach (var manufacturer in Model.Manufacturers)
                      {%>
                    <option value="<%=manufacturer.Name%>"
                        <%if(manufacturer.Name == Model.listingOperator.Manufactuer){%>
                            selected="selected"
                        <%}%>>
                        <%=Html.Encode(manufacturer.Name)%></option>
                    <%}%>
                </select>
            </div>
            <%}%>
        </div>
        <div style="display: block;">
            <%--<div style="float: left; text-align: left; display: inline; margin-left: 40px">
                <label for="itemSortOption">
                    Sort Order:</label>
                <select id="filterBysortOption" name="sort" size="1">
                    <option value="lowToHigh">Price (Low to High)</option>
                    <option value="highToLow">Price (High to Low)</option>
                </select>
            </div>--%>
        </div>
        <div class="clearer">
        </div>
        <input id="Filter" type="submit" value="Filter" style="font-size: 9pt;
            cursor: pointer; width: 65px; height: 20px; color: #A9373A; display: none" />
    </div>
    <%}%>
</div>
<script type="text/javascript">
    //Javascript to click submit button whenever a filter is changed
    $(document).ready(function () {
        $("#filterBydevice").change(function () {
            $("#Filter").click();
        });
        $('#filterBycategory').change(function () {
            $("#Filter").click();
        });
        $('#filterBybrand').change(function () {
            $("#Filter").click();
        });
        $('#filterBymanufacturer').change(function () {
            $("#Filter").click();
        });
        $('#filterBysortOption').change(function () {
            $("#Filter").click();
        });
    });
</script>
