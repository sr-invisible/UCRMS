using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class GradeGateway:CommonGateway
    {
        public List<Grade> GetAll()
        {
            List<Grade> grades = new List<Grade>();
            Query = "SELECT*FROM Grade";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Grade grade = new Grade();
                    grade.Id = Int32.Parse(Reader["Id"].ToString());
                    grade.Name = Reader["Name"].ToString();

                    grades.Add(grade);
                }
                Reader.Close();
            }
            Connection.Close();
            return grades;

        }
    }
}