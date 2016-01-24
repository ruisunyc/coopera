<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.lang.String" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script language="javascript" type="text/javascript">
function onsbt()
{
	if (window.form1.T1.value == "")
	{
	window.alert("对不起，工作经验标题不能为空，请输入新闻通告标题。");
	window.form1.T1.focus();
	return false;
	}
}
</script>
<STYLE type=text/css>A {
	TEXT-DECORATION: none
}
A.style1:link {
    text-decoration: none;color: #000000;font-weight: normal;
}
A.style1:visited {
    text-decoration: none;color: #000000;font-weight: normal;
}
A.style1:active {
	text-decoration: none;color: #000000;font-weight: normal;
}
A.style1:hover {
	text-decoration: underline;color: #000000;font-weight: normal;
}
A.style2:link {
	text-decoration: none;color:#ffffff;font-weight: normal;
}
A.style2:visited {
	text-decoration: none;color: #ffffff;font-weight: normal;
}
A.style2:active {
	text-decoration: none;color: #ffffff;font-weight: normal;
}
A.style2:hover {
    text-decoration: underline;color: #ffffff;font-weight: normal;
  }

TABLE {
	FONT-SIZE: 9pt; FONT-FAMILY: 宋体; BORDER-COLLAPSE: collapse
}
.button {
	BORDER-RIGHT: #5589aa 1px solid; BORDER-TOP: #5589aa 1px solid; FONT-SIZE: 9pt; BACKGROUND: url(img/ButtonBg.gif) #f6f6f9; BORDER-LEFT: #5589aa 1px solid; WIDTH: 50px; COLOR: #000000; BORDER-BOTTOM: #5589aa 1px solid; HEIGHT: 18px
}
.lanyu {
	BORDER-RIGHT: #5589aa 1px solid; BORDER-TOP: #5589aa 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #5589aa 1px solid; COLOR: #000000; BORDER-BOTTOM: #5589aa 1px solid
}
.font {
	FONT-SIZE: 9pt; FILTER: DropShadow(Color=#cccccc, OffX=2, OffY=1, Positive=2); TEXT-DECORATION: none
}
<!--
body {
	margin-left: 3px;
	margin-top: 3px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

</style>

</head>

<body>
<form name="form1" method="post" action="addups.jsp" onsubmit="return onsbt();">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">
				用户管理—添加用户</span></td>
              </tr>
            </table>
            </td>
            <td><div align="right"><span class="STYLE1">
              	<img border="0" src="images/see.png" width="10" height="10">&nbsp; 
				<a class="style2" href="new.jsp">查看</a> &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> 
				<a class="style2" href="add.jsp">添加</a>&nbsp;&nbsp; <img src="images/del.gif" width="10" height="10" /> 
				<a class="style2" href="dels.jsp">删除</a> &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> 
				<a class="style2" href="edits.jsp">编辑</a> &nbsp;</span><span class="STYLE1"> 
				&nbsp;</span></div></td>
          </tr>
        </table></td>
  </tr>
  <tr>
    <td>
   <table border="0" cellpadding="0" cellspacing="0" width="100%" height="150">
			<tr>
				<td width="110" align="center" height="30">用户名称</td>
				<td width="150" height="30">
				<input type="text" name="T1" size="22" style="font-family: Arial; font-size: 9pt"></td>
				<td height="30">必填项，由4-15个符号组成，并且只能以字母、数字和下划线开始，首字母必须是字母或者下划线，区分大小写。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">真实名称</td>
				<td width="150" height="30">
				<input type="text" name="T2" size="14" style="font-family: 宋体; font-size: 9pt"></td>
				<td height="30">必填项，由2-4个汉字组成，请填写用户的真实姓名。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">初始密码</td>
				<td width="150" height="30">
				<input type="password" name="T3" size="22" style="font-family: Arial; font-size: 9pt" value="111111"></td>
				<td height="30">必填项，由4-15个符号组成，系统自动默认的初始密码为六个阿拉伯数字的1。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">重输密码</td>
				<td width="150" height="30">
				<input type="password" name="T4" size="22" style="font-family: Arial; font-size: 9pt" value="111111"></td>
				<td height="30">必填项，重新输入您刚才输入的密码。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">所在部门</td>
				<td width="150" height="30">
				<input type="text" name="T5" size="22" style="font-family: Arial; font-size: 9pt"></td>
				<td height="30">必填项，请填写用户的所在部门。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">　</td>
				<td width="150" height="30">　</td>
				<td height="30"><INPUT style="BORDER-RIGHT: 1px groove rgb(37,120,219); BORDER-TOP: 1px ridge rgb(190,217,252); BORDER-LEFT: 1px ridge rgb(190,217,252); COLOR: #FFFFFF; BORDER-BOTTOM: 1px groove rgb(37,120,219); BACKGROUND-COLOR: #4D8EE3; font-family:宋体; font-size:9pt; line-height:120%; margin-top:6; margin-bottom:0" type=submit value=" 保存 " name=Submit1>
				<INPUT style="BORDER-RIGHT: 1px groove rgb(237,138,20); BORDER-TOP: 1px ridge rgb(255,255,0); BORDER-LEFT: 1px ridge rgb(255,255,0); COLOR: #FFFFFF; BORDER-BOTTOM: 1px groove rgb(237,138,20); BACKGROUND-COLOR: #FFCC00; font-family:宋体; font-size:9pt; line-height:120%; margin-top:6; margin-bottom:0" type=reset value=" 重写 " name=Submit2></td>
			</tr>
		</table>
	</td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>