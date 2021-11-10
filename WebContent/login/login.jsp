<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
	#section {width:1000px;height:600px; margin:auto;}
	#userid_search{display:none;}
	#pwd_search{display:none; margin-bottom:100px;}
	h2{text-align:center; margin-top:150px;}
	input[type=text], input[type=password] {width:400px;height:40px;border:1px solid silver;font-size:17px;color:black;padding:5px; margin-bottom:10px;}
	input[type=submit]{width:412px; height:52px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white; margin-bottom:10px;}
	input[type=button]{width:412px; height:52px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white; margin-bottom:10px;}
	.idpwd{cursor:pointer;}
	.idpwd:hover{opacity:0.4;}
	#view_userid{margin-bottom:20px; width:414px;}
	#table_bottom{border-bottom:1px solid black;}
</style>
<script>

	function view_us()
	{
		document.getElementById("userid_search").style.display="block";
	}
	
	// 이름, 이메일을 가지고 서버에가서 아이디를 찾아오기.
	function userid_search_fn()
	{
		var name=document.userid_search.name.value;
		var email=document.userid_search.email.value;
		var us=new XMLHttpRequest();
		us.open("get","userid_search_ok.jsp?name="+name+"&email="+email);
		us.send();
		us.onreadystatechange=function()
		{
			if(us.readyState==4)
				{
					if(us.responseText==0)
					{
						alert("이름 혹은 이메일이 틀립니다.")
					}
					else
					{
						document.getElementById("userid_search").style.display="none";
						document.getElementById("view_userid").innerText="당신의 아이디는"+us.responseText+" 입니다.";
						document.getElementById("view_userid").style.borderBottom="1px solid black";
						document.getElementById("view_userid").style.paddingBottom="20px";
					}
				}
		}
	}
	
	function view_pwd()
	{
		document.getElementById("pwd_search").style.display="block";
	}
	
	function pwd_search_fn()
	{
		var userid=document.pwd_search.userid.value;
		var email=document.pwd_search.email.value;
		var name=document.pwd_search.name.value;
		var us=new XMLHttpRequest();
		us.open("get","pwd_search_ok.jsp?userid="+userid+"&email="+email+"&name="+name);
		us.send();
		us.onreadystatechange=function()
		{
			if(us.readyState==4)
				{
					if(us.responseText==0)
					{
						alert("아이디 또는 이메일이 틀립니다.")
					}
					else
					{
						document.getElementById("pwd_search").style.display="none";
						document.getElementById("view_pwd").innerText="당신의 비밀번호는"+us.responseText+" 입니다.";
					}
				}
		}
	}
</script>
<h2>로그인</h2>
<div id="section" align="center">
  	<form method="post" action="login_ok.jsp">
  		<table>
  			<tr>
  				<td><input type="text" name="userid" placeholder="아이디를 입력해주세요."></td>
  			</tr>
  			<tr>
  				<td><input type="password" name="pwd" placeholder="비밀번호를 입력해주세요."></td>
  			</tr>
  			<tr>
  				<td><input type="submit" value="로그인"></td>
  			</tr>
  			<tr align="center">
  				<td><span onclick="view_us()" class="idpwd">아이디 찾기</span> | <span onclick="view_pwd()" class="idpwd">비밀번호 찾기</span></td>
  			</tr>
  			<tr>
  				<td id="table_bottom">&nbsp;</td>
  			</tr>
  		</table>
  	</form>
  	<br>
  	<div id="view_userid">
	  	<form name="userid_search" id="userid_search" method="post" action="userid_search_ok.jsp">
	  		<input type="text" name="name" placeholder="이름"> <br>
	  		<input type="text" name="email" placeholder="이메일"> <br>
	  		<input type="button" value="아이디찾기" onclick="userid_search_fn()">
	  	</form>
  	</div>
  	<br>
  	<div id="view_pwd">
	  	<form name="pwd_search" id="pwd_search" method="post" action="pwd_search_ok.jsp">
	  		<input type="text" name="name" placeholder="이름"> <br>
	  		<input type="text" name="userid" placeholder="아이디"> <br>
	  		<input type="text" name="email" placeholder="이메일"> <br>
	  		<input type="button" value="비밀번호찾기" onclick="pwd_search_fn()">
	  	</form>
  	</div>
</div>
  
<%@ include file="../bottom.jsp"%>