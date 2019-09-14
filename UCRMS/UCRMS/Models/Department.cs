using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace UCRMS.Models
{
    public class Department
    {
        public int Sl { get; set; }
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }

    }
}