using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class CourseAssignTeacher
    {
        public int Id { set; get; }
        public int TeacherId { set; get; }
        public int CourseId { set; get; }
        public float Credit { set; get; }
    }
}