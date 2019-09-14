﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class ViewStudentWithDEpartment
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string ContactNo { get; set; }
        public string Address { get; set; }
        public string Date { get; set; }
        public string RegNo { get; set; }
        public string Department { get; set; }
        public int DepartmentId { set; get; }
    }
}