using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class RoomAssignGateway:CommonGateway
    {

        public bool IsRoomAssigned(int roomId, int dayId, string startTime, string endTime, string FromAmPm, string ToAmPm)
        {
            bool isRoomAssigned = false;
            Query = "select *from RoomAssign where RoomId='" + roomId + "' and DayId='" + dayId + "' And ((CAST(StartTime as time) > '" + startTime + "' and StartAMPM='" + FromAmPm + "') OR (CAST(StartTime as time) <= '" + endTime + "' and EndAMPM='" + ToAmPm + "')) AND IsAssign=1";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isRoomAssigned = true;
            }
            Connection.Close();
            return isRoomAssigned;
        }

        public int Save(RoomAssign roomAssign)
        {
            Query = "INSERT INTO RoomAssign(DepartmentId,CourseId, RoomId,DayId,StartTime,StartAMPM,EndTime,EndAMPM,IsAssign) VALUES(@DepartmentId,@CourseId, @RoomId,@DayId,@StartTime,@StartAMPM,@EndTime,@EndAMPM,1)";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Command.Parameters.Clear();
            Command.Parameters.Add("DepartmentId", SqlDbType.Int);
            Command.Parameters["DepartmentId"].Value = roomAssign.DepartmentId;
            Command.Parameters.Add("CourseId", SqlDbType.Int);
            Command.Parameters["CourseId"].Value = roomAssign.CourseId;
            Command.Parameters.Add("RoomId", SqlDbType.Int);
            Command.Parameters["RoomId"].Value = roomAssign.RoomId;
            Command.Parameters.Add("DayId", SqlDbType.Int);
            Command.Parameters["DayId"].Value = roomAssign.DayId;
            Command.Parameters.Add("StartTime", SqlDbType.VarChar);
            Command.Parameters["StartTime"].Value = roomAssign.StartTime;
            Command.Parameters.Add("StartAMPM", SqlDbType.VarChar);
            Command.Parameters["StartAMPM"].Value = roomAssign.FromAmPm;
            Command.Parameters.Add("EndTime", SqlDbType.VarChar);
            Command.Parameters["EndTime"].Value = roomAssign.EndTime;
            Command.Parameters.Add("EndAMPM", SqlDbType.VarChar);
            Command.Parameters["EndAMPM"].Value = roomAssign.ToAmPm;
            Connection.Open();
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected;
        }

        public bool UnAllocateAllRoomsResult()
        {
            bool isRoomAssigned = false;
            Query = "UPDATE RoomAssign SET IsAssign = 0 WHERE IsAssign = 1";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                isRoomAssigned = true;
            }
            Connection.Close();
            return isRoomAssigned;
        }
    }
}