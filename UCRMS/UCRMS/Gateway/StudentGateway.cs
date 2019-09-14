using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class StudentGateway:CommonGateway
    {

        public string GetRegNo(Student student, string year)
        {
            string regNo = "";
            Query = "select RegNo from Student where DepartmentId=" + student.DepartmentId + " and Date like '" + year + "%'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    regNo = Reader["RegNo"].ToString();
                }
                Reader.Close();
            }
            else
            {
                regNo = "0";
            }
            Connection.Close();
            return regNo;
        }

        public int SaveStudent(Student student)
        {
            Query = "INSERT INTO Student(Name,Email,ContactNo,Address,Date,DepartmentId,RegNo) VALUES(@Name,@Email,@ContactNo,@Address,@Date,@DepartmentId,@RegNo)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.VarChar);
            Command.Parameters["Name"].Value = student.Name;
            Command.Parameters.Add("Email", SqlDbType.VarChar);
            Command.Parameters["Email"].Value = student.Email;
            Command.Parameters.Add("ContactNo", SqlDbType.Int);
            Command.Parameters["ContactNo"].Value = student.ContactNo;
            Command.Parameters.Add("Address", SqlDbType.VarChar);
            Command.Parameters["Address"].Value = student.Address;
            Command.Parameters.Add("Date", SqlDbType.Date);
            Command.Parameters["Date"].Value = student.Date;
            Command.Parameters.Add("DepartmentId", SqlDbType.Int);
            Command.Parameters["DepartmentId"].Value = student.DepartmentId;
            Command.Parameters.Add("RegNo", SqlDbType.VarChar);
            Command.Parameters["RegNo"].Value = student.RegNo;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public ViewStudentWithDEpartment GetStudent()
        {
            ViewStudentWithDEpartment viewStudentWithDEpartment = new ViewStudentWithDEpartment();
            Query = "SELECT TOP 1 * FROM ViewStudentWithDEpartment ORDER BY Id DESC";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    string[] date = Reader["Date"].ToString().Split(' ');
                    viewStudentWithDEpartment.Name = Reader["Name"].ToString();
                    viewStudentWithDEpartment.Email = Reader["Email"].ToString();
                    viewStudentWithDEpartment.ContactNo = Reader["ContactNo"].ToString();
                    viewStudentWithDEpartment.Address = Reader["Address"].ToString();
                    viewStudentWithDEpartment.Date = date[0];
                    viewStudentWithDEpartment.RegNo = Reader["RegNo"].ToString();
                    viewStudentWithDEpartment.Department = Reader["Department"].ToString();
                }
                Reader.Close();
            }
            Connection.Close();
            return viewStudentWithDEpartment;
        }

        public bool IsEmailExists(string Email)
        {
            bool isEmailExists = false;
            Query = "SELECT *FROM ViewStudentWithDEpartment WHERE Email='" + Email + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isEmailExists = true;
            }
            Connection.Close();
            return isEmailExists;
        }


        public List<ViewStudentWithDEpartment> GetStudentRegNoId()
        {
            List<ViewStudentWithDEpartment> viewStudentWithDEpartments = new List<ViewStudentWithDEpartment>();
            Query = "SELECT*FROM ViewStudentWithDEpartment";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    ViewStudentWithDEpartment viewStudentWithDEpartment = new ViewStudentWithDEpartment();
                    viewStudentWithDEpartment.Id = Int32.Parse(Reader["Id"].ToString());
                    viewStudentWithDEpartment.RegNo = Reader["RegNo"].ToString();

                    viewStudentWithDEpartments.Add(viewStudentWithDEpartment);
                }
                Reader.Close();
            }
            Connection.Close();
            return viewStudentWithDEpartments;
        }

        public ViewStudentWithDEpartment GetStudentByRegNo(int id)
        {
            ViewStudentWithDEpartment viewStudentWithDEpartment = new ViewStudentWithDEpartment();
            Query = "SELECT * FROM ViewStudentWithDEpartment Where Id=" + id + "";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    string[] date = Reader["Date"].ToString().Split(' ');
                    viewStudentWithDEpartment.Name = Reader["Name"].ToString();
                    viewStudentWithDEpartment.Email = Reader["Email"].ToString();
                    viewStudentWithDEpartment.ContactNo = Reader["ContactNo"].ToString();
                    viewStudentWithDEpartment.Address = Reader["Address"].ToString();
                    viewStudentWithDEpartment.Date = date[0];
                    viewStudentWithDEpartment.RegNo = Reader["RegNo"].ToString();
                    viewStudentWithDEpartment.Department = Reader["Department"].ToString();
                    viewStudentWithDEpartment.DepartmentId = Int32.Parse(Reader["DepartmentId"].ToString());
                }
                Reader.Close();
            }
            Connection.Close();
            return viewStudentWithDEpartment;
        }


        public int AssignCourseToStudent(CourseAssignStudent courseAssignStudent)
        {
            Query = "INSERT INTO CourseAssignStudent(StudentId,DepartmentName,DepartmentId,CourseId,Date) VALUES(@StudentId,@DepartmentName,@DepartmentId,@CourseId,@Date)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("StudentId", SqlDbType.Int);
            Command.Parameters["StudentId"].Value = courseAssignStudent.StudentId;
            Command.Parameters.Add("DepartmentName", SqlDbType.VarChar);
            Command.Parameters["DepartmentName"].Value = courseAssignStudent.DepartmentName;
            Command.Parameters.Add("DepartmentId", SqlDbType.Int);
            Command.Parameters["DepartmentId"].Value = courseAssignStudent.DepartmentId;
            Command.Parameters.Add("CourseId", SqlDbType.Int);
            Command.Parameters["CourseId"].Value = courseAssignStudent.CourseId;
            Command.Parameters.Add("Date", SqlDbType.Date);
            Command.Parameters["Date"].Value = courseAssignStudent.Date;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public List<Student> GetEnrolledStudentRegNo()
        {
            List<Student> students = new List<Student>();
            Query = "SELECT DISTINCT Student.Id, Student.RegNo FROM Student JOIN CourseAssignStudent ON CourseAssignStudent.StudentId=Student.Id";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Student student = new Student();
                    student.Id = Int32.Parse(Reader["Id"].ToString());
                    student.RegNo = Reader["RegNo"].ToString();
                    students.Add(student);
                }
                Reader.Close();
            }
            Connection.Close();
            return students;
        }

        public int SaveStudentWithResult(StudentResult studentResult)
        {
            Query = "INSERT INTO StudentResult(StudentId,CourseId,GradeId) VALUES(@StudentId,@CourseId,@GradeId)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("StudentId", SqlDbType.Int);
            Command.Parameters["StudentId"].Value = studentResult.StudentId;
            Command.Parameters.Add("CourseId", SqlDbType.Int);
            Command.Parameters["CourseId"].Value = studentResult.CourseId;
            Command.Parameters.Add("GradeId", SqlDbType.Int);
            Command.Parameters["GradeId"].Value = studentResult.GradeId;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public List<ResultView> GetResultViews(int id)
        {
            List<ResultView> resultViews = new List<ResultView>();
            Query = "SELECT DISTINCT Course.Code, Course.Name, Grade.Name Grade FROM Course JOIN CourseAssignStudent ON Course.Id=CourseAssignStudent.CourseId AND CourseAssignStudent.StudentId=" + id + " LEFT JOIN StudentResult ON Course.Id=StudentResult.CourseId AND StudentResult.StudentId=" + id + " LEFT JOIN Grade ON StudentResult.GradeId=Grade.Id";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    ResultView resultView = new ResultView();
                    resultView.Code = Reader["Code"].ToString();
                    resultView.Name = Reader["Name"].ToString();
                    resultView.Grade = Reader["Grade"].ToString() == "" ? "Not Graded Yet" : Reader["Grade"].ToString();
                    resultViews.Add(resultView);
                }
                Reader.Close();
            }
            Connection.Close();
            return resultViews;
        }
    }
}