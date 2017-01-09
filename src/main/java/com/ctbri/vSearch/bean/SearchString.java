package com.ctbri.vSearch.bean;

import org.neo4j.cypher.internal.compiler.v2_0.functions.Str;

/**
 * Created by lite on 2017/1/8.
 */
public class SearchString {
    String word="";

    public void setWord(String word) {
        this.word = word;
    }

    private String queryP=" match (n {content:'"+word+"'}) - [r1] ->(f1)" +
            " where f1.category='person'" +
            " return r1 as dis, f1 as layernode" +
            " order by r1.weight";
    private String queryL=" match (n {content:'"+word+"'}) - [r2] ->(f2)" +
            " where f2.category='location'" +
            " return r2 as dis, f2 as layernode" +
            " order by r2.weight ";
    private String queryI=" match (n {content:'"+word+"'}) - [r3] ->(f3)" +
            " where f3.category='institution'" +
            " return r3 as dis, f3 as layernode" +
            " order by r3.weight ";
    private String queryT=" match (n {content:'"+word+"'}) - [r4] ->(f4)" +
            " where f4.category='techn'" +
            " return r4 as dis, f4 as layernode" +
            " order by r4.weight ";
    private String limit10="desc limit 10";
    private String limit5=" desc limit 5";
    private String Limit3=" desc limit 3";
    private String union=" union ";

    public String getWord() {
        return word;
    }

    public String getQueryP(String word) {
        this.queryP=" match (n {content:'"+word+"'}) - [r1] ->(f1)" +
                " where f1.category='person'" +
                " return r1 as dis, f1 as layernode" +
                " order by r1.weight";
        return queryP;
    }

    public void setQueryP(String queryP,String word) {
        this.queryP = queryP;
    }

    public String getQueryL(String word) {
        this.queryL=" match (n {content:'"+word+"'}) - [r2] ->(f2)" +
                " where f2.category='location'" +
                " return r2 as dis, f2 as layernode" +
                " order by r2.weight ";
        return queryL;
    }

    public void setQueryL(String queryL,String word) {
        this.queryL = queryL;
    }

    public String getQueryI(String word) {
        this.queryI=" match (n {content:'"+word+"'}) - [r3] ->(f3)" +
                " where f3.category='institution'" +
                " return r3 as dis, f3 as layernode" +
                " order by r3.weight ";
        return queryI;
    }

    public void setQueryI(String queryI,String word) {
        this.queryI = queryI;
    }

    public String getQueryT(String word) {
        this.queryT=" match (n {content:'"+word+"'}) - [r4] ->(f4)" +
                " where f4.category='tech'" +
                " return r4 as dis, f4 as layernode" +
                " order by r4.weight ";
        return queryT;
    }

    public void setQueryT(String queryT,String word) {
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
