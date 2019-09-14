using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class ScheduleInfo
    {
        public string RoomName { get; set; }
        public string DayName { get; set; }
        public string StartTime { get; set; }
        public string StartAmPm { get; set; }
        public string EndTime { get; set; }
        public string EndAmPm { get; set; }
    }
}