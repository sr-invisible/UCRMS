using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Models;

namespace UCRMS.Gateway
{
    public class RoomGateway:CommonGateway
    {
        public List<Room> GetRoom()
        {
            Query = "SELECT*FROM Room Where IsAssign = 0";
            Command.CommandText = Query;
            Command.Connection = Connection;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Room> rooms = new List<Room>();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    Room room = new Room();
                    room.Id = Int32.Parse(Reader["Id"].ToString());
                    room.RoomName = Reader["RoomName"].ToString();
                    rooms.Add(room);
                }
                Reader.Close();
            }
            Connection.Close();
            return rooms;
        }
    }
}