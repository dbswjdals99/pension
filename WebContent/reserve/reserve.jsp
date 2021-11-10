<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ page import="java.time.LocalDate" %>
<%@ page import="pension.reserve.ReserveDao" %> 
<%
	// 달력을 위해서 필요한 값  => 1일의 요일, 총일수, 몇주  
	// 현재 시스템의 시간에 따른 이번달 달력 만들기
	
	// 이전, 다음 클릭시 요청되는 년,월에 해당되는 값으로 변경
	
	int y,m;
	if(request.getParameter("y") == null)
	{
		LocalDate today=LocalDate.now(); // 이번달의 년,월의 값을 구하기
		y=today.getYear();
		m=today.getMonthValue();
	}
	else
	{
		y=Integer.parseInt(request.getParameter("y"));
		m=Integer.parseInt(request.getParameter("m"));
	}
	
	// 시스템의 년,월,1 이날짜의 객체를 만들어서 필요한 값을 가져온다
	LocalDate xday=LocalDate.of(y,m,1);
	// 1일의 요일
	int yoil=xday.getDayOfWeek().getValue();  // 1~7 => 일요일을 0으로 처리
	if(yoil==7)
	 yoil=0;
	// 총일수
	int chong=xday.lengthOfMonth();
	// 몇주
	int ju=(int)Math.ceil( (yoil+chong)/7.0 );
	
	// jstl => 변수의 값을 내장객체 영역으로 저장
	request.setAttribute("yoil", yoil);
	request.setAttribute("chong", chong);
	request.setAttribute("ju", ju);
	request.setAttribute("y", y);
	request.setAttribute("m", m);
	
	// 방의 정보를 읽어오기
	ReserveDao rdao=new ReserveDao();
	request.setAttribute("list", rdao.getRoom());
%>   
<style>
	#section {
	width:1800px;
	height:1500px;
	margin:auto;
	}
	
	#content_text {
	position:relative;
	top:-380px;
	left:-600px;
	color:white;
	font-size:150px;
	text-shadow:4px 4px 0px gray;
	}
	
	#content {
	width: 2100;
	height: 400px;
	margin-bottom: 50px;
	position:relative;
	}
	
	#calender_color{
	font-size:18px;
	font-weight:bold;
	vertical-align:top;
	}
	
	#calender_head{
	font-weight:bold;
	font-size:18px;
	color:gray;
	text-align:center;
	}
	
	#calender_head td{
	height:40px;
	}
	
	.calender_table td{
	border:1px solid silver;
	border-collapse:collapse;
	width:200px;
	height:100px;
	}
	
	#room_name{
	text-align:center;
	margin:auto;
	text-decoration:none;
	color:gray;
	}
	
	#room_name:hover{
	background:silver;
	}
	
	
</style>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Reserve </div>
</div>
<div id="section">
	<table align="center" class="calender_table">
	<caption>
		<h3>
		<c:if test="${m != 1}">
			<a href="reserve.jsp?y=${y}&m=${m-1}">이전</a>
		</c:if>
		<c:if test="${m == 1}">
			<a href="reserve.jsp?y=${y-1}&m=12">이전</a>
		</c:if>
			${y}년 ${m}월
		<c:if test="${m != 12}">
			<a href="reserve.jsp?y=${y}&m=${m+1}">다음</a>
		</c:if>
		<c:if test="${m == 12 }">
			<a href="reserve.jsp?y=${y+1}&m=1">다음</a>
		</c:if>
		</h3>
	</caption>
	<tr id="calender_head">
		<td style="color:red;">일</td>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td style="color:blue;">토</td>
	</tr>
	<c:set var="day" value="1"/>
      <c:forEach var="i" begin="1" end="${ju}">
       <tr>
        <c:forEach var="j" begin="0" end="6">
         <c:if test="${ (yoil>j && i==1) || (chong < day) }"> 
          <td> &nbsp; </td>
         </c:if>
         <c:if test="${ !((yoil>j && i==1) || (chong < day)) }">
          <td>
            ${day} <p>
          <!-- 달력의 날짜랑 오늘날짜를 비교를 해서 지난 날짜 td에는 방의 이름이 출력 -->
          <%
              int day2=Integer.parseInt(pageContext.getAttribute("day").toString());
              //out.print(y+" "+m+" "+day2);
              //java.util.Date tt=new java.util.Date(y-1900,m-1,day2);
              //out.print(tt.getYear()+" "+tt.getMonth()+" "+tt.getDate());
              
          %>
           <fmt:formatDate var="tday" value="<%=new java.util.Date()%>" pattern="yyyyMMdd" />
           <fmt:formatDate var="calday" value="<%=new java.util.Date(y-1900,m-1,day2) %>" pattern="yyyyMMdd"/>  
           <c:if test="${tday <= calday}"> <!-- 날짜비교 -->
            <c:forEach items="${list}" var="rdto"> <!-- 방 출력되는 for -->
              <!-- 년월일,방의 정보  => 예약 가능여부를 판단 -->
              <c:set var="rid" value="${rdto.id}"/>
              <%
                  String dday=y+"-"+m+"-"+pageContext.getAttribute("day");
                  //out.print(dday);
                  String rid=pageContext.getAttribute("rid").toString();
                  //out.print(rid);
                  int chk=rdao.getempty(dday,rid);
                  
                  request.setAttribute("chk", chk);
              %>
             <c:if test="${chk == 1}"> 
              <span style="color:red"> ${rdto.name} </span><br>
             </c:if>
             <c:if test="${chk == 0}"> 
              <a href="reserve_next.jsp?y=${y}&m=${m}&day=${day}&id=${rdto.id}" id="room_name"> ${rdto.name} </a><br>
             </c:if> 
            </c:forEach>  <!--방출력 끝 -->
           </c:if>
          </td>
          <c:set var="day" value="${day+1}"/>
         </c:if>
        </c:forEach>
       </tr>
      </c:forEach>
	
	</table>
</div>
<%@ include file="../bottom.jsp"%>