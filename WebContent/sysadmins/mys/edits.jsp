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
if (window.form1.T1.value.length < 4)
{
	window.alert("原来的密码输入不合法，请按要求输入合法的原始密码。");
	window.form1.T1.focus();
	return false;
}
if (window.form1.T2.value.length < 4)
{
	window.alert("新的密码输入不合法，请按要求输入合法的用户新密码。");
	window.form1.T2.focus();
	return false;
}
if (window.form1.T2.value != window.form1.T3.value)
{
	window.alert("两次输入的密码不一致，请重新输入。");
	window.form1.T3.value = "";
	window.form1.T2.value = "";
	window.form1.T2.focus();
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
<form name="form1" method="post" action="editups.jsp" onsubmit="return onsbt();">
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
				系统管理—修改密码</span></td>
              </tr>
            </table>
            </td>
          </tr>
        </table></td>
  </tr>
  <tr>
    <td>
   		<table border="0" cellpadding="0" cellspacing="0" width="100%" height="90">
			<tr>
				<td width="110" align="center" height="30">原来密码</td>
				<td width="150" height="30">
				<input type="password" name="T1" size="20" style="font-family: Arial; font-size: 9pt"></td>
				<td height="30">必填项，由4-15个符号组成，区分大小写。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">新的密码</td>
				<td width="150" height="30">
				<input type="password" name="T2" size="20" style="font-family: Arial; font-size: 9pt"></td>
				<td height="30">必填项，由4-15个符号组成，区分大小写。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">再输一次</td>
				<td width="150" height="30">
				<input type="password" name="T3" size="20" style="font-family: Arial; font-size: 9pt"></td>
				<td height="30">必填项，请再次输入一遍您的新密码。</td>
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