using System.Collections.Generic;

namespace Aktel.Domain
{
    public class Carrier
    {
        public int Id { get; private set; }
        public int ID { get; set; }
        public string Name { get; private set; }
        private List<PhoneDevice> _phoneDevices = new List<PhoneDevice>();

        public Carrier(int id,string name)
        {
            ID = id;
            Name = name;
        }

        public void AddPhoneDevices(PhoneDevice phoneDevice)
        {
            _phoneDevices.Add(phoneDevice);
        }

        public List<PhoneDevice> GetAllAssociatedPhoneDevices()
        {
            return _phoneDevices;
        }
    }
}