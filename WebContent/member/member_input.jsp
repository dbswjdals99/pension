<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>

	#section {width:1000px;height:600px;margin:auto;}
	h2{text-align:center; margin-top:70px;}
	input[type=text], input[type=password] {width:400px;height:40px;border:1px solid silver;font-size:17px;color:black;padding:5px;}
	input[type=submit]{width:412px; height:52px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white;}
	input[type=button]{width:90px; height:42px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white;}
	
</style>



<script>

	function check() // 중복확인을 클릭하면 사용자가 입력한 아이디의 중복여부를 체크하여 알려주는 함수.
	{
		var chk=new XMLHttpRequest();
		var userid=document.mem.userid.value;
		chk.open("get","userid_chk.jsp?userid="+userid);
		chk.send();
		
		chk.onreadystatechange=function()
		{
			if(chk.readyState==4) // 완료된 상태
				{
					//alert(chk.responseText); // 서버에서 가져오는 값
					if(chk.responseText==1 || document.mem.userid.value=="")
						{
							document.getElementById("uk").innerText="사용 불가능한 아이디입니다."
							document.getElementById("uk").style.color="red"
						}
					else
						{
							document.getElementById("uk").innerText="사용 가능한 아이디입니다."
							document.getElementById("uk").style.color="black"
						}
				}
		}
	}
	
</script>



  <div id="section">
  	<form name="mem" method="post" action="member_input_ok.jsp">
  	<h2> 회원가입 </h2>
  		<table width="500" align="center">
  			<tr align="center">
  				<td><input type="text" name="name" placeholder="이름을 입력하세요"></td>
  				<td> &nbsp; </td>
  			</tr>
  			<tr align="center">
  				<td><input type="text" name="userid" placeholder="아이디를 입력하세요">
  					<br><span id="uk"></span>
  				</td>
  				<td><input type="button" onclick="check()" value="중복확인"></td>
  			</tr>
  			<tr align="center">
  				<td><input type="password" name="pwd" placeholder="비밀번호를 입력하세요"></td>
  				<td> &nbsp; </td>
  			</tr>
  			<tr align="center">
  				<td><input type="password" name="pwd2" placeholder="비밀번호를 입력하세요"></td>
  				<td> &nbsp; </td>
  			</tr>
  			<tr align="center">
  				<td><input type="text" name="email" placeholder="이메일을 입력하세요"></td>
  				<td> &nbsp; </td>
  			</tr>
  			<tr align="center">
  				<td><input type="text" name="phone" placeholder="전화번호를 입력하세요"></td>
  				<td> &nbsp; </td>
  			</tr>
  			<tr align="center">
  				<td><input type="submit" value="회원가입"></td>
  				<td> &nbsp; </td>
  			</tr>
  		</table>
  	</form>
  </div>
  
<%@ include file="../bottom.jsp"%>