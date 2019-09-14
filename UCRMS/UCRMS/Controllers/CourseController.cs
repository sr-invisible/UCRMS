using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class CourseController : Controller
    {

        CourseManager courseManager = new CourseManager();
        SemesterManager semesterManager = new SemesterManager();
        // GET: Course
        public ActionResult Save()
        {
            ViewBag.Departments = courseManager.ShowAllDepartments();
            ViewBag.Semesters = semesterManager.GetAllSemesters();
            return View();
        }

        [HttpPost]
        public ActionResult Save(Course course)
        {
            try
            {
                ViewBag.Message = courseManager.Save(course) ? "Course Saved" : "Course Save Failed";


            }
            catch (Exception exception)
            {
                ViewBag.Message = exception.Message;
            }

            ViewBag.Departments = courseManager.ShowAllDepartments();
            ViewBag.Semesters = semesterManager.GetAllSemesters();

            return View();
        }
    }
}