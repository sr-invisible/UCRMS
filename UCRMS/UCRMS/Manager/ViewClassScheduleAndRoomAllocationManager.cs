using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class ViewClassScheduleAndRoomAllocationManager
    {
        ViewClassScheduleAndRoomAllocationGateway viewClassScheduleAndRoom = new ViewClassScheduleAndRoomAllocationGateway();
        public List<ViewClassScheduleAndRoomAllocation> GetRoomSchedule(int departmentId)
        {
            return viewClassScheduleAndRoom.GetRoomSchedule(departmentId);
        }
    }
}