using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls.WebParts;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class ViewClassScheduleAndRoomAllocationGateway:CommonGateway
    {
        public List<ViewClassScheduleAndRoomAllocation> GetRoomSchedule(int departmentId)
        {
            string CourseCode = "";
            List<ViewClassScheduleAndRoomAllocation> viewClassScheduleAndRoom = new List<ViewClassScheduleAndRoomAllocation>();
            Query = "SELECT*FROM ViewDepartmentCourse Where Id = '" + departmentId + "'";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                
                while (Reader.Read())
                {
                    ViewClassScheduleAndRoomAllocation viewClassScheduleAndRoomAllocation = new ViewClassScheduleAndRoomAllocation();
                    viewClassScheduleAndRoomAllocation.DepartmentId = Int32.Parse(Reader["Id"].ToString());
                    CourseCode = Reader["Code"].ToString();
                    viewClassScheduleAndRoomAllocation.CourseCode = CourseCode;
                    viewClassScheduleAndRoomAllocation.CourseName = Reader["Name"].ToString();
                    viewClassScheduleAndRoomAllocation.ScheduleInfosM = RoomInfo(CourseCode);
                    viewClassScheduleAndRoom.Add(viewClassScheduleAndRoomAllocation);
                }
                Reader.Close();
            }
            Connection.Close();
            return viewClassScheduleAndRoom;
        }

        public string RoomInfo(string courseCode)
        {
            string message = "";
            List<ScheduleInfo> scheduleInfos = new List<ScheduleInfo>();
            using (var conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["UCRMSApp"].ConnectionString))
            using (var cmd = conn.CreateCommand())
            {
                conn.Open();
                cmd.CommandText = "SELECT *FROM  ViewClassScheduleRoomAllocation Where Code = '" + courseCode + "' AND IsAssign=1";
                using (var reader = cmd.ExecuteReader())
                
                if(reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ScheduleInfo scheduleInfo = new ScheduleInfo();
                        scheduleInfo.RoomName = (reader["RoomName"].ToString());
                        scheduleInfo.DayName = reader["DayName"].ToString();
                        scheduleInfo.StartTime = reader["StartTime"].ToString();
                        scheduleInfo.StartAmPm = reader["StartAMPM"].ToString();
                        scheduleInfo.EndTime = reader["EndTime"].ToString();
                        scheduleInfo.EndAmPm = reader["EndAMPM"].ToString();
                        scheduleInfos.Add(scheduleInfo);
                        List<string> scheduleMessage = new List<string>();
                        foreach (var scheduleInfoMessage in scheduleInfos)
                        {

                            scheduleMessage.Add("R. No:" + scheduleInfoMessage.RoomName + "," + scheduleInfoMessage.DayName + "," + scheduleInfoMessage.StartTime + " " + scheduleInfoMessage.StartAmPm + "-" + scheduleInfoMessage.EndTime + " " + scheduleInfoMessage.EndAmPm);

                        }
                        message = string.Join(";"+"<br/>",scheduleMessage.ToArray());
                    }
                    reader.Close();
                }
                else
                {
                    message = "Not Scheduled Yet";
                    reader.Close();
                }
            }
            return message;
        }
    }
}