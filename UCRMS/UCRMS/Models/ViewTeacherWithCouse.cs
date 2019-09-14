using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class ViewTeacherWithCouse
    {
        public int TeacherId { set; get; }
        public float CreditToTake { set; get; }
        public float CreditTaken { set; get; }
    }
}