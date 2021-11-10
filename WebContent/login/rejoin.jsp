<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
	#section {
	width:1000px;
	height:600px;
	margin:auto;
	padding-top:130px;
	}
	
	input[type=text], input[type=password] {width:400px;height:40px;border:1px solid silver;font-size:17px;color:black;padding:5px; margin-bottom:10px;}
	input[type=submit]{width:412px; height:52px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white; margin-bottom:10px;}
	input[type=button]{width:412px; height:52px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white; margin-bottom:10px;}
</style>
  
<div id="section" align="center">
	<form method="post" action="login_ok.jsp">
  		<table>
  			<tr>
  				<td><input type="checkbox" name="re" value="0"><span> 회원탈퇴 신청을 취소 하시려면 체크하고 로그인을 하세요. </span></td>
  			</tr>
  			<tr>
  				<td><input type="text" name="userid" placeholder="아이디를 입력해주세요."></td>
  			</tr>
  			<tr>
  				<td><input type="password" name="pwd" placeholder="비밀번호를 입력해주세요."></td>
  			</tr>
  			<tr>
  				<td><input type="submit" value="로그인"></td>
  			</tr>
  		</table>
  	</form>
</div>
<%@ include file="../bottom.jsp"%>