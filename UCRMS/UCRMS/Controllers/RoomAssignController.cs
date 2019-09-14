using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class RoomAssignController : Controller
    {

        DepartmentManager departmentManager = new DepartmentManager();
        CourseManager courseManager = new CourseManager();
        DayManager dayManager = new DayManager();
        RoomManager roomManager = new RoomManager();
        RoomAssignManager roomAssignManager = new RoomAssignManager();

        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }

        [HttpPost]
        public ActionResult Save(RoomAssign roomAssign)
        {
            try
            {
                ViewBag.Message = roomAssignManager.Save(roomAssign) ? "Room Assigned Successfully" : "Room Assigned Faild";
            }
            catch (Exception exception)
            {
                ViewBag.Message = exception.Message;
            }
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }

        public ActionResult GetCourses(int departmentId)
        {
            List<Course> courses = courseManager.GetCoursesByDepartmentId(departmentId);
            return Json(courses);
        }
        public ActionResult GetRoom()
        {
            List<Room> courses = roomManager.GetRoom();
            return Json(courses);
        }
        public ActionResult GetDay()
        {
            List<Day> days = dayManager.GetDay();
            return Json(days);
        }

        public JsonResult IsRoomAssigned(int roomId, int dayId, string startTime, string endTime, string formAM, string toAM)
        {
            var student = roomAssignManager.IsRoomAssigned(roomId, dayId, startTime, endTime, formAM, toAM);

            if (student == true)
                return Json(false);
            return Json(true);
        }
    }
}