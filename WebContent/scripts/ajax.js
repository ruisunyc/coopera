var xmlHttp; 
//根据不同的浏览器创建不同的XMLHttpRequest对象
function createXMLHttpRequest() 
{ 
	if (window.XMLHttpRequest) 
	{
         
		xmlHttp = new XMLHttpRequest();
	} else {
		if (window.ActiveXObject)
		 {
				
			try {
              
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}catch (e) {

              
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}catch (e) {
				
				}
			}
		}
	}
}











