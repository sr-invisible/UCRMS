using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class DesignationManager
    {

        DesignationGateway designationGateway = new DesignationGateway();

        public List<Designation> GetAllDesignations()
        {
            return designationGateway.GetAllDesignations();
        }
    }
}