// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Libscons.java

package com.lib.cons;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Libscons
{

	public Libscons()
	{
	}

	public void addCons(String s, String s1, String s2, String s3, String s4, String s5, String s6)
	{
		String s7 = (new StringBuilder()).append("insert into libscons (contitle,contype,concont,adduser,addpart,addtime,readtime) values('").append(s).append("','").append(s1).append("','").append(s2).append("','").append(s3).append("','").append(s4).append("','").append(s5).append("',").append(s6).append(")").toString();
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
					statement.executeUpdate(s7);
					connection.close();
				}
			}
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}

	public String[][] getType(String s)
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
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from libscons where contype = '").append(s).append("'").toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][8];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from libscons where contype = '").append(s).append("' order by ID desc").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("contitle");
						as[j][2] = resultset1.getString("contype");
						as[j][3] = resultset1.getString("concont");
						as[j][4] = resultset1.getString("adduser");
						as[j][5] = resultset1.getString("addpart");
						as[j][6] = resultset1.getString("addtime");
						as[j][7] = resultset1.getString("readtime");
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

	public String[][] getNew()
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
					ResultSet resultset = statement.executeQuery("select count(*) from libscons");
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][8];
					for (ResultSet resultset1 = statement.executeQuery("select * from libscons order by ID desc"); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("contitle");
						as[j][2] = resultset1.getString("contype");
						as[j][3] = resultset1.getString("concont");
						as[j][4] = resultset1.getString("adduser");
						as[j][5] = resultset1.getString("addpart");
						as[j][6] = resultset1.getString("addtime");
						as[j][7] = resultset1.getString("readtime");
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

	public String[][] getId(String s)
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
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from libscons where ID = ").append(s).append("").toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][8];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from libscons where ID = ").append(s).append(" order by ID desc").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("contitle");
						as[j][2] = resultset1.getString("contype");
						as[j][3] = resultset1.getString("concont");
						as[j][4] = resultset1.getString("adduser");
						as[j][5] = resultset1.getString("addpart");
						as[j][6] = resultset1.getString("addtime");
						as[j][7] = resultset1.getString("readtime");
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

	public String[][] getTitle(String s, String s1)
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
					
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from libscons where contitle like '%").append(s).append("%' and contype like '%").append(s1).append("%'").toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][8];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from libscons where contitle like '%").append(s).append("%' and contype like '%").append(s1).append("%' order by ID desc").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("contitle");
						as[j][2] = resultset1.getString("contype");
						as[j][3] = resultset1.getString("concont");
						as[j][4] = resultset1.getString("adduser");
						as[j][5] = resultset1.getString("addpart");
						as[j][6] = resultset1.getString("addtime");
						as[j][7] = resultset1.getString("readtime");
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

	public void upCons(String s, String s1, String s2)
	{
		String s3 = (new StringBuilder()).append("update libscons set contitle = '").append(s).append("', concont = '").append(s1).append("' where ID = ").append(s2).toString();
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

	public void upRedTimes(String s)
	{
		String s1 = (new StringBuilder()).append("update libscons set readtime = readtime + 1 where ID = ").append(s).toString();
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

	public void delCons(String s)
	{
		String s1 = (new StringBuilder()).append("delete from libscons where ID = ").append(s).append("").toString();
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
