package com.dyfive.entity;

public class Course {
    //课程编码
    private String courseId;
    //课程名称
    private String courseName;
    //上课地点
    private String courseRoom;
    //科任教师——外键
    private Integer courseTeacher;
    //学生人数
    private Integer courseStudentNum;
    //学分
    private Integer courseCredit;
    //开课院系
    private Integer courseDept;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseRoom() {
        return courseRoom;
    }

    public void setCourseRoom(String courseRoom) {
        this.courseRoom = courseRoom;
    }

    public Integer getCourseTeacher() {
        return courseTeacher;
    }

    public void setCourseTeacher(Integer courseTeacher) {
        this.courseTeacher = courseTeacher;
    }

    public Integer getCourseStudentNum() {
        return courseStudentNum;
    }

    public void setCourseStudentNum(Integer courseStudentNum) {
        this.courseStudentNum = courseStudentNum;
    }

    public Integer getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(Integer courseCredit) {
        this.courseCredit = courseCredit;
    }

    public Integer getCourseDept() {
        return courseDept;
    }

    public void setCourseDept(Integer courseDept) {
        this.courseDept = courseDept;
    }
}
