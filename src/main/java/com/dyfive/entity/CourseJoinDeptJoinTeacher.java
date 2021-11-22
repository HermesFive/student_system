package com.dyfive.entity;

public class CourseJoinDeptJoinTeacher {
    //课程编码
    private String jCourseId;
    //课程名称
    private String jCourseName;
    //上课地点
    private String jCourseRoom;
    //科任教师——外键
    private String jCourseTeacherName;
    //学生人数
    private Integer jCourseStudentNum;
    //学分
    private Integer jCourseCredit;
    //开课院系
    private String jCourseDeptName;

    public String getjCourseName() {
        return jCourseName;
    }

    public void setjCourseName(String jCourseName) {
        this.jCourseName = jCourseName;
    }

    public String getjCourseRoom() {
        return jCourseRoom;
    }

    public void setjCourseRoom(String jCourseRoom) {
        this.jCourseRoom = jCourseRoom;
    }

    public String getjCourseId() {
        return jCourseId;
    }

    public void setjCourseId(String jCourseId) {
        this.jCourseId = jCourseId;
    }

    public String getjCourseTeacherName() {
        return jCourseTeacherName;
    }

    public void setjCourseTeacherName(String jCourseTeacherName) {
        this.jCourseTeacherName = jCourseTeacherName;
    }

    public Integer getjCourseStudentNum() {
        return jCourseStudentNum;
    }

    public void setjCourseStudentNum(Integer jCourseStudentNum) {
        this.jCourseStudentNum = jCourseStudentNum;
    }

    public Integer getjCourseCredit() {
        return jCourseCredit;
    }

    public void setjCourseCredit(Integer jCourseCredit) {
        this.jCourseCredit = jCourseCredit;
    }

    public String getjCourseDeptName() {
        return jCourseDeptName;
    }

    public void setjCourseDeptName(String jCourseDeptName) {
        this.jCourseDeptName = jCourseDeptName;
    }

    @Override
    public String toString() {
        return "CourseJoinDeptJoinTeacher{" +
                "jCourseId='" + jCourseId + '\'' +
                ", jCourseName='" + jCourseName + '\'' +
                ", jCourseRoom='" + jCourseRoom + '\'' +
                ", jCourseTeacherName='" + jCourseTeacherName + '\'' +
                ", jCourseStudentNum=" + jCourseStudentNum +
                ", jCourseCredit=" + jCourseCredit +
                ", jCourseDeptName='" + jCourseDeptName + '\'' +
                '}';
    }
}
