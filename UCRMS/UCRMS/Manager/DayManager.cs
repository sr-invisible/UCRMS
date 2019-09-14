using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class DayManager
    {
        DayGateway dayGateway = new DayGateway();
        public List<Day> GetDay()
        {
            return dayGateway.GetDay();
        }
    }
}