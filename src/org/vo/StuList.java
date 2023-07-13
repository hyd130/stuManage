package org.vo;


import lombok.Data;

import java.util.Date;

@Data
public class StuList {

    private int stu_num;
    private String stu_name;
    private String u_paswd;
    private String u_tel;

    private String u_type;

    private String stu_sex;

    private String stu_age;
    private String stu_class;
    private String stu_major;

    private String  stu_college;

    private Date stu_Intake;
    private Date stu_gradution;

    private String or_gradute;



}
