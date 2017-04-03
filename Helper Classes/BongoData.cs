using System.Collections.Generic;

namespace Microsoft.Samples.Kinect.ControlsBasics
{
    class BongoData
    {
        public StopInfo stopinfo { get; set; }
        public List<PredictionData> predictions { get; set; }
    }

    class PredictionData
    {
        public string title { get; set; }
        public string tag { get; set; }
        public int minutes { get; set; }
        public string agency { get; set; }
        public string agencyName { get; set; }
        //public string direction { get; set; }  //This is removed in latest bongo api update
        //public string stopname { get; set; }  //This is removed in latest bongo api update

    }

    class StopInfo
    {
        public string stopid { get; set; }
    }

    class VisibleBongoData
    {
        public string stopid { get; set; }
        public string routename { get; set; }
        public string minutes { get; set; }
        public string color { get; set; }
    }
}
