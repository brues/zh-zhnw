package com.zhnw.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by guoyibin on 15/5/4.
 */
public class FastCodeUtil {

    /*路径*/
    public static final String URL="/Users/guoyibin/Desktop";

    /*项目英文名称简写*/
    public static final String PROJECTENNAME="zhnw";

    /*项目中文名称*/
    public static final String PROJECTCNNAME="中翰内网";

    /*数据表名*/
    public static final String DATATABLENAME="user";

    /*实体类名*/
    public static final String MODELNAME="User";

    /*项目包前缀*/
    public static final String BEFOREPACKAGE="com.jfinal";


    /**
     * 主方法
     * */
    public static void main(String[] args) throws IOException {
        doAllPackageAndFile();//创建所有包和文件夹
    }

    /**
     * 创建所有包和文件夹
     *
     * */
    private static void doAllPackageAndFile() throws IOException {
        File projectFile = new File(URL+File.separator+PROJECTENNAME);
        if (!projectFile.exists()&&!projectFile.isDirectory()){
            projectFile.mkdirs();
        }

        File srcFile = new File(URL+File.separator+PROJECTENNAME+File.separator+"src");
        if (!srcFile.exists()&&!srcFile.isDirectory()){
            srcFile.mkdirs();
        }

        doPomXML();

    }

    private static void doPomXML() throws IOException {
        File pomFile = new File(URL+File.separator+PROJECTENNAME+File.separator+"pom.xml");
        if (!pomFile.exists()){
            pomFile.createNewFile();
        }

        FileWriter fw = new FileWriter(pomFile, true);
        BufferedWriter bw = new BufferedWriter(fw);



        bw.write("<project xmlns=\"http://maven.apache.org/POM/4.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n");
        bw.write("\txsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd\">\r\n\r\n");
        bw.write("\t<modelVersion>4.0.0</modelVersion>\r\n");
        bw.write("\t<groupId>"+BEFOREPACKAGE+"</groupId>\r\n");
        bw.write("\t<artifactId>"+PROJECTENNAME+"</artifactId>\r\n");
        bw.write("\t<packaging>war</packaging>\r\n");
        bw.write("\t<version>1.0-SNAPSHOT</version>\r\n");
        bw.write("\t<url>http://maven.apache.org</url>\r\n\r\n");
        bw.write("\t<properties>\r\n");
        bw.write("\t\t<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>\r\n");
        bw.write("\t</properties>\r\n\r\n");
        bw.write("\t<dependencies>\r\n");
        bw.write("\t\t\r\n");
        bw.write("\t\t\r\n");
        bw.write("\t\t\r\n");
        bw.write("\t\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t</dependencies>\r\n\r\n");
        bw.write("\t<build>\r\n");
        bw.write("\t\t<finalName>"+PROJECTENNAME+"</finalName>\r\n");
        bw.write("\t\t<plugins>\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\r\n");
        bw.write("\t\t</plugin>\r\n");
        bw.write("\t</build>\r\n\r\n");
        bw.write("</project>\r\n");
        bw.flush();
        bw.close();
        fw.close();

    }
}
