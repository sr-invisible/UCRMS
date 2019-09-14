using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class StudentController : Controller
    {
        StudentManager studentManager = new StudentManager();
        DepartmentManager departmentManager = new DepartmentManager();
        // GET: Student
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }

        [HttpPost]
        public ActionResult Save(Student student)
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            ViewBag.Message = studentManager.SaveStudent(student) ? "Student Saved" : "Student Saving Process Failed";
            return View();
        }

        public JsonResult GetStudent()
        {
            ViewStudentWithDEpartment student = studentManager.GetStudent();
            return Json(student);
        }

        public JsonResult CheckName(string Email)
        {

            var student = studentManager.IsEmailExist(Email);

            if (student == true)
                return Json(false);
            return Json(true);
        }
    }
}