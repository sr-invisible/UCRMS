using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class CourseAssignTeacherController : Controller
    {
        DepartmentManager departmentManager = new DepartmentManager();
        TeacherManager teacherManager = new TeacherManager();
        CourseManager courseManager = new CourseManager();
        // GET: CourseAssignTeacher
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }

        [HttpPost]
        public ActionResult Save(CourseAssignTeacher courseAssignTeacher)
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            ViewBag.Message = teacherManager.AssignCourseToTeacher(courseAssignTeacher) ? "Course Assigned" : "Course Assign Failed";
            return View();
        }

        public ActionResult GetTeachers(int departmentId)
        {
            List<Teacher> teachers = teacherManager.GetTeachers(departmentId);
            return Json(teachers);
        }

        [HttpPost]
        public ActionResult GetCourses(int departmentId)
        {
            List<Course> courses = courseManager.GetCoursesByDepartmentName(departmentId);
            return Json(courses);
        }

        public ActionResult GetCourseByCourseCode(int courseId)
        {
            Course courses = courseManager.GetCourseByCourseCode(courseId);
            return Json(courses);
        }

        public ActionResult GetTeacherWithCouse(int teacherId)
        {
            ViewTeacherWithCouse viewTeacherWithCouse = teacherManager.GetTeacherWithCouse(teacherId);
            return Json(viewTeacherWithCouse);
        }
    }
}