package org.vo;

import java.sql.Date;

//学生 bean
public class StudentInfo {

    private int stu_id;
    private int stu_num;
    private String stu_name;
    private String stu_sex;
    private int stu_age;
    private String stu_class;
    private String stu_major;
    private String stu_college;
    private Date stu_intake;
    private Date stu_gradution;
    private Date create_time;
    private String or_gradute;


    public StudentInfo() {
    }

    public StudentInfo(int stu_id, int stu_num, String stu_name, String stu_sex, int stu_age, String stu_class, String stu_major, String stu_college, Date stu_intake, Date stu_gradution, Date create_time, String or_gradute) {
        this.stu_id = stu_id;
        this.stu_num = stu_num;
        this.stu_name = stu_name;
        this.stu_sex = stu_sex;
        this.stu_age = stu_age;
        this.stu_class = stu_class;
        this.stu_major = stu_major;
        this.stu_college = stu_college;
        this.stu_intake = stu_intake;
        this.stu_gradution = stu_gradution;
        this.create_time = create_time;
        this.or_gradute = or_gradute;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public int getStu_num() {
        return stu_num;
    }

    public void setStu_num(int stu_num) {
        this.stu_num = stu_num;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public String getStu_sex() {
        return stu_sex;
    }

    public void setStu_sex(String stu_sex) {
        this.stu_sex = stu_sex;
    }

    public int getStu_age() {
        return stu_age;
    }

    public void setStu_age(int stu_age) {
        this.stu_age = stu_age;
    }

    public String getStu_class() {
        return stu_class;
    }

    public void setStu_class(String stu_class) {
        this.stu_class = stu_class;
    }

    public String getStu_major() {
        return stu_major;
    }

    public void setStu_major(String stu_major) {
        this.stu_major = stu_major;
    }

    public String getStu_college() {
        return stu_college;
    }

    public void setStu_college(String stu_college) {
        this.stu_college = stu_college;
    }

    public Date getStu_intake() {
        return stu_intake;
    }

    public void setStu_intake(Date stu_intake) {
        this.stu_intake = stu_intake;
    }

    public Date getStu_gradution() {
        return stu_gradution;
    }

    public void setStu_gradution(Date stu_gradution) {
        this.stu_gradution = stu_gradution;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getOr_gradute() {
        return or_gradute;
    }

    public void setOr_gradute(String or_gradute) {
        this.or_gradute = or_gradute;
    }
}
