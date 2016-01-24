package com.datasource;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Conn {
	 public Connection getConn() throws SQLException
	 {
	  DataSource ds = null;
	  try {
	   Context ctx = new InitialContext();
	   ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ROOT");
	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	  return ds.getConnection();
	 }
}
