// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   userinfo.java

package com.lib.sys;

import java.sql.*;
import java.util.Arrays;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.lib.test.Libtest;

public class Userinfo
{

	public Userinfo()
	{
	}

	public void addUser(String s, String s1, String s2, String s3, String s4, String s5)
	{
		String s6 = (new StringBuilder()).append("insert into userinfo (username,userpass,truename,userface,usernumber,userpower) values('").append(s).append("','").append(s1).append("','").append(s2).append("','").append(s3).append("','").append(s4).append("','").append(s5).append("')").toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					 statement.executeUpdate(s6);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public String[][] getUsers(String s)
	{
		String as[][] = (String[][])null;
		int i = 0;
		int j = 0;
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from userinfo ").append(s).toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][7];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from userinfo ").append(s).append(" order by ID").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("username");
						as[j][2] = resultset1.getString("userpass");
						as[j][3] = resultset1.getString("truename");
						as[j][4] = resultset1.getString("userface");
						as[j][5] = resultset1.getString("usernumber");
						as[j][6] = resultset1.getString("userpower");
						j++;
					}

					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		return as;
	}

	public String[][] getMe(String s)
	{
		String as[][] = (String[][])null;
		int i = 0;
		int j = 0;
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from userinfo where username = '").append(s).append("'").toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][7];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from userinfo where username = '").append(s).append("'").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("username");
						as[j][2] = resultset1.getString("userpass");
						as[j][3] = resultset1.getString("truename");
						as[j][4] = resultset1.getString("userface");
						as[j][5] = resultset1.getString("usernumber");
						as[j][6] = resultset1.getString("userpower");
						j++;
					}

					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		return as;
	}

	public String[][] getCheck(String s)
	{
		String as[][] = (String[][])null;
		int i = 0;
		int j = 0;
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from userinfo where username like '%").append(s).append("%'").toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][7];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from userinfo where username like '%").append(s).append("%'").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("username");
						as[j][2] = resultset1.getString("userpass");
						as[j][3] = resultset1.getString("truename");
						as[j][4] = resultset1.getString("userface");
						as[j][5] = resultset1.getString("usernumber");
						as[j][6] = resultset1.getString("userpower");
						j++;
					}

					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		return as;
	}

	public String[][] getID(String s)
	{
		String as[][] = (String[][])null;
		int i = 0;
		int j = 0;
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from userinfo where ID = ").append(s).toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][7];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from userinfo where ID = ").append(s).toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("username");
						as[j][2] = resultset1.getString("userpass");
						as[j][3] = resultset1.getString("truename");
						as[j][4] = resultset1.getString("userface");
						as[j][5] = resultset1.getString("usernumber");
						as[j][6] = resultset1.getString("userpower");
						j++;
					}

					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		return as;
	}

	public void upUsers(String s, String s1, String s2)
	{
		String s3 = (new StringBuilder()).append("update userinfo set username = '").append(s).append("', truename = '").append(s1).append("' where ID = ").append(s2).toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					statement.executeUpdate(s3);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public void upPass(String s, String s1)
	{
		String s2 = (new StringBuilder()).append("update userinfo set userpass = '").append(s).append("' where ID = ").append(s1).toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					statement.executeUpdate(s2);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public void upMepass(String s, String s1)
	{
		String s2 = (new StringBuilder()).append("update userinfo set userpass = '").append(s).append("' where username = '").append(s1).append("'").toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					statement.executeUpdate(s2);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public void upMyface(String s, String s1)
	{
		String s2 = (new StringBuilder()).append("update userinfo set userface = '").append(s).append("' where username = '").append(s1).append("'").toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					statement.executeUpdate(s2);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public void upMynumber(String s, String s1)
	{
		String s2 = (new StringBuilder()).append("update userinfo set usernumber = '").append(s).append("' where username = '").append(s1).append("'").toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					statement.executeUpdate(s2);
//					statement.executeQuery(s2);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public void delUser(String s)
	{
		String s1 = (new StringBuilder()).append("delete from userinfo where ID = ").append(s).toString();
		try
		{
			InitialContext initialcontext = new InitialContext();
			if (initialcontext == null)
				throw new Exception("Boom - No Context");
			DataSource datasource = (DataSource)initialcontext.lookup("java:comp/env/jdbc/ROOT");
			if (datasource != null)
			{
				Connection connection = datasource.getConnection();
				if (connection != null)
				{
					Statement statement = connection.createStatement();
					statement.executeUpdate(s1);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}
	
}
