using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class CourseGateway:CommonGateway
    {

        public int Save(Course course)
        {
            Query = "INSERT INTO Course(Code,Name,Credit,Description,DepartmentId,SemesterId,IsActive) VALUES(@Code,@Name,@Credit,@Description,@DepartmentId,@SemesterId,0)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("Code", SqlDbType.VarChar);
            Command.Parameters["Code"].Value = course.Code;
            Command.Parameters.Add("Name", SqlDbType.VarChar);
            Command.Parameters["Name"].Value = course.Name;
            Command.Parameters.Add("Credit", SqlDbType.Decimal);
            Command.Parameters["Credit"].Value = course.Credit;
            Command.Parameters.Add("Description", SqlDbType.VarChar);
            Command.Parameters["Description"].Value = course.Description;
            Command.Parameters.Add("DepartmentId", SqlDbType.Int);
            Command.Parameters["DepartmentId"].Value = course.DepartmentId;
            Command.Parameters.Add("SemesterId", SqlDbType.Int);
            Command.Parameters["SemesterId"].Value = course.SemesterId;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public bool IsCodeExists(string code)
        {
            bool isCodeExists = false;
            Query = "SELECT*FROM Course WHERE Code='" + code + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isCodeExists = true;
            }
            Connection.Close();
            return isCodeExists;
        }

        public bool IsNameExists(string name)
        {
            bool isCodeExists = false;
            Query = "SELECT*FROM Course WHERE Name='" + name + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isCodeExists = true;
            }
            Connection.Close();
            return isCodeExists;
        }

        public List<Course> GetCoursesByDepartmentName(int departmentId)
        {
            Query = "SELECT*FROM Course INNER JOIN Department ON Course.DepartmentId = Department.Id  WHERE Course.DepartmentId='" + departmentId + "' AND Course.IsActive = 0";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Course course = new Course();
                    course.Id = Int32.Parse(Reader["Id"].ToString());
                    course.Code = Reader["Code"].ToString();
                    course.Name = Reader["Name"].ToString();
                    courses.Add(course);
                }
                Reader.Close();
            }
            Connection.Close();
            return courses;
        }


        public Course GetCourseByCourseCode(int courseId)
        {
            Course course = new Course();
            Query = "SELECT*FROM Course WHERE Id=" + courseId;
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    course.Id = Int32.Parse(Reader["Id"].ToString());
                    course.Credit = float.Parse(Reader["Credit"].ToString());
                    course.Name = Reader["Name"].ToString();
                }
                Reader.Close();
            }
            Connection.Close();
            return course;
        }

        public List<ViewAllCoursesWithTeacher> GetAllCoursesWithTeachersByDepartment(int departmentId)
        {
            Query = "SELECT*FROM ViewAllCoursesWithTeacher WHERE DepartmentId='" + departmentId + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            List<ViewAllCoursesWithTeacher> viewAllCoursesWithTeachers = new List<ViewAllCoursesWithTeacher>();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    ViewAllCoursesWithTeacher viewAllCoursesWithTeacher = new ViewAllCoursesWithTeacher();
                    viewAllCoursesWithTeacher.Code = Reader["Code"].ToString();
                    viewAllCoursesWithTeacher.Name = Reader["Name"].ToString();
                    viewAllCoursesWithTeacher.Semester = Reader["Semester"].ToString();
                    string assignedTo = Reader["AssignedTo"].ToString();
                    if (assignedTo.Length == 0)
                    {
                        viewAllCoursesWithTeacher.AssignedTo = "Not Assigned Yet";
                    }
                    else
                    {
                        viewAllCoursesWithTeacher.AssignedTo = assignedTo.ToString();
                    }
                    viewAllCoursesWithTeachers.Add(viewAllCoursesWithTeacher);
                }
                Reader.Close();
            }
            Connection.Close();
            return viewAllCoursesWithTeachers;
        }

        public List<Course> GetCoursesByDepartmentId(int departmentId)
        {
            Query = "SELECT*FROM Course INNER JOIN Department ON Course.DepartmentId = Department.Id  WHERE Course.DepartmentId='" + departmentId + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Course course = new Course();
                    course.Id = Int32.Parse(Reader["Id"].ToString());
                    course.Code = Reader["Code"].ToString();
                    course.Name = Reader["Name"].ToString();
                    courses.Add(course);
                }
                Reader.Close();
            }
            Connection.Close();
            return courses;
        }

        public List<Course> GetCoursesByDeptId(int id, int studentId)
        {
            Query = "SELECT Id, Code, Name FROM Course WHERE Id NOT IN(SELECT CourseId FROM CourseAssignStudent WHERE StudentId=" + studentId + ") AND DepartmentId=" + id + "";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Course course = new Course();
                    course.Id = Int32.Parse(Reader["Id"].ToString());
                    course.Code = Reader["Code"].ToString();
                    course.Name = Reader["Name"].ToString();
                    courses.Add(course);
                }
                Reader.Close();
            }
            Connection.Close();
            return courses;
        }

        public List<Course> GetEnrolledCoursesByStudent(int id, int studentId)
        {
            Query = "SELECT DISTINCT Course.Id, Course.Code, Course.Name FROM Course JOIN CourseAssignStudent ON Course.Id=CourseAssignStudent.CourseId AND CourseAssignStudent.StudentId=" + studentId + " WHERE CourseId NOT IN(SELECT CourseId FROM StudentResult WHERE StudentId=" + studentId + ")  and Course.DepartmentId=" + id + "";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Course course = new Course();
                    course.Id = Int32.Parse(Reader["Id"].ToString());
                    course.Code = Reader["Code"].ToString();
                    course.Name = Reader["Name"].ToString();
                    courses.Add(course);
                }
                Reader.Close();
            }
            Connection.Close();
            return courses;
        }

        public int UnAssignCourse()
        {
            Query = "UPDATE Course SET IsActive=0";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            int rowsAffect = Command.ExecuteNonQuery();
            return rowsAffect;
        }

        public int UnAssignCourseWithTeacher()
        {
            Query = "UPDATE CourseAssignTeacher SET IsActive=0";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            int rowsAffect = Command.ExecuteNonQuery();
            return rowsAffect;
        }
    }
}