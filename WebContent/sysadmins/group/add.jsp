<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type=text/javascript>
</script>

<link rel="stylesheet" href="Scripts/uiLib.css" type="text/css">
<style>
#candidates { border-collapse:none; }
#candidates tr td:first-child { border-left:5px solid transparent; }
#candidates td.authOption { color:#999; }
#candidates tr.inner-chosen td { background:#f9f8ff; border-bottom:1px solid #69c; color:#000 !important; }
#candidates tr.inner-chosen td:first-child { border-left:5px solid #69c; }
p.subHint {margin:0.5em 0; font-size:0.9em; color:#666;}

tr{
width: 100px;
}
body{
margin:0px auto;
padding:0px;
background-color: #b9d8f3;width:100%;
}
</style>


</head>
<body>
<div id="content" class="std portalContent" style="margin-left: 300px;margin-top:20px;">


<div class="content-through" >
 
	<form id="createTeamForm" action="AddGroup" method="post">
		<input type="hidden" value="createTeam" name="func">
		<input type="hidden" value="edit" name="defaultMemberAuth">
		<table class="ui-table-form" style="font-size:14px; width:600px;">
		<tbody >
			<tr style="width: 430px;"><th  >团队名称：</th>
				<td width="10" class="ui-text-alert">*</td>
				<td width="270"><input id="teamName" name="teamName" style="width:270px;padding:3px;" type="text" value="" maxlength="100"></td>
				<td width="150" class="errorContainer"><label class="error" generated="true"></label></td>
			</tr>
			<tr><th>团队单位：</th>
				<td class="ui-text-alert" style="padding-top:7px;">*</td>
				<td style="vertical-align:middle;"><input id="teamUnit" name="teamUnit" style="width:270px;padding:3px;" type="text" value="" maxlength="200">
				</td>
				<td class="errorContainer"><label class="error" generated="true"></label></td>
			</tr>
			
			<input type="hidden" name="teamInfo" value="docManager">
			<tr><th>团队简介：</th>
				<td></td>
				<td><textarea id="teamDescription" name="teamDescription" style="width:275px;"></textarea></td>
				<td class="errorContainer">
					</td>
			</tr>
			
		</tbody>
		<tfoot>
			<tr><th></th>
				<td></td>
				<td class="">
					<input type="submit" value="添加团队" class="btn btn-success btn-large">&nbsp;&nbsp;
					<input type="button" class="btn btn-large" name="cancel" value="取消">
				</td>
				<td></td>
			</tr>
		</tfoot>
		</table>
		
	
	
	</form></div>
<div class="clear"></div>
<div id="backToTop" class="ui-bottomTouch" title="回顶部" style="left: 1449px;"></div><div id="backToTop" class="ui-bottomTouch" title="回顶部"></div></div>
</body>

</html>