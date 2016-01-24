// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   libnums.java

package com.lib.sys;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Libnums
{

	public Libnums()
	{
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
					ResultSet resultset = statement.executeQuery((new StringBuilder()).append("select count(*) from libnums where ID = ").append(s).append("").toString());
					if (resultset.next())
						i = resultset.getInt(1);
					as = new String[i][2];
					for (ResultSet resultset1 = statement.executeQuery((new StringBuilder()).append("select * from libnums where ID = ").append(s).append(" order by ID desc").toString()); resultset1.next();)
					{
						as[j][0] = resultset1.getString("ID");
						as[j][1] = resultset1.getString("ids");
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

	public void upRedTimes(String s)
	{
		String s1 = (new StringBuilder()).append("update libnums set ids = ids + 1 where ID = ").append(s).toString();
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
					statement.executeQuery(s1);
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
