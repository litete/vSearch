package com.ctbri.vSearch.controller;

import com.alibaba.fastjson.JSONObject;
import com.ctbri.vSearch.bean.Link;
import com.ctbri.vSearch.bean.Node;
import com.ctbri.vSearch.bean.SearchString;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class BHController {
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

    private static HashMap<String, String> view = new HashMap<String, String>();

    static {
        view.put("百度", "knowledge_baidu");
        view.put("马云", "knowledge_mayun");
        view.put("人工智能", "knowledge_rengongzhineng");
        view.put("电信", "knowledge_dianxin");
    }

    static {
        try {
            Class.forName("org.neo4j.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
    }

    @RequestMapping("/iHelpdesk")
    public String mySearch(HttpServletRequest request, Model model) throws SQLException, IOException {
        Connection con = null;
        try {
            con = DriverManager.getConnection(
                    "jdbc:neo4j://27.148.153.187:7474/", "neo4j", "nlp4");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ObjectMapper obj = new ObjectMapper();
        PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
        ResultSet rs = null;
        List<String> nodes = new ArrayList<String>();
        List<String> links = new ArrayList<String>();
        String word1 = request.getParameter("word");
        //String select = request.getParameter("select");
        int p = Integer.parseInt(request.getParameter("p"));
        int l = Integer.parseInt(request.getParameter("l"));
        int i = Integer.parseInt(request.getParameter("i"));
        int t = Integer.parseInt(request.getParameter("t"));
        String word = word1.replaceAll(" ", "");
        System.out.println("word:" + word);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new java.util.Date()));// new Date()为获取当前系统时间
        SearchString searchString = new SearchString();
        try {
            if (p == 1 && l == 0 && i == 0 && t == 0) {
                //stmt = con.prepareStatement(searchString.getQueryP(word));
                stmt = con.prepareStatement(searchString.getQueryP(word));
            } else if (p == 0 && l == 1 && i == 0 && t == 0) {
                stmt = con.prepareStatement(searchString.getQueryL(word));
            } else if (p == 0 && l == 0 && i == 1 && t == 0) {
                stmt = con.prepareStatement(searchString.getQueryI(word));
            } else if (p == 0 && l == 0 && i == 0 && t == 1) {
                stmt = con.prepareStatement(searchString.getQueryT(word));
            } else if (p == 1 && l == 1 && i == 1 && t == 1) {
                stmt = con.prepareStatement(searchString.getQueryAll(word));
            } else {
                stmt = null;
            }
            if (stmt == null) {
                String s1 = "";
                String s2 = "没有与" + word + "相关的匹配结果";
                String s1Str = obj.writeValueAsString(s1);
                String s2Str = obj.writeValueAsString(s2);
                model.addAttribute("nodes", s1Str);
                model.addAttribute("links", s1Str);
                model.addAttribute("tips", s2Str);
                System.out.println("nodes:" + s1Str);
                System.out.println("tips:" + s2Str);
            } else {
                rs = stmt.executeQuery();
                System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
                Node node1 = new Node();
                node1.setName(word);
                node1.setCategory(0);
                node1.setValue(1.0);
                node1.setLabel(null);
                String nodelStr = obj.writeValueAsString(node1);
                nodes.add(nodelStr);
                if (rs != null) {
                    while (rs.next()) {
                        JSONObject linkJson = JSONObject.parseObject(rs.getString(2));
                        JSONObject nodeJson = JSONObject.parseObject(rs.getString(3));
                        // System.out.println("linkJson:" + linkJson.toString());
                        // System.out.println("nodeJson:" + nodeJson.toString());
                        Link link = new Link();
                        link.setName(nodeJson.getString("category"));
                        link.setSource(linkJson.getString("from"));
                        link.setTarget(linkJson.getString("to"));
                        link.setWeight(linkJson.getDouble("weight"));
                        Node node = new Node();
                        node.setCategory(nodeJson.getString("category"));
                        node.setValue((double) 1);
                        node.setName(nodeJson.getString("content"));
                        String nodeStr = obj.writeValueAsString(node);
                        nodes.add(nodeStr);
                        if (linkJson.getString("to").equals(word)) {
                            continue;
                        } else {
                            String linkStr = obj.writeValueAsString(link);
                            links.add(linkStr);

                        }
                        String s2 = "";
                        String s2Str = obj.writeValueAsString(s2);
                        model.addAttribute("links", links);
                        model.addAttribute("nodes", nodes);
                        model.addAttribute("tips", s2Str);
                    }


                    //System.out.println("跑出来了");
                    if (links.size() == 0) {
                        String s1 = "";
                        String s2 = "没有与" + word + "相关的匹配结果";
                        String s1Str = obj.writeValueAsString(s1);
                        String s2Str = obj.writeValueAsString(s2);
                        model.addAttribute("nodes", s1Str);
                        model.addAttribute("links", s1Str);
                        model.addAttribute("tips", s2Str);
                    }

                } else {
                    String s1 = "";
                    String s2 = "没有与" + word + "相关的匹配结果";
                    String s1Str = obj.writeValueAsString(s1);
                    String s2Str = obj.writeValueAsString(s2);
                    model.addAttribute("nodes", s1Str);
                    model.addAttribute("links", s1Str);
                    model.addAttribute("tips", s2Str);
                }
                System.out.println("links" + links);
                System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
                System.out.println("nodes" + nodes);
                System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != rs) {
                rs.close();
            }
            if (null != rs) {
                stmt.close();
            }
        }

        return "ihelpdesk";
    }


}
