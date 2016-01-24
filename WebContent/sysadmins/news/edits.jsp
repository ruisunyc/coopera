<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="getInfos" class="com.lib.cons.Libscons" scope="page"/>
<%@ page import="java.lang.String" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑公告</title>
<STYLE type=text/css>A {
	TEXT-DECORATION: none
}
A.style1:link {
    text-decoration: none;color: #3b6375;font-weight: normal;
}
A.style1:visited {
    text-decoration: none;color: #3b6375;font-weight: normal;
}
A.style1:active {
	text-decoration: none;color: #3b6375;font-weight: normal;
}
A.style1:hover {
	text-decoration: underline;color: #3b6375;font-weight: normal;
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
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
</style>
<script>
var  highlightcolor='#d5f4fe';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>


</head>
<%
String strtitle = request.getParameter("strtitle");
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
				工作通告—编辑工告</span></td>
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
        </table>
            </td>
      </tr>
    </table></td>
  </tr>
  <tr>
	  <td height="25">
	  
	  <form method="post" action="edits.jsp" name="form1" style="line-height: 100%; margin-top: 0; margin-bottom: 0">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" height="25">
			<tr>
				<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="25">
					<tr>
						<td width="200" align="right">
						<p style="margin-top: 3px; margin-bottom: 0"><span class="STYLE19">请输入您要编辑的工告的标题</span></td>
						<td>
						&nbsp;
						<input type="text" name="strtitle" size="38" style="font-family: 宋体; font-size: 9pt"><input type="submit" value="查询" name="B1" style="font-family: 宋体; font-size: 9pt"></td>
					</tr>
				</table>
				</td>
			</tr>
			</table>
		</form>
	  
	  </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
      <tr>
        <td height="25" bgcolor="d3eaef" class="STYLE6"><div>
			<span class="STYLE10">&nbsp;&nbsp;&nbsp;&nbsp;工告标题</span></div></td>
        <td width="120" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center">
			<span class="STYLE10">发布时间</span></div></td>
        <td width="100" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center">
			<span class="STYLE10">发布人</span></div></td>
        <td width="80" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center">
			<span class="STYLE10">操作</span></div></td>
      </tr>
      <%
        String getCons[][] = null;
       if(strtitle.equals("_all")){
    	   getCons =  getInfos.getNew();
    	   
       }
      
      
       else   if (getInfos.getTitle(strtitle,"工作通告") != null)
        {
            getCons = getInfos.getTitle(strtitle,"工作通告");}
            if (getCons.length > 0)
            {
		        for (int i=0;i<getCons.length;i++)
		        {
		%>
      <tr>
        <td height="25" bgcolor="#FFFFFF" class="STYLE6"><div><span class="STYLE19">
        　<%
			if (getCons[i][1].length() > 20)
			{
				out.println("<a class=\"style1\" target=\"_blank\" title=\""+getCons[i][1].trim()+"\" href=../../details.jsp?ID="+getCons[i][0]+">"+getCons[i][1].trim().substring(0,20)+"...</a>");
			}
			else
			{
				out.println("<a class=\"style1\" target=\"_blank\" title=\""+getCons[i][1].trim()+"\" href=../../details.jsp?ID="+getCons[i][0]+">"+getCons[i][1].trim()+"</a>");
			}
		  %>
        </span></div></td>
        <td height="25" bgcolor="#FFFFFF" class="STYLE19" width="120"><div align="center"><%= getCons[i][6]%></div></td>
        <td height="25" bgcolor="#FFFFFF" class="STYLE19" width="100"><div align="center"><%= getCons[i][4]%></div></td>
        <td height="25" bgcolor="#FFFFFF" width="80"><div align="center" class="STYLE21"><%out.println("<a class=\"style1\" target=\"_self\" title=\""+getCons[i][1].trim()+"\" href=edit.jsp?ID="+getCons[i][0]+"&strtitle="+strtitle+">编辑</a>");%></div></td>
      </tr>
		<%}}%>
      </table></td>
  </tr>
</table>
</body>
</html>