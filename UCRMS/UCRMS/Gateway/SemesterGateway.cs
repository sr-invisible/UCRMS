using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class SemesterGateway:CommonGateway
    {
        public List<Semester> GetAllSemesters()
        {
            Query = "SELECT*FROM Semester";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Semester> semesters = new List<Semester>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Semester semester = new Semester();
                    semester.Id = Convert.ToInt32(Reader["Id"].ToString());
                    semester.Name = Reader["Name"].ToString();
                    semesters.Add(semester);
                }
                Reader.Close();
            }
            Connection.Close();
            return semesters;
        }
    }
}