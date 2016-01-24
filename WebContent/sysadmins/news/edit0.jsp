<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="getInfos" class="com.lib.cons.Libscons" scope="page"/>
<%@ page import="java.lang.String" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/ckfinder/ckfinder.js"></script>
<script language="javascript" type="text/javascript">
function onsbt()
{
	if (window.form1.T1.value == "")
	{
	window.alert("对不起，公告标题不能为空，请输入公告标题。");
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
<%
String strtitle = request.getParameter("strtitle");
String ID = request.getParameter("ID");
if (strtitle != null)
{
strtitle = new String(request.getParameter("strtitle").getBytes("iso-8859-1"),"utf-8");
}
else
{
strtitle = "";
}
if (strtitle.equals(""))
{
	strtitle = "_all";
}
%>
<body>
<%
String strCons[][] = null;
if (getInfos.getId(ID) != null)
{
	strCons = getInfos.getId(ID);
	if (strCons.length > 0)
	{
%>
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
				科研协作平台—网站后台管理—公告管理—编辑公告</span></td>
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
			<td width="100" height="30" align="right">新闻通告标题：</td>
			<td align="right"><input type="hidden" name="strtitle" id="strtitle" size="20" value="<%= strtitle%>">
			<input type="hidden" name="ID" id="ID" size="20" value="<%= ID%>">
			<input type="text" name="T1" size="20" style="font-family: 宋体; font-size: 9pt; width: 99.5%" value="<%= strCons[0][1]%>">
			</td>
		</tr>
		<tr>
			<td width="100" height="30" align="right" valign="top">
			<p style="margin-top: 6px">新闻通告内容：</td>
			<td align="right">
			<textarea id="editor1" name="editor1" rows="10" cols="80"><%= strCons[0][3]%></textarea>
			<script type="text/javascript">
			
			// This is a check for the CKEditor class. If not defined, the paths must be checked.
			if ( typeof CKEDITOR == 'undefined' )
			{
				document.write(
					'<strong><span style="color: #ff0000">Error</span>: CKEditor not found</strong>.' +
					'This sample assumes that CKEditor (not included with CKFinder) is installed in' +
					'the "/ckeditor/" path. If you have it installed in a different place, just edit' +
					'this file, changing the wrong paths in the &lt;head&gt; (line 5) and the "BasePath"' +
					'value (line 32).' ) ;
			}
			else
			{
				var editor = CKEDITOR.replace( 'editor1' );
				var econs = window.editor1.value;
				editor.setData( econs );
			
				// Just call CKFinder.SetupCKEditor and pass the CKEditor instance as the first argument.
				// The second parameter (optional), is the path for the CKFinder installation (default = "/ckfinder/").
				CKFinder.setupCKEditor( editor, '/ckfinder/' ) ;
			
				// It is also possible to pass an object with selected CKFinder properties as a second argument.
				// CKFinder.SetupCKEditor( editor, { BasePath : '../../', RememberLastFolder : false } ) ;
			}
			
			</script>

			</td>
		</tr>
		<tr>
			<td width="100" height="30" align="right">&nbsp;</td>
			<td>
			<INPUT type=submit name=b1 value="提交" style="font-family: 宋体; font-size: 9pt">
			<INPUT type=reset name=b2 value="重填" style="font-family: 宋体; font-size: 9pt">
			</td>
		</tr>
		<tr>
			<td width="100" height="30" align="right">&nbsp;</td>
			<td align="right">&nbsp;</td>
		</tr>
		<tr>
			<td width="100" height="30" align="right">&nbsp;</td>
			<td align="right">&nbsp;</td>
		</tr>
	</table>
	</td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
  </tr>
</table>
</form>
<%}}%>
</body>
</html>