package org.test;

import org.dao.UsersDao;
import org.junit.Test;
import org.vo.StudentInfo;
import org.vo.TeachList;
import org.vo.Users;
import org.vo.StuList;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class userTestTest {

    UsersDao udao = new UsersDao();
    Users user = new Users();
    @Test
    public void t1(){
        user.setU_tel("admin");
        user.setU_paswd("admin");
        user.setU_type("0");
       Users u = udao.queryUserAll(user);
        System.out.println(u.getU_tel());

    }
    @Test
    public void t2() throws SQLException {
        Map map = new HashMap<>();
        map.put("key","王");
       List<StudentInfo> list = udao.getUserPage(1,2,map);

        System.out.println(list.size());

    }
    @Test
    public void t3() throws SQLException {
        Map map = new HashMap<>();
        map.put("key","王");
        int i = udao.queryUserCount(map);
        System.out.println(i);
    }

    @Test
    public void t4(){

        try {
           StudentInfo data = udao.queryUserById(1);
            System.out.println(data.getStu_name());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    @Test
    public void t5(){
        StuList list1 = new StuList();
        list1.setStu_name("nihao");
        System.out.println(list1.getStu_name());
    }

    @Test
    public void t6(){
       List<StuList> ulist = udao.vagueQuery("张");
        System.out.println(ulist.size());
    }

    @Test
    public void t7(){
       user.setU_num(10901);
       user.setU_paswd("123456");
       user.setU_tel("1909019090191");
       user.setU_type("1");
       Boolean i  = udao.insertUsers(user);
        System.out.println(i);
    }

    @Test
    public void t8(){
        List<StuList> list = udao.queryAllUsers();
        for (StuList user: list) {

        }
        System.out.println();
    }

    @Test
    public void t9(){
        List<TeachList> list = udao.queryTeachers();
        for (TeachList user: list) {
            System.out.println(user.getU_num());
        }

    }

}