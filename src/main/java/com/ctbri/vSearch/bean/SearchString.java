package com.ctbri.vSearch.bean;

/**
 * Created by lite on 2017/1/8.
 */
public class SearchString {
    //String word = "";

    // public void setWord(String word) {
//        this.word = word;
//    }

    private String queryP;
    private String queryL;
    private String queryI;
    private String queryT;
    private String queryAll;

    public String getQueryAll(String word) {
        //System.out.println("word:"+word);
        this.queryAll = "MATCH (n:other {content:'" + word + "'} )-[r]->(f) " +
                "RETURN  n as node,r as dis, f as nextlayer  " +
                "ORDER by r.weight DESC limit 10  " +
                "UNION " +
                "MATCH (n:other {content:'" + word + "'} )-[r]->(f) " +
                "WITH  f as layer1  " +
                "ORDER by r.weight DESC limit 3 " +
                "MATCH (layer1)-[r]->(f2) " +
                "WITH layer1,f2 " +
                "ORDER BY r.weight DESC  " +
                "WITH layer1,collect(f2)[0..5] as list " +
                "ORDER BY id(layer1) " +
                "MATCH (layer1)-[r]->(layer2) " +
                "WHERE layer2 in list " +
                "RETURN layer1 as node, r as dis, layer2 as nextlayer";
        return queryAll;
    }

    public void setQueryAll(String queryAll) {
        this.queryAll = queryAll;
    }

    private String limit10;
    private String limit5;
    private String Limit3;
    private String union;

//    public String getWord() {
//        return word;
//    }

    public String getQueryP(String word) {
        this.queryP = "MATCH (n:other {content:'" + word + "'} )-[r]->(f) " +
                "WHERE f.category = 'person' " +
                "RETURN  n as node,r as dis, f as nextlayer  " +
                "ORDER by r.weight DESC limit 10  " +
                "UNION\n" +
                "MATCH (n:other {content:'" + word + "'} )-[r]->(f) " +
                "WHERE f.category = 'person' " +
                "WITH  f as layer1  " +
                "ORDER by r.weight DESC limit 3 " +
                "MATCH (layer1)-[r]->(f2) " +
                "WHERE f2.category = 'person'  " +
                "WITH layer1,f2 " +
                "ORDER BY r.weight DESC  " +
                "WITH layer1,collect(f2)[0..5] as list " +
                "ORDER BY id(layer1) " +
                "MATCH (layer1)-[r]->(layer2) " +
                "WHERE layer2 in list " +
                "RETURN layer1 as node, r as dis, layer2 as nextlayer";
        return queryP;
    }

    public void setQueryP(String queryP, String word) {
        this.queryP = queryP;
    }

    public String getQueryL(String word) {
        this.queryL = "MATCH (n:other {content:'"+word+"'} )-[r]->(f) " +
                "WHERE f.category = 'location' " +
                "RETURN  n as node,r as dis, f as nextlayer  " +
                "ORDER by r.weight DESC limit 10  " +
                "UNION " +
                "MATCH (n:other {content:'"+word+"'} )-[r]->(f) " +
                "WHERE f.category = 'location' " +
                "WITH  f as layer1  " +
                "ORDER by r.weight DESC limit 3 " +
                "MATCH (layer1)-[r]->(f2) " +
                "WHERE f2.category = 'location'  " +
                "WITH layer1,f2 " +
                "ORDER BY r.weight DESC  " +
                "WITH layer1,collect(f2)[0..5] as list " +
                "ORDER BY id(layer1) " +
                "MATCH (layer1)-[r]->(layer2) " +
                "WHERE layer2 in list " +
                "RETURN layer1 as node, r as dis, layer2 as nextlayer";
        return queryL;
    }

    public void setQueryL(String queryL, String word) {
        this.queryL = queryL;
    }

    public String getQueryI(String word) {
        this.queryI = " MATCH (n:other {content:'"+word+"'} )-[r]->(f) " +
                "WHERE f.category = 'institution' " +
                "RETURN  n as node,r as dis, f as nextlayer  " +
                "ORDER by r.weight DESC limit 10  " +
                "UNION " +
                "MATCH (n:other {content:'"+word+"'} )-[r]->(f) " +
                "WHERE f.category = 'institution' " +
                "WITH  f as layer1 " +
                "ORDER by r.weight DESC limit 3 " +
                "MATCH (layer1)-[r]->(f2) " +
                "WHERE f2.category = 'institution'  " +
                "WITH layer1,f2 " +
                "ORDER BY r.weight DESC " +
                "WITH layer1,collect(f2)[0..5] as list " +
                "ORDER BY id(layer1) " +
                "MATCH (layer1)-[r]->(layer2) " +
                "WHERE layer2 in list " +
                "RETURN layer1 as node, r as dis, layer2 as nextlayer ";
        return queryI;
    }

    public void setQueryI(String queryI, String word) {
        this.queryI = queryI;
    }

    public String getQueryT(String word) {
        this.queryT = " MATCH (n:other {content:'"+word+"'} )-[r]->(f) " +
                "WHERE f.category = 'tech' " +
                "RETURN  n as node,r as dis, f as nextlayer  " +
                "ORDER by r.weight DESC limit 10  " +
                "UNION " +
                "MATCH (n:other {content:'"+word+"'} )-[r]->(f) " +
                "WHERE f.category = 'tech' " +
                "WITH  f as layer1 " +
                "ORDER by r.weight DESC limit 3 " +
                "MATCH (layer1)-[r]->(f2) " +
                "WHERE f2.category = 'tech'  " +
                "WITH layer1,f2 " +
                "ORDER BY r.weight DESC  " +
                "WITH layer1,collect(f2)[0..5] as list " +
                "ORDER BY id(layer1) " +
                "MATCH (layer1)-[r]->(layer2) " +
                "WHERE layer2 in list " +
                "RETURN layer1 as node, r as dis, layer2 as nextlayer ";
        return queryT;
    }

    public void setQueryT(String queryT, String word) {
        this.queryT = queryT;
    }

    public String getLimit10() {
        return limit10;
    }

    public void setLimit10(String limit10) {
        this.limit10 = limit10;
    }

    public String getLimit5() {
        return limit5;
    }

    public void setLimit5(String limit5) {
        this.limit5 = limit5;
    }

    public String getLimit3() {
        return Limit3;
    }

    public void setLimit3(String limit3) {
        Limit3 = limit3;
    }

    public String getUnion() {
        return union;
    }

    public void setUnion(String union) {
        this.union = union;
    }
}
