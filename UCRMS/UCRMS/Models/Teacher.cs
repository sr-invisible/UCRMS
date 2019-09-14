using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class Teacher
    {
        public int Id { set; get; }
        public string Name { set; get; }
        public string Address { set; get; }
        public string Email { set; get; }
        public int ContactNo { set; get; }
        public int DesignationId { get; set; }
        public int DepartmentId { set; get; }
        public float CreditToTake { set; get; }
    }
}