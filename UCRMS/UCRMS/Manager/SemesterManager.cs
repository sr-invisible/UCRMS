using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class SemesterManager
    {
        SemesterGateway semesterGateway = new SemesterGateway();

        public List<Semester> GetAllSemesters()
        {
            return semesterGateway.GetAllSemesters();
        }
    }
}