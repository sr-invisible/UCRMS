using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class ViewAllCoursesWithTeacher
    {
        public int Id { set; get; }
        public string Code { set; get; }
        public string Name { set; get; }
        public string Semester { set; get; }
        public string AssignedTo { set; get; }
        public int DepartmentId { set; get; }
    }
}