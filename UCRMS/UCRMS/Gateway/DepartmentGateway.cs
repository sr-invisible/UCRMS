using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class DepartmentGateway:CommonGateway
    {
        public int Save(Department department)
        {
            Query = "INSERT INTO Department(Code,Name) VALUES(@Code,@Name)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("Code", SqlDbType.VarChar);
            Command.Parameters["Code"].Value = department.Code;
            Command.Parameters.Add("Name", SqlDbType.VarChar);
            Command.Parameters["Name"].Value = department.Name;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public bool IsCodeExists(string code)
        {
            bool isCodeExists = false;
            Query = "SELECT*FROM Department WHERE Code='" + code + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isCodeExists = true;
            }
            Connection.Close();
            return isCodeExists;
        }

        public bool IsNameExists(string name)
        {
            bool isCodeExists = false;
            Query = "SELECT*FROM Department WHERE Name='" + name + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isCodeExists = true;
            }
            Connection.Close();
            return isCodeExists;
        }

        public List<Department> ShowAllDepartments()
        {
            int i = 0;
            Query = "SELECT*FROM Department";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Department> departments = new List<Department>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    i++;
                    Department department = new Department();
                    department.Id = Convert.ToInt32(Reader["Id"].ToString());
                    department.Name = Reader["Name"].ToString();
                    department.Code = Reader["Code"].ToString();
                    department.Sl = i;
                    departments.Add(department);
                }
                Reader.Close();
            }
            Connection.Close();
            return departments;
        }
        public string ShowDepartmentCode(int departmentId)
        {
            string deptCode = "";
            Query = "SELECT*FROM Department WHERE Id=" + departmentId;
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    deptCode = Reader["Code"].ToString();
                }
                Reader.Close();
            }
            Connection.Close();
            return deptCode;
        }
    }
}