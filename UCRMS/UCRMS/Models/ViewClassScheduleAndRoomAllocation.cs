using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace UCRMS.Models
{
    public class ViewClassScheduleAndRoomAllocation
    {
        public int DepartmentId { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }

        public string ScheduleInfosM { get; set; }
    }
}