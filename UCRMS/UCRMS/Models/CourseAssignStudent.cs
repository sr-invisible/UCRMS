using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class CourseAssignStudent
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int DepartmentId { get; set; }
        public int CourseId { get; set; }
        public string DepartmentName { get; set; }
        public string Date { get; set; }
    }
}