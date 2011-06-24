<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Aktel.Mvc.Models.SearchViewModel>" %>
<% using (Html.BeginForm("Search", "Search"))
   {%>
    <div>        
        <% Model.searchString = ""; %>
        <% =Html.TextBox("searchString", Model.searchString, new { @class = "zipcode_box", @size = "15", @maxlength = "5" })%>
        <%// =Html.Hidden("ZipcodeSearch_lll", Model.ZipcodeSearch_LLL)%>
        <input id="Search_SubmitButton" type="submit" value="Search" style="display: none" />
        <span style="color: #fff; font-size: 12pt; padding-left:3px">Search</span>
    </div>
<% } %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#searchString").keyup(function () {
            var allowedExp = /[\d]/; //only allow numeric digits
            var strLength = this.value.length; //length of the value in the textbox
            var lchar = this.value.charAt((strLength) - 1); //get the latest character
//            if (lchar.search(allowedExp) == -1) //make sure it is numeric
//            {
//                var tst = this.value.substring(0, (strLength) - 1); //if not numeric, take it out
//                this.value = tst;
//            }
            if (this.value.length > 4) {
                $("#Search_SubmitButton").click();                
            }
            else{
            alert("Invalid Search");
            }
        })
    });

    $(document).ready(function () {
        $("#searchString").focus()
    });

//    $(document).ready(function () {
//        var hasError = $("#ZipcodeSearch_hasError").val();
//        if (hasError == "True") $("#searchString").select();
    });
</script>
