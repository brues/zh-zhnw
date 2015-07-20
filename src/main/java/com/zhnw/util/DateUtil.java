package com.zhnw.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by guoyibin on 15/1/23.
 *
 *
 */
public class DateUtil {

    /**
     * @param startDay 需要比较的时间 不能为空(null),需要正确的日期格式 ,如：2009-09-12
     * @param endDay 被比较的时间  为空(null)则为当前时间
     * @param stype 返回值类型   0为多少天，1为多少个月，2为多少年
     * @return
     * 举例：
     * compareDate("2009-09-12", null, 0);//比较天
     * compareDate("2009-09-12", null, 1);//比较月
     * compareDate("2009-09-12", null, 2);//比较年
     */
    public int compareDate(String startDay,String endDay,int stype){
        int n = 0;
        String[] u = {"天","月","年"};
        String formatStyle = stype==1?"yyyy-MM":"yyyy-MM-dd";

        endDay = endDay==null?getCurrentDate("yyyy-MM-dd"):endDay;

        DateFormat df = new SimpleDateFormat(formatStyle);
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        try {
            c1.setTime(df.parse(startDay));
            c2.setTime(df.parse(endDay));
        } catch (Exception e3) {
            System.out.println("wrong occured");
        }
        //List list = new ArrayList();
        while (!c1.after(c2)) {                   // 循环对比，直到相等，n 就是所要的结果
            //list.add(df.format(c1.getTime()));    // 这里可以把间隔的日期存到数组中 打印出来
            n++;
            if(stype==1){
                c1.add(Calendar.MONTH, 1);          // 比较月份，月份+1
            }
            else{
                c1.add(Calendar.DATE, 1);           // 比较天数，日期+1
            }
        }
        n = n-1;
        if(stype==2){
            n = (int)n/365;
        }
        //System.out.println(startDay+" -- "+endDay+" 相差多少"+u[stype]+":"+n);
        return n;
    }

    public static String getCurrentDate(String format){
        Calendar day=Calendar.getInstance();
        day.add(Calendar.DATE,0);
        SimpleDateFormat sdf=new SimpleDateFormat(format);//"yyyy-MM-dd"
        String date = sdf.format(day.getTime());
        return date;
    }

    public String dateToString(String format, Date date){
        return new SimpleDateFormat(format).format(date);
    }

    public Date stringToDate(String fromat, String stringDate) throws ParseException {
        return new SimpleDateFormat(fromat).parse(stringDate);
    }


    /**
     * 计算两个时间的间隔(格式：时时:分分)
     *
     * */
    public String getChaTime(String timeA, String timeB){
        int ashi = Integer.parseInt(timeA.substring(0,2));
        int afen = Integer.parseInt(timeA.substring(3));
        int bshi = Integer.parseInt(timeB.substring(0,2));
        int bfen = Integer.parseInt(timeB.substring(3));
        int abfen = (ashi*60+afen)-(bshi*60+bfen);
        int fen = abfen%60;
        int shi = abfen/60;
        String sfen=fen<10?("0"+fen):(""+fen);
        String sshi=shi<10?("0"+shi):(""+shi);
        return sshi+":"+sfen;
    }

    public String getHeChaDate(String dateA, String dateB){
        int nian = Integer.parseInt(dateB.substring(0,2));
        int yue = Integer.parseInt(dateB.substring(3,5));
        int ri = Integer.parseInt(dateB.substring(6));
        SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss");
        try {
            Date myDate = formatter.parse(dateA);
            Calendar c = Calendar.getInstance();
            c.setTime(myDate);
            c.add(Calendar.YEAR, (-1 * nian));
            c.add(Calendar.MONTH, -1*yue);
            c.add(Calendar.DAY_OF_MONTH, -1*ri);
            myDate = c.getTime();
            return formatter.format(myDate);
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        return null;
    }

    public String passThroughDays(int days) throws ParseException {
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
        Date beginDate = new Date();
        Calendar date = Calendar.getInstance();
        date.setTime(beginDate);
        date.set(Calendar.DATE, date.get(Calendar.DATE) - days);
        Date endDate = dft.parse(dft.format(date.getTime()));
        return dateToString("yyyy-MM-dd",endDate);
    }

}
