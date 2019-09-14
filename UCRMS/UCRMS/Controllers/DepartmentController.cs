using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using Microsoft.Ajax.Utilities;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class DepartmentController : Controller
    {
        DepartmentManager departmentManager = new DepartmentManager();

        // GET: Department
        public ActionResult Save()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Save(Department department)
        {
            try
            {
                ViewBag.Message = departmentManager.Save(department) ? "Department Saved Successfully" : "Department Save Failed";
            }
            catch (Exception exception)
            {
                ViewBag.Message = exception.Message;
            }
            ViewBag.Department = departmentManager.ShowAllDepartments();
            return View();
        }

        public ActionResult ViewDepartment()
        {
            return View();
        }
        public ActionResult JsonViewDepartment()
        {
            var Department = departmentManager.ShowAllDepartments();
            return Json(Department,JsonRequestBehavior.AllowGet);
        }
        public JsonResult IsCodeExists(string code)
        {

            var deptCode = departmentManager.IsCodeExists(code);

            if (deptCode == true)
                return Json(false);
            return Json(true);
        }
        
    }
}