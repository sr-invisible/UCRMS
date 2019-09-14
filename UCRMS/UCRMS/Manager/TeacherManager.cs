using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class TeacherManager
    {
        TeacherGateway teacherGateway = new TeacherGateway();

        public bool Save(Teacher teacher)
        {
            if (IsCodeExists(teacher.Email))
            {
                throw new Exception("Email Already Exists");
            }

            return teacherGateway.Save(teacher) > 0;
        }

        private bool IsCodeExists(string email)
        {
            return teacherGateway.IsCodeExists(email);
        }

        public List<Teacher> GetTeachers(int teacherId)
        {
            return teacherGateway.GetTeachers(teacherId);
        }

        public ViewTeacherWithCouse GetTeacherWithCouse(int teacherId)
        {
            return teacherGateway.GetTeacherWithCouse(teacherId);
        }

        public bool AssignCourseToTeacher(CourseAssignTeacher courseAssignTeacher)
        {
            return teacherGateway.AssignCourseToTeacher(courseAssignTeacher) > 0;
        }

        public bool IsEmailExist(string Email)
        {
            return teacherGateway.IsEmailExists(Email);
        }
    }
}