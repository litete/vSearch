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
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.ArrayList;
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

    @RequestMapping("/msearch")
    public String mySearch(/*@RequestParam String person,@RequestParam String location,
                        @RequestParam Str institution*/ HttpServletRequest request, Model model) throws SQLException {

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String word = request.getParameter("word");
        Connection con = null;
        try {
            con = DriverManager.getConnection(
                    "jdbc:neo4j://27.148.153.187:7474/", "neo4j", "nlp4");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("word:" + word);
        SearchString searchString = new SearchString();
        searchString.setWord(word);
        String s = searchString.getWord();
        int person = Integer.parseInt(request.getParameter("p"));
        int location = Integer.parseInt(request.getParameter("l"));
        int institution = Integer.parseInt(request.getParameter("i"));
        int technology = Integer.parseInt(request.getParameter("t"));
        String queryP = searchString.getQueryP(s);
        String queryL = searchString.getQueryL(s);
        String queryI = searchString.getQueryI(s);
        String queryT = searchString.getQueryT(s);
        String limit10 = searchString.getLimit10();
        String limit5 = searchString.getLimit5();
        String limit3 = searchString.getLimit3();
        String union = searchString.getUnion();
        ObjectMapper obj = new ObjectMapper();
        PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
        ResultSet rs = null;
        List<String> nodes = new ArrayList<String>();
        List<String> links = new ArrayList<String>();
        try {
            if (person == 1) {
                if (location == 1) {
                    if (institution == 1) {
                        if (technology == 1) {
/*1111 */

                            stmt = con.prepareStatement(queryP + limit3 + union + queryL + limit3 + union + queryI + limit3 + union + queryT + limit3);

                            System.out.println(queryP + limit3 + union + queryL + limit3 + union + queryI + limit3 + union + queryT + limit3);
                            //  System.out.println("1111");


                        } else if (technology == 0) {
/*1110*/
                            stmt = con.prepareStatement(queryP + limit3 + union + queryL + limit3 + union + queryI + limit3);
                        }
                    } else if (institution == 0) {
                        if (technology == 1) {
/*1101*/
                            stmt = con.prepareStatement(queryP + limit3 + union + queryL + limit3 + union + queryT + limit3);
                        } else if (technology == 0) {
/*1100*/
                            stmt = con.prepareStatement(queryP + limit5 + union + queryL + limit5);
                        }
                    }
                } else if (location == 0) {
                    if (institution == 1) {
                        if (technology == 1) {
/*1011*/
                            stmt = con.prepareStatement(queryP + limit3 + union + queryI + limit3 + union + queryT + limit3);
                        } else if (technology == 0) {
/*1010*/
                            stmt = con.prepareStatement(queryP + limit5 + union + queryI + limit5);
                        }
                    } else if (institution == 0) {
                        if (technology == 1) {
/*1001*/
                            stmt = con.prepareStatement(queryP + limit5 + union + queryT + limit5);
                        } else if (technology == 0) {
/*1000*/
                            stmt = con.prepareStatement(queryP + limit10);
                        }
                    }
                }
            } else if (person == 0) {
                if (location == 1) {
                    if (institution == 0) {
                        if (technology == 0) {
/*0100*/
                            stmt = con.prepareStatement(queryL + limit10);
                        } else if (technology == 1) {
/*0101*/
                            stmt = con.prepareStatement(queryL + limit5 + union + queryT + limit5);
                        }
                    } else if (institution == 1) {
                        if (technology == 0) {
/*0110*/
                            stmt = con.prepareStatement(queryL + limit5 + union + queryI + limit5);
                        } else if (technology == 1) {
/*0111*/
                            stmt = con.prepareStatement(queryL + limit3 + union + queryI + limit3 + union + queryT + limit3);
                        }
                    }
                } else if ((location == 0)) {
                    if (institution == 0) {
                        if (technology == 0) {
/*0000*/
                        } else if (technology == 1) {
/*0001*/
                            stmt = con.prepareStatement(queryT + limit10);
                        }
                    } else if (institution == 1) {
                        if (technology == 0) {
/*0010*/
                            stmt = con.prepareStatement(queryI + limit10);

                        } else if (technology == 1) {
/*0011*/
                            stmt = con.prepareStatement(queryI + limit5 + union + queryT + limit5);

                        }
                    }
                }

            }
            rs = stmt.executeQuery();
            Node node1 = new Node();
            node1.setName(word);
            node1.setCategory(0);
            node1.setValue(1.0);
            node1.setLabel(null);
            String nodelStr = obj.writeValueAsString(node1);
            nodes.add(nodelStr);
            //  nodes.add("{\"name\":\"马云\",\"category\":0,\"value\":1.0,\"label\":null},");
            while (rs.next()) {
                JSONObject linkJson = JSONObject.parseObject(rs.getString(1));
                JSONObject nodeJson = JSONObject.parseObject(rs.getString(2));
                Link link = new Link();
                link.setName(nodeJson.getString("category"));
                // System.out.println(nodeJson.getString("category"));
                link.setSource(linkJson.getString("from"));
                //System.out.println("中点" + linkJson.get("from"));
                link.setTarget(linkJson.getString("to"));
                link.setWeight(linkJson.getDouble("weight"));
                String linkStr = obj.writeValueAsString(link);
                // System.out.println(linkStr);
                links.add(linkStr);

                Node node = new Node();
                // node.setLabel("lite");
                //  System.out.println("nodeJson"+nodeJson);
                node.setCategory(nodeJson.getString("category"));
                node.setValue((double) 1);
                node.setName(nodeJson.getString("content"));
                String nodeStr = obj.writeValueAsString(node);
                //System.out.println(nodeStr);
                nodes.add(nodeStr);
                model.addAttribute("links", links.toString());
                model.addAttribute("nodes", nodes.toString());
            }
            System.out.println("links.toString()" + links.toString());
            System.out.println("nodes.toString()" + nodes.toString());
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


    @RequestMapping(value = "/vsearch")
    public String phone() {
        return "";
    }

    @RequestMapping(value = "/log")
    public String point(HttpServletRequest request) {
        String username = request.getParameter("username");
        request.setAttribute("userName", username);
        return "business";
    }

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, Model model) {
        if (request.getParameter("word") == null
                || request.getParameter("word").equals("")) {
            System.out.println(request.getParameter("word"));
            return "index";
        }
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        String word = request.getParameter("word");
        System.out.println(word);
        model.addAttribute("keyword", word);
        return "index";
    }

    @RequestMapping(value = "/vknowledge")
    public String rpoint() {
        return "knowledge";
    }

    @RequestMapping(value = "/marketing")
    public String task(HttpServletRequest request, Model model) {
        if (request.getParameter("word") == null
                || request.getParameter("word").equals("")) {
            System.out.println(request.getParameter("word"));
            return "marketing";
        }
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        String word = request.getParameter("word");
        model.addAttribute("keyword", word);
        return "marketing";
    }

    @RequestMapping(value = "/search_institution")
    public String institution() {
        return "search_institution";
    }

    @RequestMapping(value = "/search_person")
    public String person() {
        return "search_person";
    }

    @RequestMapping(value = "/search_place")
    public String place() {
        return "search_place";
    }

    @RequestMapping(value = "/search_table")
    public String table() {
        return "search_table";
    }

    @RequestMapping(value = "/toutiao")
    public String toutiao(HttpServletRequest request, Model model) {
        if (request.getParameter("word") == null
                || request.getParameter("word").equals("")) {
            System.out.println(request.getParameter("word"));
            return "toutiao";
        }
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        String word = request.getParameter("word");
        model.addAttribute("keyword", word);
        return "toutiao";
    }

    @RequestMapping(value = "/")
    public String root() {
        return "index";
    }
}
