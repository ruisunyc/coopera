<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>用户注册</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="oa.js"></script>
<script src="scripts/ajax.js"></script>
<%-- <%-- <% --%>
<!-- //     request.setCharacterEncoding("UTF-8");   -->
<!-- // String safecode = (String)session.getAttribute("safecode"); -->
<!-- // out.print(safecode); -->
<!-- // 	String action = request.getParameter("action"); -->
<!-- // 	String safecodeText = request.getParameter("checkCode"); -->
<!-- // 	if("action".equals(action)){ -->
<!-- // 		//String safecode = (String)session.getAttribute("safecode"); -->
<!-- // 		if(safecode.equals(safecodeText)){ -->
<!-- // 			//out.print("验证码正确！"); -->
<!-- // 			response.sendRedirect("/coopera/login.html"); -->
<!-- // 		}else{ -->
<!-- // 			//out.print("验证码错误！请重新输入！"); -->
<!-- // 		} -->
<!-- // 	} -->
<%-- <%-- %> --%>
<script type="text/javascript">
function validate_form()
{
  if(document.form1.uID.value == "")
	{
		alert("帐号不能为空!");
		return false;
	}
        if(bytelength(document.form1.uID.value)<1||bytelength(document.form1.uID.value)>50)
	{
		alert("帐号长度不合法!");
		return false;
	}
 if(!checkPassword(document.form1.uID.value))
	{
		alert("请输入字母或数字");
		return false;
	}
 if(document.form1.password.value == "")
	{
		alert("用户密码不能为空!");
		return false;
	}
if(document.form1.password.value!=document.form1.passwordAgain.value)
	{
		alert("密码和确认密码不一致");
		return false;
	}
	 if(!checkPassword(document.form1.password.value))
	{

		alert("请输入字母或数字");
		return false;
	}
if(document.form1.truename.value == "")
	{
		alert("用户的真实姓名不能为空!");
		return false;
	}
if(document.form1.mail.value == "")
	{
		alert("电子邮件不能为空!");
		return false;
	}	
if(!verifyAddress(document.form1.mail.value)){
         alert("电子邮件格式错误，请重写"); 
	      return false; 
	}
       return true;
}
function reg()
{
	if(validate_form()==false)
		return;
	validate();
}
function validate(){
	createXMLHttpRequest() ;
   var username=document.getElementById("uID").value;
   var password=document.getElementById("password").value;
   var truename=document.getElementById("truename").value;
   var mail=document.getElementById("mail").value;
   var str="username="+username+"&password="+password+"&truename="+truename+"&mail="+mail;
   //alert(str);
   var url="zhuce.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { window.alert("用户添加成功");
              window.location.href='/coopera/login.html';
            }
    }
}
function refreshCode(url){
	document.form1.img.src =url;
	
}
</script>
<style type="text/css">
label {
	color: red;
}
body {
	margin: 0px auto;
	padding: 0px;
	font-family: "宋体";
	font-size: 14px;
	color: #333333;
}
#Container {
	margin: 0 auto; /*设置整个容器在浏览器中水平居中*/
	width: 1000px;
	margin-top: 40px;
	background-color: #fff;
	border: 0px solid #ccc;
	text-align: center;
	padding: 0px;
	height: 550px;
}
#leftContent {
	float: left;
	padding: 0px;
	width: 700px;
	height: 487px;
	border-width: 0px 1px 1px 1px;
	border-style: solid;
	border-color: #ccc;
}
#rightContent {
	margin-left: 70%;
	width: 300px;
	height: 487px;
	border-width: 0px 1px 1px 0px;
	text-align: left;
	border-style: solid;
	border-color: #ccc;
}
#content-title {
	width: 1000px;
	border-width: 1px 1px 0px 1px;
	border-style: solid;
	border-color: #ccc;
	text-align: left;
	border-bottom: 1px solid #ccc;
	font-family: Cambria;
	padding-bottom: 10px;
}
#content-title h1 {
	font-size: 20px;
	font-family: '微软雅黑', '黑体';
}

.footer {
	text-align: center;
	font-size: 13px;
	font-family: Arial, "宋体";
	color: #666;
	padding: 0;
	width: 980px;
	margin-top: 100px;;
	margin-bottom: 0px;
	margin-left: auto;
	margin-right: auto;
}

#content-major {
	width: 700px;
	float: left;
	border-right: 1px solid #ccc;
	min-height: 230px;
	overflow-x: hidden;
	overflow-y: hidden;
	background-color: #fff;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
	width: 496px;
}

.textInput-long {
	width: 200px !important;
}

