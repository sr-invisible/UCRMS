using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class DesignationGateway:CommonGateway
    {

        public List<Designation> GetAllDesignations()
        {
            Query = "SELECT*FROM Designation";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Designation> designations = new List<Designation>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Designation designation = new Designation();
                    designation.Id = Convert.ToInt32(Reader["Id"].ToString());
                    designation.Name = Reader["Name"].ToString();
                    designations.Add(designation);
                }
                Reader.Close();
            }
            Connection.Close();
            return designations;
        }
    }
}