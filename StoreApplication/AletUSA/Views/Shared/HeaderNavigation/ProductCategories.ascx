<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Aktel.Domain.ProductCategory>>" %>

<div style="width: 250px; min-height: 200px;color: black;border: 1px solid silver;border-top: 0;
					position: absolute;z-index: 3;background: #FAFAFA; Opacity: 0;filter: Alpha(Opacity=0);
					visibility: visible; padding: 0; moz-box-shadow: 0 4px 10px #B1B0B0; z-index: 9000;
					display: block; zoom: 1; opacity: 1; ">
	<div style="height: 9px;width: 19px;top: 0;	position: absolute;	z-index: 110;" id="navArrow" style="left: 224px; "></div>
	<ul style="width: 300px;float: left;margin: 36px 0 0 10px; padding: 0 20px 30px; text-align: left; min-height: 175px;
					background: none;list-style:none; z-index: 110;">
    <%foreach (var category in Model)
    {%>
		<li style="display: block; clear: both;width: 100%;overflow:hidden;margin-bottom: 7px; background: none;list-style-type:none;z-index: 110;">
			<a id="gn214" href="#" style="color: #333;font-size: 12px;font-weight: normal;z-index: 110;"><%=Html.Encode(category.Name)%></a>
		</li>
     <%}%>
	</ul>
</div>
