<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.lang.String"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>添加公告文档</title>
<link rel="stylesheet" href="/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="/kindeditor/plugins/code/prettify.js"></script>
<script language="javascript" type="text/javascript">
	function onsbt() {
		if (window.form1.T1.value == "") {
			window.alert("对不起，公告标题不能为空，请输入标题！");
			window.form1.T1.focus();
			return false;
		}
	}
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="editor1"]', {
			cssPath : '/kindeditor/plugins/code/prettify.css',
			uploadJson : '/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['form1'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['form1'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>

<STYLE type=text/css>
A {
	TEXT-DECORATION: none
}

A.style1:link {
	text-decoration: none;
	color: #000000;
	font-weight: normal;
}

A.style1:visited {
	text-decoration: none;
	color: #000000;
	font-weight: normal;
}

A.style1:active {
	text-decoration: none;
	color: #000000;
	font-weight: normal;
}

A.style1:hover {
	text-decoration: underline;
	color: #000000;
	font-weight: normal;
}

A.style2:link {
	text-decoration: none;
	color: #ffffff;
	font-weight: normal;
}

A.style2:visited {
	text-decoration: none;
	color: #ffffff;
	font-weight: normal;
}

A.style2:active {
	text-decoration: none;
	color: #ffffff;
	font-weight: normal;
}

A.style2:hover {
	text-decoration: underline;
	color: #ffffff;
	font-weight: normal;
}

TABLE {
	FONT-SIZE: 9pt;
	FONT-FAMILY: 宋体;
	BORDER-COLLAPSE: collapse
}

.button {
	BORDER-RIGHT: #5589aa 1px solid;
	BORDER-TOP: #5589aa 1px solid;
	FONT-SIZE: 9pt;
	BACKGROUND: url(img/ButtonBg.gif) #f6f6f9;
	BORDER-LEFT: #5589aa 1px solid;
	WIDTH: 50px;
	COLOR: #000000;
	BORDER-BOTTOM: #5589aa 1px solid;
	HEIGHT: 18px
}

.lanyu {
	BORDER-RIGHT: #5589aa 1px solid;
	BORDER-TOP: #5589aa 1px solid;
	FONT-SIZE: 12px;
	BORDER-LEFT: #5589aa 1px solid;
	COLOR: #000000;
	BORDER-BOTTOM: #5589aa 1px solid
}

.font {
	FONT-SIZE: 9pt;
	FILTER: DropShadow(Color = #cccccc, OffX = 2, OffY = 1, Positive = 2);
	TEXT-DECORATION: none
}

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

	<form name="form1" method="post" action="addups.jsp"
		onsubmit="return onsbt();">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30"><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td height="24" bgcolor="#353c44">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="6%" height="19" valign="bottom"><div
															align="center">
															<img src="images/tb.gif" width="14" height="14" />
														</div></td>
													<td width="94%" valign="bottom"><span class="STYLE1">
															科研协作系统后台管理—工作通告—添加工告</span></td>
												</tr>
											</table></td>
										<td><div align="right">
												<span class="STYLE1"> <img border="0"
													src="images/see.png" width="10" height="10">&nbsp; <a
													class="style2" href="new.jsp">查看</a> &nbsp;&nbsp;<img
													src="images/add.gif" width="10" height="10" /> <a
													class="style2" href="add.jsp">添加</a>&nbsp;&nbsp; <img
													src="images/del.gif" width="10" height="10" /> <a
													class="style2" href="dels.jsp">删除</a> &nbsp;&nbsp;<img
													src="images/edit.gif" width="10" height="10" /> <a
													class="style2" href="edits.jsp">编辑</a> &nbsp;
												</span><span class="STYLE1"> &nbsp;</span>
											</div></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%"
									height="150">
									<tr>
										<td width="100" height="30" align="right">公告标题：</td>
										<td align="right"><input type="text" name="T1" size="20"
											style="font-family: 宋体; font-size: 9pt; width: 99.5%"></td>
									</tr>
									<tr>
										<td width="100" height="30" align="right" valign="top">
											<p style="margin-top: 6px">公告内容：
										</td>
										<td align="right"><textarea id="editor1" name="editor1"
												rows="10" cols="80"
												style="width: 100%; height: 500px; visibility: hidden;"></textarea>
											<script type="text/javascript">
												// This is a check for the KindEditor class. If not defined, the paths must be checked.
												if (typeof KindEditor == 'undefined') {
													document
															.write('<strong><span style="color: #ff0000">Error</span>: KindEditor not found</strong>.'
																	+ 'This sample assumes that KindEditor (not included with KindEditor) is installed in'
																	+ 'the "/KindEditor/" path. If you have it installed in a different place, just edit'
																	+ 'this file, changing the wrong paths in the &lt;head&gt; (line 5) and the "BasePath"'
																	+ 'value (line 32).');
												} else {
													var editor = KindEditor
															.replace('editor1');
													editor.setData('');

													// Just call KindEditor.SetupCKEditor and pass the KindEditor instance as the first argument.
													// The second parameter (optional), is the path for the KindEditor installation (default = "/ckfinder/").
													KindEditor.setupCKEditor(
															editor,
															'/KindEditor/');

													// It is also possible to pass an object with selected KindEditor properties as a second argument.
													// KindEditor.SetupCKEditor( editor, { BasePath : '../../', RememberLastFolder : false } ) ;
												}
											</script></td>
									</tr>
									<tr>
										<td width="100" height="30" align="right">&nbsp;</td>
										<td><INPUT type=submit name=b1 value="提交"
											style="font-family: 宋体; font-size: 9pt"> <INPUT
											type=reset name=b2 value="重填"
											style="font-family: 宋体; font-size: 9pt"></td>
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
</body>
</html>
