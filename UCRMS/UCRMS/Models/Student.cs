using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class Student
    {
        public int Id { set; get; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string ContactNo { get; set; }
        public string Address { get; set; }
        public string Date { set; get; }
        public int DepartmentId { get; set; }
        public string RegNo { set; get; }
    }
}