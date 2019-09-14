using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class EnrollCourseController : Controller
    {
        StudentManager studentManager = new StudentManager();
        CourseManager courseManager = new CourseManager();
        // GET: EnrollCourse
        public ActionResult Enroll()
        {
            ViewBag.Student = studentManager.GetStudentRegNoId();
            return View();
        }


        public ActionResult GetStudentByRegNo(int id)
        {
            ViewStudentWithDEpartment viewStudentWithDEpartment = studentManager.GetStudentByRegNo(id);
            return Json(viewStudentWithDEpartment);
        }

        public ActionResult GetCoursesByDeptId(int id, int studentId)
        {
            List<Course> courses = courseManager.GetCoursesByDeptId(id, studentId);
            return Json(courses);
        }


        public void AssignCourseToStudent(CourseAssignStudent courseAssignStudent)
        {
            studentManager.AssignCourseToStudent(courseAssignStudent);
        }

    }
}