using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class SaveStudentResultController : Controller
    {
        StudentManager studentManager = new StudentManager();
        CourseManager courseManager = new CourseManager();
        GradeManager gradeManager = new GradeManager();
        public ActionResult Save()
        {
            ViewBag.Students = studentManager.GetStudentRegNoId();
            ViewBag.Grades = gradeManager.GetAll();
            return View();
        }

        public ActionResult GetStudentByRegNo(int id)
        {
            ViewStudentWithDEpartment viewStudentWithDEpartment = studentManager.GetStudentByRegNo(id);
            return Json(viewStudentWithDEpartment);
        }


        public ActionResult GetEnrolledCoursesByStudent(int id, int studentId)
        {
            List<Course> courses = courseManager.GetEnrolledCoursesByStudent(id, studentId);
            return Json(courses);
        }

        public void SaveStudentWithResult(StudentResult studentResult)
        {
            studentManager.SaveStudentWithResult(studentResult);
        }
    }
}