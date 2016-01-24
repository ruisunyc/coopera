<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type=text/javascript>
</script>
<link rel="stylesheet" href="creatGroup.css" type="text/css" />
<script type="text/javascript" src="Scripts/JQuery.js"></script>
<link rel="stylesheet" href="Scripts/uiLib.css" type="text/css">
<style>
#candidates { border-collapse:none; }
#candidates tr td:first-child { border-left:5px solid transparent; }
#candidates td.authOption { color:#999; }
#candidates tr.inner-chosen td { background:#f9f8ff; border-bottom:1px solid #69c; color:#000 !important; }
#candidates tr.inner-chosen td:first-child { border-left:5px solid #69c; }
p.subHint {margin:0.5em 0; font-size:0.9em; color:#666;}
</style>

<script type="text/javascript">
$(document).ready(function(){

		jQuery.validator.addMethod( "isTeamId" ,  function (value, element)  {       
		     var  teamId  =   /^[a-z0-9\-]+$/;     
     		 return   this .optional(element)  ||  (teamId.test(value));       
 		} ,  " 请正确填写团队名称 " ); 
		jQuery.validator.addMethod("isLtGt",function(value,element){
			var ltGt = /[:\\\/<>*?|"]/;;
			return !(ltGt.test(value));
		},"请不要输入非法字符:?\\ /*<>|\":");
		
		var currentValidator = $("#createTeamForm").validate({
			submitHandler:function(form){
				form.submit();
				/*
				var value = $("input[name=checkCode]").val();
				var dd = "checkCode="+value+"&type=teamType"
				$.ajax({
					url:"/system/pictrueCheckCode?func=checkCode",
					type:"POST",
					dataType:"json", 
					data:dd, 
					error:function(){},
					success:function(data) {
						if(data.status=="success"){
							form.submit();
						}else{
							$("input[name=checkCode]").addClass("error");
							$("input[name=checkCode]").parent().next('.errorContainer').html("<label class='error' generated='true'>验证码错误,请重新输入!</label>");
							$("#checkCodePiceture").attr("src","/system/pictrueCheckCode?func=getImage&type=teamType"+"&&rand="+Math.random());
							return ;
						}
					},
					statusCode:{
						450:function(){alert('会话已过期,请重新登录');},
						403:function(){alert('您没有权限进行该操作');}
					}
				});
				*/
			},
			rules: {
				teamId: {	
							required: true,isTeamId:true,
							isLtGt:true,
							minlength:2,
							remote:"/system/createTeam?func=validateTeamId"
						},
				teamName:{required: true,isLtGt:true,maxlength : 100},
				teamDescription:{isLtGt:true}
			},
			messages:{
				teamId: {
					required: '请输入团队网址',
					minlength:'输入的团队网址不能少于2个字符',
					isTeamId:"团队网址只能包括小写英文字母、数字和中划线",
					remote: '该地址已被使用。请尝试其他地址。'
				},
				teamName: {
					required: '请输入团队名称',
					maxlength : '团队名称不能超过100个字符'
				}
			},
			errorPlacement: function(error, element) {
				error.appendTo(element.parent().next('.errorContainer'));
			}
		});
		
		$("input[name='cancel']").live("click",function(){
			window.location = "/system/switch";
		});
		$("#teamName").live("blur",function(){
			var value = $("#teamName").val();
			var r = "";
			for(var i=0;i<value.length;i++){
				var c = value.charCodeAt(i); 
		        if ((c >= 48 && c <= 57) || (65<=c && c<=90)|| (97<=c && c<=122)||c==45){ 
		             r=r+value[i];
		        } 
			}
			var teamId = $("#teamId").val();
			if(!teamId){
				$("#teamId").val(r.toLowerCase());
			}
		});
		
		function selectChange(){
			var accessType;
			$("input[type=radio][name=accessType]").each(function(){
				if($(this).attr('checked')){
					accessType = $(this).val();
					return;
				}
			});
			if(accessType == 'public'){
				$("#accessType-protected-info").attr('style','display:none');
				$("#accessType-public-info").removeAttr('style');
				$("#accessType-private-info").attr('style','display:none');
				$("#accessType-public-info input[name=auth]").attr('checked',false);
				$("#accessType-public-info input[name=auth][value=view]").attr('checked',true);
				$("input[name=defaultMemberAuth]").val('view');
			}else if(accessType == 'protected'){
				$("#accessType-protected-info").removeAttr('style');
				$("#accessType-public-info").attr('style','display:none');
				$("#accessType-private-info").attr('style','display:none');
				$("#accessType-protected-info input[name=auth]").attr('checked',false);
				$("#accessType-protected-info input[name=auth][value=edit]").attr('checked',true);
				$("input[name=defaultMemberAuth]").val('edit');
			}else{
				$("#accessType-protected-info").attr('style','display:none');
				$("#accessType-public-info").attr('style','display:none');
				$("#accessType-private-info").removeAttr('style');
				$("input[name=defaultMemberAuth]").val('edit');
			}
		}
		
		refreshCode = function(){
			$("#checkCodePiceture").attr("src","/system/pictrueCheckCode?func=getImage&type=teamType"+"&&rand="+Math.random());
			return false;
		};
		
		$("input[type=radio][name=accessType]").live('change',selectChange);
		selectChange();
		
		$('input[type=radio][name=auth]').change(function(){
			$('input[name=defaultMemberAuth]').val($(this).val());
		});
});
</script>
</head>
<body>
<div id="content" class="std portalContent">


<!-- jquery.validate and jquery.pagination has conflict -->




<div id="content-title">
	<h1>创建团队</h1>
</div>
<div class="content-through">
 
	<form id="createTeamForm" action="createGroup" method="post"><!--  	<form id="createTeamForm" action="/system/createTeam" method="POST">-->
		<input type="hidden" value="createTeam" name="func">
		<input type="hidden" value="edit" name="defaultMemberAuth">
		<table class="ui-table-form" style="font-size:14px; width:800px;">
		<tbody>
			<tr><th  >团队名称：</th>
				<td width="10" class="ui-text-alert">*</td>
				<td width="320"><input id="teamName" name="teamName" style="width:270px;padding:3px;" type="text" value="" maxlength="100"></td>
				<td width="150" class="errorContainer"><label class="error" generated="true"></label></td>
			</tr>
			<tr><th>团队单位：</th>
				<td class="ui-text-alert" style="padding-top:7px;">*</td>
				<td style="vertical-align:middle;"><input id="teamId" name="teamId" style="width:270px;padding:3px;" type="text" value="" maxlength="200">
				<p class="subHint"><span class="ui-text-note">请说明单位名称，如山西大学计算机与信息技术学院</span></p>
				</td>
				<td class="errorContainer"><label class="error" generated="true"></label></td>
			</tr>
			<!--  <tr ><th>团队权限：</th>
				<td colspan="3">
					<ul style="list-style:none; padding:0 0 0 10px; margin:0;">
						<li>
							<input id="accessType1" name="accessType" checked="checked" type="radio" value="private">完全保密
							<input id="accessType2" name="accessType" type="radio" value="protected">公开需审核
							<input id="accessType3" name="accessType" type="radio" value="public">完全公开
						</li>
						<li>
							<div id="accessType-public-info" style="display:none">
								<p class="subHint"><span class="ui-text-note">用户无需管理员审核即可通过以下三种方式加入：</span></p>
								<p class="subHint"><span class="ui-text-note">1）通过推广链接注册加入（管理员可在团队“基本设置”里获取推广链接 ）</span></p>
								<p class="subHint"><span class="ui-text-note">2）从首页（Dashboard）的“加入公开团队”功能加入</span></p>
								<p class="subHint"><span class="ui-text-note">3）接受团队邀请加入</span></p>
								<p class="subHint">
									<span class="ui-text-note">您可以指定新成员进入团队后的默认权限：</span>
									<input id="auth1" name="auth" checked="checked" type="radio" value="view">可查看
									<input id="auth2" name="auth" type="radio" value="edit">可编辑
								</p>
							</div>
							<div id="accessType-protected-info" >
									<p class="subHint">
									<span class="ui-text-note">您可以指定新成员进入团队后的默认权限：</span>
									<input id="auth3" name="auth" checked="checked" type="radio" value="view">可查看
									<input id="auth4" name="auth" type="radio" value="edit">可编辑
								</p>
							</div>
							<div id="accessType-private-info" style="display:none">
								<p class="subHint"><span class="ui-text-note">团队成员仅能由管理员邀请加入。</span></p>
							</div>
						</li>
					</ul>
				</td>
			</tr>-->
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
					<input type="submit" value="创建团队" class="btn btn-success btn-large">&nbsp;&nbsp;
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