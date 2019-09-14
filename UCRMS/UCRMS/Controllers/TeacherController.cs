using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class TeacherController : Controller
    {
        DesignationManager designationManager = new DesignationManager();
        DepartmentManager departmentManager = new DepartmentManager();
        TeacherManager teacherManager = new TeacherManager();
        // GET: Teacher
        public ActionResult Save()
        {
            ViewBag.Designations = designationManager.GetAllDesignations();
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }

        [HttpPost]
        public ActionResult Save(Teacher teacher)
        {
            ViewBag.Designations = designationManager.GetAllDesignations();
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            try
            {
                ViewBag.Message = teacherManager.Save(teacher) ? "Teacher Saved" : "Teacher Saved Failed";

            }
            catch (Exception exception)
            {
                ViewBag.Message = exception.Message;
            }
            return View();
        }

        public JsonResult CheckName(string Email)
        {

            var student = teacherManager.IsEmailExist(Email);

            if (student == true)
                return Json(false);
            return Json(true);
        }
    }
}