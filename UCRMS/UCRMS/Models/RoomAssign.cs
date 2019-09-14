using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class RoomAssign
    {
        public int Id { get; set; }
        public int DepartmentId { get; set; }
        public int CourseId { get; set; }
        public int RoomId { get; set; }
        public int DayId { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public string FromAmPm { get; set; }
        public string ToAmPm { get; set; }

    }
}