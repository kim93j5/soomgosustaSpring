function setCookie( cookieName, cookieValue, expireDate )
 {
  deleteCookie(cookieName);
  var today = new Date();
  today.setDate( today.getDate() + parseInt( expireDate ) );
  document.cookie = escape(cookieName) + "=" + escape(cookieValue) + "; path=/; expires=" + today.toGMTString() + ";";
 }

function displayCookieList(){
   var str = "";
   var cookielist = new Array();
   if(document.cookie == ""){
	   str = "입력된 쿠키가 없습니다.";
   }else{
	   var cookies = document.cookie.split("; ");
       
    for(var i = 0; i < cookies.length; i++){
    	cookielist.push(unescape(cookies[i].split("=")[1]));
     } 
   }

   return cookielist;
}

function deleteCookie(cookieName) {
	  var date = new Date();
      date.setDate(date.getDate() - 1);

	  document.cookie = escape(cookieName) + "=" + escape(cookieName) + "; path=/; expires=" + date.toGMTString() + ";";
	
	console.log(displayCookieList());
}