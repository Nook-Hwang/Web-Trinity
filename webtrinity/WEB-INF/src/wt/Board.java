package wt;

import java.sql.*;

public class Board 
{
	String dbUrl  = "jdbc:mysql://192.168.0.47/wt?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	String dbId   = "root";
	String dbPass = "mySQL1234";
	
	Connection        conn;
	PreparedStatement pStmt;
	ResultSet         rs;
		
	public String getVersion()
	{
		return "Java Beans Board v1.0";
	}
	
	//MySQL 연결을 위한 라이브러리를 로딩한다.
	protected boolean LoadDriver() 
	{		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("try loadDriver");
		}catch(Exception e)
		{			
			System.out.println("ERROR from LoadDriver() in Board.java : " + e.getMessage());
			return false;
		}
		System.out.println("driver loaded");
		return true;		
	}
	
	//MySQL에 접속한다.
	public boolean DBOpen()
	{
		if(LoadDriver() == false)
		{
			return false;
		}
		try
		{			
			conn = DriverManager.getConnection( dbUrl, dbId ,dbPass );
			System.out.println("try DBOpen");
		}
		catch (SQLException e)
		{
			System.out.println("ERROR from  DBOpen() in Board.java :  " + e.getMessage());
			return false;
		}
		System.out.println("DB opened");
		return true;
	}
	
	//MySQL 접속을 종료한다.
	public void DBClose()
	{
		try
		{
			conn.close();
			System.out.println("DB closed");
		}
		catch (SQLException e)
		{
			System.out.println("ERROR from DBClose() in Board.java :" + e.getMessage());
			return;
		}		
	}
	
	//Query를 수행한다. for SELECT
	public boolean OpenQuery(String pSQL)
	{
		try
		{
			pStmt= conn.prepareStatement(pSQL,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = pStmt.executeQuery();	
			System.out.println("try OpenQuery");
		}
		catch (SQLException e)
		{
			System.out.println("ERROR from OpenQuery(String pSQL) in Board.java :" + e.getMessage());
			return false;
		}
		System.out.println("query opened");
		return true;
	}
	
	//Query를 종료한다.
	public void CloseQuery()
	{
		try
		{		
			//검색된 결과를 닫는다.
			rs.close();
	
			//stmt 를 닫는다.
			pStmt.close();
			System.out.println("query closed");
		}
		catch (SQLException e)
		{
			System.out.println("ERROR from CloseQuery() in Board.java :" + e.getMessage());
			return;
		}				
	}
	
	//다음 레코드로 이동한다.
	public boolean ResultNext()
	{
		try
		{
			System.out.println("return ResultNext ");	
			return rs.next();			
		}
		catch (SQLException e)
		{
			System.out.println("ERROR  from ResultNext() in Board.java :" + e.getMessage());
			return false;
		}		
	}
	
	//레코드의 값을 얻는다.
	public String getString(String pName)
	{
		try
		{
			System.out.println("return getString(String pName)");	
			return rs.getString(pName);
		}
		catch (SQLException e)
		{
			System.out.println("ERROR  from getString(String pName) in Board.java :" + e.getMessage());
			System.out.println(e);
			return null;
		}			
	}
	
	//레코드의 값을 얻는다.
	public int getInt(String pName)
	{
		try
		{	
			System.out.println("return getInt(String pName)");	
			return Integer.parseInt(rs.getString(pName));
		}
		catch (SQLException e)
		{
			System.out.println("ERROR  from getInt(String pName) in Board.java :" + e.getMessage());
			return 0;
		}			
	}	
	
	//Insert, Delete, Update 처리용 함수
	public boolean Execute(String pSQL)
	{		
		
		try
		{		
			pStmt  = conn.prepareStatement(pSQL,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			pStmt.executeUpdate();
			//pStmt 를 닫는다.
			pStmt.close();
			System.out.println("Execute(String pSQL)");
		}
		catch (SQLException e)
		{
			System.out.println("ERROR from Execute(String pSQL) in Board.java :" + e.getMessage());
			return false;
		}
		System.out.println("END Execute(String pSQL)");
		return true;
	}
	
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub

	}

}
