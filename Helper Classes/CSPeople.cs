namespace Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes
{
    class CSPeople
    {
        public string Name { get; set; }
        public string Office { get; set; }
        public string Hours { get; set; }
        //public string Phone { get; set; } //Optional, not shown in UI
        public string Email { get; set; }
        public enum FloorEnum { f1, f2, f3, ground, basement, none };
        public FloorEnum Floor { get; set;   }
                
    }
}
