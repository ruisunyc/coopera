<%@ page contentType="text/html;charset=utf-8"%>
<HTML>

<HEAD>
<TITLE>用户状态修改</TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate(){
   createXMLHttpRequest();
   var status1=document.getElementById("radStatus1").checked;
   var status2=document.getElementById("radStatus2").checked;
   var status3=document.getElementById("radStatus3").checked;
   var status;
   if(status1==true)
      status="在线";
   if(status2==true)
      status="出差";
   if(status3==true)
      status="休假"; 
  var str="status="+status;
   var url="grzt1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("状态修改成功");}
    }
}
</script>
</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
        <td class="guide"><img src="guide.gif" align="absmiddle">
		个人设定&gt;&gt;修改个人状态</td>
  </tr>
</table>
<form name="form1" method="post" action="">
    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="maintable">
		<tr > 
			<td align="center" valign="middle"> 
				<p>
				<table width="70%">
					<tr bgcolor="E4EAF4">
				
						<td align="center">
<label>
							<input type="radio" name="radStatus" value="1" id="radStatus1" >
							在线</label>
					
				
						<td align="center">
<label>
							<input type="radio" name="radStatus" id="radStatus2"  value="2" >
							出差</label>
					
				
						<td align="center">
<label>
							<input type="radio" name="radStatus" id="radStatus3" value="3" >
							休假</label>
					
				
					
				</table>
				
		  </td>
		</tr>
		<tr align="center">
		<td><input type=button value=设定状态 onclick=validate()></td>
		</tr>
	</table>

</form>
</BODY>
</HTML>
