using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class CourseManager : CourseGateway
    {
        DepartmentGateway departmentGateway = new DepartmentGateway();
        CourseGateway courseGateway = new CourseGateway();

        public List<Department> ShowAllDepartments()
        {
            return departmentGateway.ShowAllDepartments();
        }

        public bool Save(Course course)
        {
            if (IsCodeExists(course.Code))
            {
                throw new Exception("Code Already Exists.");
            }

            if (IsNameExists(course.Name))
            {
                throw new Exception("Name Already Exists");
            }

            return courseGateway.Save(course)>0;
        }

        private bool IsCodeExists(string code)
        {
            return courseGateway.IsCodeExists(code);
        }

        private bool IsNameExists(string name)
        {
            return courseGateway.IsNameExists(name);
        }

        public List<Course> GetCoursesByDepartmentName(int departmentId)
        {
            return courseGateway.GetCoursesByDepartmentName(departmentId);
        }

        public Course GetCourseByCourseCode(int courseId)
        {
            return courseGateway.GetCourseByCourseCode(courseId);
        }

        public List<ViewAllCoursesWithTeacher> GetAllCoursesWithTeachersByDepartment(int departmentId)
        {
            return courseGateway.GetAllCoursesWithTeachersByDepartment(departmentId);
        }

        public List<Course> GetCoursesByDepartmentId(int departmentId)
        {
            return courseGateway.GetCoursesByDepartmentId(departmentId);
        }

        public List<Course> GetCoursesByDeptId(int id, int studentId)
        {
            return courseGateway.GetCoursesByDeptId(id, studentId);
        }

        public List<Course> GetEnrolledCoursesByStudent(int id, int studentId)
        {
            return courseGateway.GetEnrolledCoursesByStudent(id, studentId);
        }
        public bool UnAssignCourse()
        {
            return courseGateway.UnAssignCourse() > 0;
        }

        public bool UnAssignCourseWithTeacher()
        {
            return courseGateway.UnAssignCourseWithTeacher() > 0;
        }
    }
}