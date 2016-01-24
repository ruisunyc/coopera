function trim(str)   // 用正则表达式将前后空格        
{      
    // 用空字符串替代。      
    var t = str.replace(/(^\s*)|(\s*$)/g, "");    
    return t.replace(/(^　*)|(　*$)/g, "");    
} 
function  bytelength(szString)//获取字符串长度
{
	return szString.replace(new RegExp("[^\x00-\xff]", "g"), "  ").length;
}
function checkPassword(e)//判断用户密码
{
	var ok = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_.-";
	for(var i=0; i<e.length; i++)
	{
		if (ok.indexOf(e.charAt(i))<0) 
		{
			return false;
		}
	}
	return true;
}
function   verifyAddress(obj)    
{    
var   email=obj;    
var   pattern=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;    
flag=pattern.test(email);    
if(flag)    
{    
return   true;    
}
else    
{   
return   false;    
}    
}     
function CheckPhone85(obj)
{

var MobileStr =obj;
var i,j,strTemp;
strTemp="0123456789";

if(MobileStr.substring(0,2)!="13"&&MobileStr.substring(0,1)!="0")
 {
  alert ('错误：不是有效的手机/小灵通/固定电话号码！');
  return false;
 }

if (MobileStr.length<11)
 {
  alert ('错误：手机/小灵通/固定电话号码长度不能小于11！');
  return false;
 }

for (i=0;i<11;i++)
 {
  j=strTemp.indexOf(MobileStr.substring(i, i+1));
  if (j==-1)
   {
    alert ('错误：手机号码不能含有字符！');
    return false;
   }
 }
return true;
}
