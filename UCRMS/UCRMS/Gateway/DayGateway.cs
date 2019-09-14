using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class DayGateway:CommonGateway
    {
        public List<Day> GetDay()
        {
            Query = "SELECT*FROM Days";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Day> days = new List<Day>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Day day = new Day();
                    day.Id = Int32.Parse(Reader["Id"].ToString());
                    day.DayDet = Reader["DayDet"].ToString();
                    days.Add(day);
                }
                Reader.Close();
            }
            Connection.Close();
            return days; 
        }
    }
}