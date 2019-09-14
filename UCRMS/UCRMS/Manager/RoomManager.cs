using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class RoomManager
    {
        RoomGateway roomGateway = new RoomGateway();
        public List<Room> GetRoom()
        {
            return roomGateway.GetRoom();
        }
    }
}