package pension.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDao {
	Connection conn;

	// 생성자
	public BoardDao() throws Exception {
		// DB연결
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/pension";
		conn = DriverManager.getConnection(url, "root", "1234");
	}

	// 글쓰기
	public void write_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 폼의 입력값을 가져오기
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		int sung = Integer.parseInt(request.getParameter("sung"));
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String pwd = request.getParameter("pwd");
		String birth = year + "-" + month + "-" + day;

		// 취미 값 가져오기
		String[] hobby = request.getParameterValues("hobby");

		// hobby라는 배열에 있는 값을 -> 문자열의 형태로 변경
		String hob = "";
		for (int i = 0; i < hobby.length; i++) {
			hob = hob + hobby[i] + ",";
		}

		int bimil;
		if (request.getParameter("bimil") == null) {
			bimil = 0;
		} else {
			bimil = Integer.parseInt(request.getParameter("bimil"));
		}

		// 쿼리생성
		String sql = "insert into board(title,name,content,sung,birth,hobby,bimil,writeday,pwd) values(?,?,?,?,?,?,?,now(),?)";
		// for (int i = 1; i <= 2579; i++)
		// {
		// 심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, name);
		pstmt.setString(3, content);
		pstmt.setInt(4, sung);
		pstmt.setString(5, birth);
		pstmt.setString(6, hob);
		pstmt.setInt(7, bimil);
		pstmt.setString(8, pwd);

		// 쿼리실행
		pstmt.executeUpdate();
		// }

		// 종료
		pstmt.close();
		conn.close();

		// 이동
		response.sendRedirect("list.jsp");
	}

	public ArrayList<BoardDto> list(HttpServletRequest request) throws Exception {
		// 페이징 처리를 위해서
		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int index = (page - 1) * 10;

		// 쿼리생성
		String sql = "select * from board order by id desc limit ?,10";

		// 심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, index);

		// 전달할 객체 생성(list.jsp 로 전달)
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();

		// 쿼리실행
		ResultSet rs = pstmt.executeQuery();

		// rs.last(); 마지막 레코드로 이동
		// rs.getRow(); 레코드 갯수를 가져온다.
		// rs.first();
		// rs.beforeFirst();

		// rs에 있는 레코드를 Dto에 담고 list에 추가
		// Dto에 모든 필드 -> list에 출력하는 필드만 담아도 된다.
		while (rs.next()) 
		{
			BoardDto bdto = new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setName(rs.getString("name"));
			bdto.setTitle(rs.getString("title"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setBimil(rs.getInt("bimil"));
			bdto.setWriteday(rs.getString("writeday"));

			list.add(bdto);
		}

		// close
		rs.close();
		pstmt.close();

		return list;
	}

	// page, pstart, pend, chong 구하기 (메소드를 따로)
	public Number getnumber(HttpServletRequest request) throws Exception {
		int page;
		if (request.getParameter("page") == null) 
		{
			page = 1;
		} else 
		{
			page = Integer.parseInt(request.getParameter("page"));
		}

		// pstart 와 pend 구하기
		int pstart = page / 10;
		if (page % 10 == 0) 
		{
			pstart = pstart - 1;
		}
		
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;

		// chong 구하기
		String sql = "select ceil(count(*)/10) as chong from board";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int chong = rs.getInt("chong");

		if (pend > chong) {
			pend = chong;
		}

		Number num = new Number();
		num.setPage(page);
		num.setPstart(pstart);
		num.setPend(pend);
		num.setChong(chong);

		conn.close();

		return num;
	}

	public void readnum(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sql = "update board set readnum=readnum+1 where id=?";

		String id = request.getParameter("id");
		String page = request.getParameter("page");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		pstmt.executeUpdate();

		pstmt.close();
		conn.close();

		// 이동
		response.sendRedirect("content.jsp?id="+id+"&page="+page);
	}
	
	public BoardDto content(HttpServletRequest request) throws Exception
	{
		String sql = "select * from board where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		// rs -> Dto
		BoardDto bdto = new BoardDto();
		bdto.setId(rs.getInt("id"));
		bdto.setName(rs.getString("name"));
		bdto.setTitle(rs.getString("title"));
		bdto.setContent(rs.getString("content").replace("\r\n", "<br>"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setBimil(rs.getInt("bimil"));
		bdto.setSung(rs.getInt("sung"));
		bdto.setBirth(rs.getString("birth"));
		bdto.setWriteday(rs.getString("writeday"));
		
		// 취미를 읽어와서 문자로 변경후에 setter
		String[] hobby = rs.getString("hobby").split(",");
		String str="";
		for (int i=0; i < hobby.length; i++)
		{
			switch (hobby[i])
			{
				case "0": str = str + " 낚시"; break;
				case "1": str = str + " 여행"; break;
				case "2": str = str + " 운동"; break;
				case "3": str = str + " 독서"; break;
				case "4": str = str + " 음악"; break;
			}
		}
		
		bdto.setHobby(str);
		return bdto;
	}
	
	// 비밀글 비밀번호 체크
	public void bimil_check(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String page = request.getParameter("page");
		
		// 쿼리생성
		String sql = "select count(*) as num from board where pwd=? and id=?";
		
		// 심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, id);
		
		// 실행
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		if (rs.getInt("num") == 0)
		{
			response.sendRedirect("list.jsp");
		}
		else
		{
			response.sendRedirect("readnum.jsp?id=" + id+"&page="+page);
		}
	}
	
	public BoardDto update(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		
		String sql = "select * from board where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		// rs -> Dto
		BoardDto bdto = new BoardDto();
		bdto.setId(rs.getInt("id"));
		bdto.setName(rs.getString("name"));
		bdto.setTitle(rs.getString("title"));
		bdto.setContent(rs.getString("content"));
		bdto.setBimil(rs.getInt("bimil"));
		bdto.setSung(rs.getInt("sung"));
		bdto.setBirth(rs.getString("birth"));
		bdto.setHobby(rs.getString("hobby"));
		
		return bdto;
	}
	
	// 수정하기
	public void update_ok(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		// 폼에 입력값을 가져오기
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String page=request.getParameter("page");
		String pwd1=getpwd(id);
	 
		if(pwd.equals(pwd1))
	    {
		  String title=request.getParameter("title");
		  String name=request.getParameter("name");
		  String content=request.getParameter("content");
		  int sung=Integer.parseInt(request.getParameter("sung"));
		  String year=request.getParameter("year");
		  String month=request.getParameter("month");
		  String day=request.getParameter("day");
		  String birth=year+"-"+month+"-"+day;
		  String[] hobby=request.getParameterValues("hobby"); // form태그에 name이 같은게 2개 이상일경우 가져오는 방법
		
	  	  // hobby라는 배열에 있는 값을  => 문자열의 형태
		  String hob="";
		  for(int i=0;i<hobby.length;i++)
		  {
		  	 hob=hob+hobby[i]+",";
		  }
				
		  //System.out.println(hob);
				
		  int bimil; // 비밀글 체크를 안했을경우 처리
		  if(request.getParameter("bimil")==null)
		  {
			bimil=0;
		  }
		  else
		  {
			bimil=Integer.parseInt(request.getParameter("bimil"));
		  }
				
		  String sql="update board set name=?,title=?,content=?,bimil=?";
		  sql=sql+",sung=?,birth=?,hobby=? where id=?";
		
		  PreparedStatement pstmt=conn.prepareStatement(sql);
		  pstmt.setString(1, name);
		  pstmt.setString(2, title);
		  pstmt.setString(3, content);
		  pstmt.setInt(4, bimil);
		  pstmt.setInt(5, sung);
		  pstmt.setString(6, birth);
		  pstmt.setString(7, hob);
		  pstmt.setString(8, id);
		
		  pstmt.executeUpdate();
		
		  pstmt.close();
		  conn.close();
		
		  response.sendRedirect("content.jsp?id="+id+"&page="+page);
	    }
	    else
	    {
	 	  response.sendRedirect("update.jsp?id="+id+"&page="+page);	
	    }
	}
	
	// 테이블에서 비밀번호를 가져오기
	public String getpwd(String id) throws Exception
	{
		String sql="select pwd from board where id=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		String pwd=rs.getString("pwd");
		
		rs.close();
		pstmt.close();
		
		return pwd;
	}
	
	// 삭제
	public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		// 폼에 입력값을 가져오기
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String page=request.getParameter("page");
		String pwd1=getpwd(id);
	 
		if(pwd.equals(pwd1))
	    {
	        String sql="delete from board where id=?";
	        PreparedStatement pstmt=conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        
	        pstmt.executeUpdate();
	        
	        pstmt.close();
	        conn.close();
	        
	        response.sendRedirect("list.jsp?page="+page);
	    }
		else
		{
			conn.close();
			response.sendRedirect("content.jsp?id="+id+"&page="+page);
		}
	}
	
	public ArrayList<BoardDto> list_index2() throws Exception 
	{
		
		String sql = "select * from board order by id desc limit 5";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ArrayList<BoardDto> list = new ArrayList<BoardDto>();

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) 
		{
			BoardDto bdto = new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setName(rs.getString("name"));
			bdto.setTitle(rs.getString("title"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setBimil(rs.getInt("bimil"));
			bdto.setWriteday(rs.getString("writeday"));

			list.add(bdto);
		}
		
		return list;
	}
}





















