package pension.gongji;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GongjiDao {

	Connection conn;
	
	// 생성자
	public GongjiDao() throws Exception
	{
		// DB연결
	    Class.forName("com.mysql.jdbc.Driver");
	    String url="jdbc:mysql://localhost:3306/pension";
	    conn=DriverManager.getConnection(url,"root","1234");
	}
	
	
	
	// 공지사항 입력하기
	public void write_ok(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 입력된 값 가져오기
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		// 쿼리작성
		String sql="insert into gongji(title,content,writeday) values(?,?,now())";
		
		// 심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		
		// 쿼리실행
		pstmt.executeUpdate();
		
		// close
		pstmt.close();
		conn.close();
		
		// 이동
		response.sendRedirect("list.jsp");
	}
	
	
	
	// 공지사항 list 가져오기
	public ArrayList<GongjiDto> list() throws Exception
	{
		// 쿼리
		String sql="select * from gongji order by id desc";
		
		// 심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		// 쿼리 실행
		ResultSet rs=pstmt.executeQuery();
		
		// 레코드를 Dto에 담은 후 ArrayList에 계속 추가
		ArrayList<GongjiDto> list=new ArrayList<GongjiDto>();
		
		// 하나의 레코드를 Dto에 담고 ArrayList에 추가
		while(rs.next())
		{
			GongjiDto gdto=new GongjiDto();
			gdto.setId(rs.getInt("id"));
			gdto.setTitle(rs.getString("title"));
			gdto.setContent(rs.getString("content"));
			gdto.setReadnum(rs.getInt("readnum"));
			gdto.setWriteday(rs.getString("writeday"));
			
			list.add(gdto);
		}
		
		return list;
	}
	
	
	
	// 조회수 증가
	public void readnum(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// id값
		int id=Integer.parseInt(request.getParameter("id"));
		
		// 쿼리생성
		String sql="update gongji set readnum=readnum+1 where id=?";
		
		// 심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		// 쿼리실행
		pstmt.executeUpdate();
		
		// close
		pstmt.close();
		conn.close();
		
		// content로 이동
		response.sendRedirect("content.jsp?id="+id);
	}
	
	
	
	// 하나의 레코드를 읽어오기
	public GongjiDto content(HttpServletRequest request) throws Exception
	{
		// id값
		int id=Integer.parseInt(request.getParameter("id"));
		
		// 쿼리생성
		String sql="select * from gongji where id=?";
		
		// 심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		// 쿼리실행
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		// 하나의 레코드를 하나의 Dto로에 전달
		GongjiDto gdto=new GongjiDto();
		gdto.setId(rs.getInt("id"));
		gdto.setTitle(rs.getString("title"));
		gdto.setContent(rs.getString("content").replace("\r\n","<br>"));
		gdto.setReadnum(rs.getInt("readnum"));
		gdto.setWriteday(rs.getString("writeday"));
		
		return gdto;
	}
	
	// 메인페이지의 나타내는 리스트목록
		public ArrayList<GongjiDto> list_index() throws Exception
		{
			// 쿼리
			String sql="select * from gongji order by id desc limit 5";
			
			// 심부름꾼
			PreparedStatement pstmt=conn.prepareStatement(sql);
			
			// 쿼리 실행
			ResultSet rs=pstmt.executeQuery();
			
			// 레코드를 Dto에 담은 후 ArrayList에 계속 추가
			ArrayList<GongjiDto> list=new ArrayList<GongjiDto>();
			
			// 하나의 레코드를 Dto에 담고 ArrayList에 추가
			while(rs.next())
			{
				GongjiDto gdto=new GongjiDto();
				gdto.setId(rs.getInt("id"));
				gdto.setTitle(rs.getString("title"));
				gdto.setContent(rs.getString("content"));
				gdto.setReadnum(rs.getInt("readnum"));
				gdto.setWriteday(rs.getString("writeday"));
				
				list.add(gdto);
			}
			
			return list;
		}
}



























