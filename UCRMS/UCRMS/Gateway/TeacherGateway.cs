using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class TeacherGateway:CommonGateway
    {
        public int Save(Teacher teacher)
        {
            Query = "INSERT INTO Teacher(Name,Address,Email,ContactNo,DesignationId,DepartmentId,CreditToTake) VALUES(@Name,@Address,@Email,@ContactNo,@DesignationId,@DepartmentId,@CreditToTake)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.VarChar);
            Command.Parameters["Name"].Value = teacher.Name;
            Command.Parameters.Add("Address", SqlDbType.VarChar);
            Command.Parameters["Address"].Value = teacher.Address;
            Command.Parameters.Add("Email", SqlDbType.VarChar);
            Command.Parameters["Email"].Value = teacher.Email;
            Command.Parameters.Add("ContactNo", SqlDbType.Int);
            Command.Parameters["ContactNo"].Value = teacher.ContactNo;
            Command.Parameters.Add("DesignationId", SqlDbType.Int);
            Command.Parameters["DesignationId"].Value = teacher.DesignationId;
            Command.Parameters.Add("DepartmentId", SqlDbType.Int);
            Command.Parameters["DepartmentId"].Value = teacher.DepartmentId;
            Command.Parameters.Add("CreditToTake", SqlDbType.Decimal);
            Command.Parameters["CreditToTake"].Value = teacher.CreditToTake;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public bool IsCodeExists(string email)
        {
            bool isCodeExists = false;
            Query = "SELECT*FROM Teacher WHERE Email='" + email + "'";
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

        public List<Teacher> GetTeachers(int departmentId)
        {
            Query = "SELECT*FROM Teacher WHERE DepartmentId='" + departmentId + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Teacher> teachers = new List<Teacher>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Teacher teacher = new Teacher();
                    teacher.Id = Int32.Parse(Reader["Id"].ToString());
                    teacher.Name = Reader["Name"].ToString();
                    teachers.Add(teacher);
                }
                Reader.Close();
            }
            Connection.Close();
            return teachers;
        }


        public ViewTeacherWithCouse GetTeacherWithCouse(int teacherId)
        {
            ViewTeacherWithCouse viewTeacherWithCouse = new ViewTeacherWithCouse();
            Query = "SELECT*FROM ViewTeacherWithCouse WHERE TeacherId='" + teacherId + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    viewTeacherWithCouse.TeacherId = Int32.Parse(Reader["TeacherId"].ToString());
                    viewTeacherWithCouse.CreditTaken = float.Parse(Reader["CreditTaken"].ToString());
                    viewTeacherWithCouse.CreditToTake = float.Parse(Reader["CreditToTake"].ToString());
                }
                Reader.Close();
            }
            Connection.Close();
            return viewTeacherWithCouse;
        }


        public int AssignCourseToTeacher(CourseAssignTeacher courseAssignTeacher)
        {
            Query = "INSERT INTO CourseAssignTeacher(TeacherId,CourseId,CourseCredit,IsActive) VALUES(@TeacherId,@CourseId,@CourseCredit,1)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("TeacherId", SqlDbType.Int);
            Command.Parameters["TeacherId"].Value = courseAssignTeacher.TeacherId;
            Command.Parameters.Add("CourseId", SqlDbType.Int);
            Command.Parameters["CourseId"].Value = courseAssignTeacher.CourseId;
            Command.Parameters.Add("CourseCredit", SqlDbType.Decimal);
            Command.Parameters["CourseCredit"].Value = courseAssignTeacher.Credit;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Query = "UPDATE Course SET IsActive=1 WHERE Id='" + courseAssignTeacher.CourseId + "' ";
            Command.CommandText = Query;
            Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }
        public bool IsEmailExists(object email)
        {
            bool isEmailExists = false;
            Query = "SELECT *FROM Teacher WHERE Email='" + email + "'";
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
    }
}