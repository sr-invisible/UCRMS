using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class ViewResultController : Controller
    {
        StudentManager studentManager = new StudentManager();
        // GET: ViewResult
        public ActionResult ViewResult()
        {
            ViewBag.Student = studentManager.GetStudentRegNoId();
            return View();
        }

        public ActionResult GetStudentByRegNo(int id)
        {
            ViewStudentWithDEpartment viewStudentWithDEpartment = studentManager.GetStudentByRegNo(id);
            return Json(viewStudentWithDEpartment);
        }

        public ActionResult GetResultViews(int id)
        {
            List<ResultView> resultViews = studentManager.GetResultViews(id);
            return Json(resultViews);
        }

        public ActionResult ViewPdfResult()
        {
            return View();
        }
    }
}