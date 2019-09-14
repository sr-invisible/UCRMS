using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class RoomAssignManager
    {
        RoomAssignGateway roomAssignGateway = new RoomAssignGateway();
        public bool IsRoomAssigned(int roomId, int dayId, string startTime, string endTime, string FromAmPm, string ToAmPm)
        {
            return roomAssignGateway.IsRoomAssigned(roomId, dayId, startTime, endTime, FromAmPm, ToAmPm);
        }

        public bool Save(RoomAssign roomAssign)
        {
            if (IsRoomAssigned(roomAssign.RoomId, roomAssign.DayId, roomAssign.StartTime, roomAssign.EndTime, roomAssign.FromAmPm, roomAssign.ToAmPm))
            {
                throw new Exception("Room is busy this time. try another slot!");
            }

            return roomAssignGateway.Save(roomAssign) > 0;
        }

        public bool UnAllocateAllRoomsResult()
        {
            return roomAssignGateway.UnAllocateAllRoomsResult();
        }
    }
}