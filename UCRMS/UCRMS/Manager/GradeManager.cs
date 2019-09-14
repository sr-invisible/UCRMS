using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class GradeManager
    {
        GradeGateway gradeGateway = new GradeGateway();

        public List<Grade> GetAll()
        {
            return gradeGateway.GetAll();
        } 
    }
}