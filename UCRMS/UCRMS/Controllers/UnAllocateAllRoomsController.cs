using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UCRMS.Manager;

namespace UCRMS.Controllers
{
    public class UnAllocateAllRoomsController : Controller
    {
        // GET: UnAllocateAllRooms
        public ActionResult UnAllocateAllRoom()
        {
            return View();
        }

        public bool UnAllocateAllRoomsResult()
        {
            bool IsAssign = false;
            RoomAssignManager roomAssignManager = new RoomAssignManager();
            return IsAssign =roomAssignManager.UnAllocateAllRoomsResult();
        }
    }
}