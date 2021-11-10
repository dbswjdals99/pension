package pension.tour;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TourDao {
	
	Connection conn;
	
	// 생성자
	public TourDao()throws Exception
	{
		// DB연결
	    Class.forName("com.mysql.jdbc.Driver");
	    String url="jdbc:mysql://localhost:3306/pension";
	    conn=DriverManager.getConnection(url,"root","1234");
	}
	
	public void write_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		String path = request.getRealPath("/tour/img"); // 상대경로
		// String path2 = "D:\\AmStudy\\java2\\pension\\WebContent\\tour\\img"; // 절대경로
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		// 하나이상의 그림파일의 이름을 합쳐서 -> 하나의 문자열로(그림파일1, 그림파일2)
		Enumeration file = multi.getFileNames(); // 여러개의 파일을 업로드할때 파일이름을 가지고온다.
		
		String fname="";
		while (file.hasMoreElements())
		{
			fname = fname + multi.getFilesystemName(file.nextElement().toString()) + ",";
		}
		//System.out.println(fname);
		
		String sql="insert into tour(userid,title,content,fname,writeday) values(?,?,?,?,now())";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		pstmt.setString(2, multi.getParameter("title"));
		pstmt.setString(3, multi.getParameter("content"));
		pstmt.setString(4, fname);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list.jsp");
	}
	
	//tour 테이블의 내용을 가져오기
	public ArrayList<TourDto> list() throws Exception
	{
		String sql="select tour.*,member.name from tour,member where tour.userid=member.userid order by id desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<TourDto> list = new ArrayList<TourDto>();
		//rs -> dto에 담기
		while(rs.next())
		{
			TourDto tdto = new TourDto();
			tdto.setId(rs.getInt("id"));
			tdto.setUserid(rs.getString("userid"));
			tdto.setTitle(rs.getString("title"));
			tdto.setContent(rs.getString("content"));
			tdto.setFname(rs.getString("fname"));
			tdto.setWriteday(rs.getString("writeday"));
			tdto.setName(rs.getString("name"));
			
			list.add(tdto);
		}
		
		return list;
	}
	
	public TourDto content(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		
		String sql="select * from tour where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		// rs -> Dto에 담기
		TourDto tdto = new TourDto();
		tdto.setUserid(rs.getString("userid"));
		tdto.setTitle(rs.getString("title"));
		tdto.setContent(rs.getString("content"));
		
		// fname의 문자열을 -> , 구분자로 나누어서 배열로 처리
		String[] fname2 = rs.getString("fname").split(",");
		tdto.setFname2(fname2);
		tdto.setWriteday(rs.getString("writeday"));
		tdto.setId(rs.getInt("id"));
		
		return tdto;
	}
	
	public TourDto update(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		
		String sql = "select * from tour where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		// rs -> Dto에 담기
		TourDto tdto = new TourDto();
		tdto.setUserid(rs.getString("userid"));
		tdto.setTitle(rs.getString("title"));
		tdto.setContent(rs.getString("content"));
		tdto.setWriteday(rs.getString("writeday"));
		tdto.setId(rs.getInt("id"));
		String[] fname2 = rs.getString("fname").split(",");
		tdto.setFname2(fname2);
		
		return tdto;
	}
	
	public void update_ok(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String path = request.getRealPath("/tour/img"); // 상대경로
		// String path2 = "D:\\AmStudy\\java2\\pension\\WebContent\\tour\\img"; // 절대경로
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		String[] del=multi.getParameter("del").split(",");
		for(int i=0;i<del.length;i++)
		{
			File file=new File(path+"/"+del[i]);
			file.delete();
		}
		// 하나이상의 그림파일의 이름을 합쳐서 -> 하나의 문자열로(그림파일1, 그림파일2)
		Enumeration file = multi.getFileNames(); // 여러개의 파일을 업로드할때 파일이름을 가지고온다.
		
		String fname="";
		while (file.hasMoreElements())
		{
			fname = fname + multi.getFilesystemName(file.nextElement().toString()) + ",";
		}	
		System.out.println(fname);
		// 새로 추가한 그림 + 기존 그림중에 삭제하지 않은 그림과 합하기;
		fname = fname + multi.getParameter("imsi");
		String sql = "update tour set title=?, content=?, fname=? where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, multi.getParameter("title"));
		pstmt.setString(2, multi.getParameter("content"));
		pstmt.setString(3, fname.replace("null", ""));
		pstmt.setString(4, multi.getParameter("id"));
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("content.jsp?id="+multi.getParameter("id"));
	}
	
	public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id = request.getParameter("id");
		
		String sql = "delete from tour where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list.jsp");
	}
	
	public ArrayList<TourDto> list_index3() throws Exception
	{
		String sql="select tour.*,member.name from tour,member where tour.userid=member.userid order by id desc limit 1,5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<TourDto> list = new ArrayList<TourDto>();
		//rs -> dto에 담기
		while(rs.next())
		{
			TourDto tdto = new TourDto();
			tdto.setId(rs.getInt("id"));
			tdto.setUserid(rs.getString("userid"));
			tdto.setTitle(rs.getString("title"));
			tdto.setContent(rs.getString("content"));
			tdto.setFname(rs.getString("fname"));
			tdto.setWriteday(rs.getString("writeday"));
			tdto.setName(rs.getString("name"));
			
			list.add(tdto);
		}
		
		return list;
	}
}


























