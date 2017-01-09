package com.ctbri.vSearch.controller;

import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.HashSet;

public class neo4jJdbc {

	private static Connection con;

	static {
		try {
			Class.forName("org.neo4j.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:neo4j://27.148.153.187:7474/", "neo4j", "nlp4");
		} catch (ClassNotFoundException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	public static void getCategory(String word) throws SQLException {

		String query = "match(a{content:'" + word + "'}) return a.category";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println();
			while (rs.next()) {
				System.out.println(rs.getString(1));
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}
	}

	public static void searchKnowledge(String word) throws SQLException{
		String query = "MATCH (n {content:'"+word+"'} )-[r1]->(f1) "
				+"where f1.category = 'person' "
				+"RETURN r1 as dis, f1 as layernode "
				+"ORDER BY r1.weight DESC limit 2 "
				+"UNION "
				+"MATCH (n{content:'"+word+"'})-[r2]->(f2) "
				+"where f2.category = 'location' "
				+"RETURN r2 as dis, f2 as layernode "
				+"ORDER BY r2.weight DESC limit 2 "
				+"UNION "
				+"MATCH (n{content:'"+word+"'})-[r3]->(f3) "
				+"where f3.category = 'institution' "
				+"RETURN r3 as dis, f3 as layernode "
				+"ORDER BY r3.weight DESC limit 2";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println();
			while (rs.next()) {
				System.out.println(rs.getString(1)+rs.getString(2));
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}
	}

	public static void knowledgeRelation(String word) throws SQLException{

		String query="MATCH (n {content:'"+word+"'} )-[r]->(f) "
				+"where f.category = 'person' or f.category = 'location' or f.category = 'institution' or f.category = 'technology' "
				+"RETURN n as node, r as dis ,f as nextlayer "
				+"ORDER by r.weight DESC limit 20 "
				+"UNION "
				+"MATCH (n {content:'"+word+"'} )-[r]->(f) "
				+"where f.category = 'person' or f.category = 'location' or f.category = 'institution' or f.category = 'technology' "
				+"WITH r.weight as weight,f as layer1 "
				+"ORDER by weight DESC limit 20 "
				+"MATCH (layer1)-[r]->(f2) "
				+"where f2.category = 'person' or f2.category = 'location' or f2.category = 'institution' or f2.category = 'technology' "
				+"return layer1 as node,r as dis , f2 as nextlayer "
				+"ORDER by layer1.content, r.weight DESC limit 200";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println();
			while (rs.next()) {
				JSONObject obj = JSONObject.parseObject(rs.getString(1));
				String node = obj.getString("node");
				String category = obj.getString("category");
				String content = obj.getString("content");
				System.out.println(rs.getString(1)+rs.getString(2)+rs.getString(3));
				if (rs.getString(3) != null) {
					System.out.println("第三行:"+rs.getString(3));
					//perLoIn.setInstitution(rs.getString(3));
				}
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}
	}

	public static void Letter(String word) throws SQLException{

		String query="MATCH (n {content:'"+word+"'} )-[r]->(f) RETURN n as node, r as dis ,f as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 0 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 10 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 1 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 2 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 3 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 4 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 5 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 6 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 7 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 8 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 9 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 10 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 11 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 12 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 13 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 14 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 15 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 16 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 17 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 18 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 19 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 ";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		HashSet<String> set = new HashSet<String>();
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println();
			while (rs.next()) {
				JSONObject obj = JSONObject.parseObject(rs.getString(3));
				String node = obj.getString("node");
				String category = obj.getString("category");
				String content = obj.getString("content");
				System.out.println(rs.getString(1)+rs.getString(2)+rs.getString(3));
//				set.add(category);
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}
			System.out.println(set);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}
	}

	public static void m() throws SQLException {
		// String query = "MATCH (n:Person) RETURN n.name";
		String baidu = "百度";
		String query = "MATCH (n {content:'" + baidu
				+ "'} )-[r*..2]->(f) RETURN f,r";// ORDER BY r.weight desc";
		// 节点和关系
		// String query = "MATCH (n{content:'百度'})-[r*2]->(f) RETURN f.content";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println(rs.getRow());
			while (rs.next()) {
				System.out.println(rs.getString("f") + rs.getString("r"));
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}

	}

	public static void scriptToString(String file) throws IOException{

		File f = new File(file);
		FileReader r = new FileReader(f);
		BufferedReader buf = new BufferedReader(r);
		String str = null;
		String res = "";
		while((str=buf.readLine())!=null){
			res=res+str.trim()+" ";
		}
		System.out.println(res);
	}

	/**
	 * @param args
	 * @throws SQLException
	 * @throws IOException
	 */
	public static void main(String[] args) throws SQLException, IOException {
		// TODO 自动生成的方法存根
//		getCategory("百度");
//		m();
//		searchKnowledge("中国");
//		knowledgeRelation("SDN");
//		scriptToString("d:/neo4j.txt");
		Letter("常小兵");
	}
}
