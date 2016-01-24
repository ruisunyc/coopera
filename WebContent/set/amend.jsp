<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<HTML>
<HEAD>
<TITLE>用户个人信息设置</TITLE>
<script src="../scripts/oa.js"></script>
<script src="../scripts/ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  
if(document.form1.truename.value == "")
	{
		alert("用户姓名不能为空!");
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
	
if(document.form1.phone.value == "")
	{
		alert("手机号码不能为空!");
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
   var truename=document.getElementById("truename").value;
   var sex=document.getElementById("sex").value;
   var mail=document.getElementById("mail").value;
   var phone=document.getElementById("phone").value;
   var direction=document.getElementById("direction").value;
   var unit=document.getElementById("unit").value;
   var dept=document.getElementById("dept").value;
   var address=document.getElementById("address").value;
   createXMLHttpRequest();
   var str="truename="+truename+"&sex="+sex+"&mail="+mail+"&phone="+phone+"&direction="+direction+"&unit="+unit+"&dept="+dept+"&address="+address;
   var url="amendup.jsp?new Date().toString()";
   xmlHttp.open("POST",url,true);
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.onreadystatechange=callback;
   xmlHttp.send(str);
}
function callback(){
   if(xmlHttp.readyState==4){
	   
	   if(xmlHttp.status==200){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            {window.alert("基本信息修改成功");
            //response.sendRedirect("personal.jsp");
            
            }
        }
    }
}
</script>
</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td class="guide"><img src="guide.gif" align="absmiddle">
		个人设置&gt;&gt;修改个人信息</td>
		<td align="right" class="guide">&nbsp;</td>
	</tr>
</table>
<%
 String name=(String)session.getAttribute("username");
 String sql="select * from user where username='"+name+"'";
 ResultSet rs=con.getRs(sql);
 rs.next();
%>
<form method="post"  name="form1">

<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
	<tr>
	<th>用户账号</th>
	<td><input type="text" name="username"	id="username" disabled="disabled" value=<%=rs.getString("username") %>></td>
	</tr>
	<tr bgcolor="E4EAF4">
		<th width="11%" >真实姓名</th>
		<td width="39%" ><input type="text" name="truename"	id="truename" value=<%=rs.getString("truename") %>> </td>
	</tr>
	<tr >
	    <th width="11%" >性别</th>
        <td width="39%" ><input type="text" name="sex" id="sex" value=<%=rs.getString("sex")%>></td> 
	</tr>
	<tr bgcolor="E4EAF4">
		<th width="11%" >手机</th>
		<td width="39%" ><input type="text" name="phone" id="phone" value=<%=rs.getString("phone")%>>
		</td>
		</tr>
	<tr bgcolor="E4EAF4">
		  <th width="11%">电子邮件</th>
		<td width="39%" >
                   <input type="text" name="mail" id="mail" value=<%=rs.getString("mail")%>>
		</td>
	</tr>
<tr>
	<th>研究方向 </th>
    <td><input type="text" name="direction" id="direction" value=<%=rs.getString("direction")%>></td>
	</tr>
<tr>
	<th>所在单位 </th>
    <td><input type="text" name="unit" id="unit" value=<%=rs.getString("unit")%>></td>
	</tr>
<tr>
	<th>部门 </th>
    <td><input type="text" name="dept" id="dept" value=<%=rs.getString("dept")%> ></td>
	</tr>
<tr >
	<tr bgcolor="E4EAF4">

		<th width="11%" >地址</th>
		<td width="39%" ><input type="text" name="homeAddress" id="address" value=<%=rs.getString("address")%>></td>
	</tr>
        <tr >
          <td align="right"><input type="submit" value="修改" onclick="reg()"></td>
           <td><input type="reset" value="重置"></td>
        </tr>

</table>
</form>

</BODY>
</HTML>
