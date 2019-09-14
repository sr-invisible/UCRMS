using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class DepartmentManager
    {
        DepartmentGateway departmentGateway = new DepartmentGateway();

        public bool Save(Department department)
        {
            if (IsCodeExists(department.Code))
            {
                throw new Exception("Sorry!!!Code Already Exists.");
            }

            if (IsNameExists(department.Name))
            {
                throw new Exception("Sorry!!!Name Already Exists");
            }

            return departmentGateway.Save(department) > 0;
        }

        public bool IsCodeExists(string code)
        {
            return departmentGateway.IsCodeExists(code);
        }

        public bool IsNameExists(string name)
        {
            return departmentGateway.IsNameExists(name);
        }

        public List<Department> ShowAllDepartments()
        {
            return departmentGateway.ShowAllDepartments();
        }
    }
}