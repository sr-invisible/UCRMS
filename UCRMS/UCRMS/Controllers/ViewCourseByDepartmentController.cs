using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class ViewCourseByDepartmentController : Controller
    {
        DepartmentManager departmentManager = new DepartmentManager();
        CourseManager courseManager = new CourseManager();
        // GET: ViewCourseByDepartment
        public ActionResult Show()
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }


        public ActionResult ShowCoursesByDepartment(int departmentId)
        {
            List<ViewAllCoursesWithTeacher> viewAllCoursesWithTeachers =
            courseManager.GetAllCoursesWithTeachersByDepartment(departmentId);
            return Json(viewAllCoursesWithTeachers);
        }
    }
}