using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;
using UCRMS.Models;

namespace UCRMS.Controllers
{
    public class ViewClassScheduleAndRoomAllocationController : Controller
    {
        DepartmentManager departmentManager = new DepartmentManager();
        ViewClassScheduleAndRoomAllocationManager viewClassSchedule = new ViewClassScheduleAndRoomAllocationManager();
        
        // GET: ViewClassScheduleAndRoomAllocation
        public ActionResult ViewClassScheduleRoomAllocation()
        {
            ViewBag.Departments = departmentManager.ShowAllDepartments();
            return View();
        }

        public ActionResult GetRoomSchedule(int departmentId)
        {
            List<ViewClassScheduleAndRoomAllocation> viewClassScheduleAndRoom = viewClassSchedule.GetRoomSchedule(departmentId);
            return Json(viewClassScheduleAndRoom);
        }

    }
}