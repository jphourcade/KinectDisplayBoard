namespace Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes
{

    public class TriviaRoot
    {
        public int response_code { get; set; }
        public TriviaResult[] results { get; set; }
    }

    public class TriviaResult
    {
        public string category { get; set; }
        public string type { get; set; }
        public string difficulty { get; set; }
        public string question { get; set; }
        public string correct_answer { get; set; }
        public string[] incorrect_answers { get; set; }
    }


    public class FunFact
    {
        public string text { get; set; }
        public int year { get; set; }
        public int number { get; set; }
        public bool found { get; set; }
        public string type { get; set; }
    }


}
