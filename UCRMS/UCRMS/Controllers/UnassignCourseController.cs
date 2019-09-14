using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;

namespace UCRMS.Controllers
{
    public class UnassignCourseController : Controller
    {
        CourseManager courseManager = new CourseManager();
        // GET: UnassignCourse
        public ActionResult UnAssignCourse()
        {
            return View();
        }

        public void UnAssignCourses()
        {
            courseManager.UnAssignCourse();
        }

        public void UnAssignCourseWithTeacher()
        {
            courseManager.UnAssignCourseWithTeacher();
        }
    }
}