input {
	height: 24px;
	margin-left: 3px;
	text-align: left;
}
.text-alert {
	width: 12px;
	height: 41px;
	color: red;
}
span.text-note {
	margin-left: 3px;
	margin-right: 3px;
	color: gray;
	font-size: 11px;
	font-family: "楷体"
}
td.errorContainer {
	width: 122px;
	height: 42px;
}
label.error {
	display: block;
	margin-left: 5px;
	margin-top: 3px;
	cursor: default;
}
input.btn.submit {
	width: 210px;
	height: 36px;
	background-color: #4186f6;
	border-radius: 10px;
	cursor: pointer;
}
a {
	text-decoration: none;
}
a.btn.btn-link {
	width: 54px;
	height: 26px;
}
.table-form {
	margin: 1px auto;
	border-collapse: collapse;
	margin-top: 2px;
	margin-right: 0;
	width: 496px;
	text-align: left;
	border-color: gray;
	border-spacing: 2px;
}
#registForm {
	width: 700px;
	height: 379px;
}
#content-through {
	width: 100%;
	clear: both;
}
div {
	display: block;
	border-width: 0px 0px 1px 0px;
	border-color: #ccc;
}
#header {
	background: #f5f5f5;
	border: 1px solid #ccc;
	border-top: none;
	margin-top: 5px;
	padding-top: 1px;
	margin-bottom: 5px;
	padding-right: 0px;
	padding-bottom: 1px;
	padding-left: 0px;
	font-family: Helvetica, Calibri, '宋体', Arial, sans-serif;
	background-color: #fff;
	border-bottom: 1px solid #ccc;
	width: 998px;
	height: 60px;
	margin: auto;
}
.clear {
	clear: both;
	font-size: 1px;
	width: 1000px;
	height: 10px;;
	visibility: hidden;
}
th {
	font-size: 15px;
	text-align: right;
}
.rightMain {
	padding-top: 50px;
	color: blue;
}
#header h1 {
	color: #3366FF;
}
.rightMain a:visited {
	color: #FF3300;
}
.rightMain a:HOVER {
	color: blue;
}
</style>
</HEAD>
<BODY topmargin="100" bgcolor="#D2E9FF">
	<div id="header">
		<h1>团队协作编辑平台</h1>
	</div>
	<div id="Container">
		<div id="content-title">
			<h1>新用户注册</h1>
		</div>
		<div id="content-through">
			<div id="leftContent">

				<div style="">
					<h3 align=center>填写个人信息</h3>
				</div>
				<div id="content-major">
					<form id="registForm" method="post" name="form1">

						<table class="table-form" style="">
							<tbody>
								<tr>
									<th>用户账号</th>
									<td class="text-alert">*</td>
									<td><input type="text" name="uID" id="uID"></td>
									<td class="errorContainer" width="120"><label
										class="error"></label></td>
								</tr>
								<tr>
									<th>密码</th>
									<td class="text-alert">*</td>
									<td><input type="password" name="password" id="password">
										<br> <span class="text-note">请输入长度6位以上的密码</span></td>
									<td class="errorContainer"><label class="error"></label></td>
								</tr>
								<tr>
									<th>确认密码</th>
									<td class="text-alert">*</td>
									<td><input type="password" id="passwordAgain"
										name="passwordAgain"></td>
									<td class="errorContainer"></td>
								</tr>
								<tr>
									<th>真实姓名</th>
									<td class="text-alert">*</td>
									<td><input type="text" name="truename" id="truename"></td>
									<td class="errorContainer"><label class="error"></label></td>
								<tr>
									<th>电子邮件</th>
									<td width="10" class="text-alert">*</td>
									<td><input type="text" name="mail" id="mail"
										class="textInput-long"> <br> <span
										class="text-note">请使用真实的邮箱，用以找回密码</span></td>
									<td class="errorContainer"><label class="error"></label></td>
								</tr>
								<!--  <tr>
	    <td>联系电话</td>
	    <td ><input type="text" name="phone" id="phone"></td>
	</tr>-->
								<tr>
									<th>验证码</th>
									<td class="text-alert">*</td>
									<td><input type="text" name="checkCode" value=""></td>
									<td class="errorContainer"></td>
								</tr>
								<tr>
									<th></th>
									<td></td>
									<td>
										<!--  <img id="checkCodePiceture" style="width:80px; height:40px;" src="/system/CheckCodeServlet?func=getImage&amp;type=registType">-->
										<img name="img" alt=""
										src="<%=request.getContextPath()%>/system/CheckCodeServlet"
										title="看不清，点击换一张" onClick="this.src=this.src+'?'" /> <!-- 				<a><img alt="" src="CheckCodeServlet" title="看不清，点击换一张" onClick="this.src=this.src+'?'"/></a> -->
										<a href="#"
										onclick='refreshCode("<%=request.getContextPath()%>/system/CheckCodeServlet?radom="+Math.random()) '>换一张</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td></td>
									<td></td>
									<td
										style="padding-top: 30px; vertical-align: bottom; padding-bottom: 2px;">
										<input type="button" value="注册" class="btn submit"
										onclick="reg()"> <a class="btn btn-link" href="/">取消</a>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			</div>
			<div id="rightContent" style="">
				<div class="rightMain">
					说明：<br /> 师生建议使用校园一卡通号注册<br /> 已注册用户请点击登陆<br /> <a class=""
						rel="nofollow" style="margin-left: 60px; margin-top: 5px;"
						href="<%=path%>/login.html">点此立即登录</a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="footer">
		<p>
			Copyright © 2015 <a target="_blank"
				href="http://scit.sxu.edu.cn/index.aspx">山西大学计算机与信息技术学院</a> All
			Rights Reserved
		</p>
	</div>
</BODY>
</HTML>
