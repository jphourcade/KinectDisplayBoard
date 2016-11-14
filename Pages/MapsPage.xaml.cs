using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace Microsoft.Samples.Kinect.ControlsBasics.Pages
{
    /// <summary>
    /// Interaction logic for MapsPage.xaml
    /// </summary>
    public partial class MapsPage : UserControl
    {
        public static int SavedDay = 999;
        private static Dictionary<string, BitmapImage> slideImages = new Dictionary<string, BitmapImage>();
        private Dictionary<string, string> titleTextDict = new Dictionary<string, string>()
        {
            { "Floor 1", "Map: Floor 1 (Entry Way)" },
            { "Floor 2", "Map: Floor 2" },
            { "Floor 3", "Map: Floor 3" },
            { "Ground Floor", "Map: Ground Floor" },
            { "Basement", "Map: Basement" }
        };
        public static string initMap = "Floor 1";

        public MapsPage()
        {
            InitializeComponent();
            GetMaps();             
        }

        private async void GetMaps()
        {
            if (DateTime.Today.Day != SavedDay)
            {
                SavedDay = DateTime.Today.Day;
                slideImages = await GetSlidesAsync();
            }
            Loading.Visibility = Visibility.Collapsed;
            MapImage.Source = slideImages[initMap];
            MapTitle.Text = titleTextDict[initMap];
        }
        
        private void GetSlideURLs(object sender, ElapsedEventArgs e)
        {
            GetMaps();
        }
        async Task<Dictionary<string, BitmapImage>> GetSlidesAsync()
        {
            Dictionary<string, string> linksDict = new Dictionary<string, string>()
            {
                { "Floor 1", "https://cs.uiowa.edu/sites/cs.uiowa.edu/files/files/floor1.png" },
                { "Floor 2", "https://cs.uiowa.edu/sites/cs.uiowa.edu/files/files/Floor2.png" },
                { "Floor 3", "https://cs.uiowa.edu/sites/cs.uiowa.edu/files/files/Floor3.png" },
                { "Ground Floor", "https://cs.uiowa.edu/sites/cs.uiowa.edu/files/files/Ground.png" },
                { "Basement", "https://cs.uiowa.edu/sites/cs.uiowa.edu/files/files/Basement.png" }
            };

            Dictionary<string, BitmapImage> images = await Task.Run(() =>
            {
                Dictionary<string,BitmapImage> imgs = new Dictionary<string, BitmapImage>();
                var webClient = new WebClient();
                Dictionary<string, string>.KeyCollection keyColl =  linksDict.Keys;
                
                foreach(string s in keyColl)
                {           
                    try
                    {
                            var buffer = webClient.DownloadData(linksDict[s]);
                            var bitmapImage = new BitmapImage();
                            using (var stream = new MemoryStream(buffer))
                            {
                                bitmapImage.BeginInit();
                                bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                                bitmapImage.StreamSource = stream;
                                bitmapImage.EndInit();
                                bitmapImage.Freeze();
                                imgs.Add(s, bitmapImage);
                            }
                        }
                        catch { }
                    }
                    Debug.WriteLine(imgs.Count);
                return imgs;
            });
       
            return images;
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            MapImage.Source = slideImages[(string)rb.Content];
            MapTitle.Text = titleTextDict[(string)rb.Content];
        }


        //Touch scaling code.  To be dealt with later
        private void centerImageView_ManipulationStarting(object sender, ManipulationStartingEventArgs e)
        {
            e.ManipulationContainer = this;
            e.Handled = true;
        }

        private void centerImageView_ManipulationDelta(object sender, ManipulationDeltaEventArgs e)
        {
        // get current matrix of the element.
         Matrix borderMatrix = ((MatrixTransform)MapImage.RenderTransform).Matrix;
            //determine if action is zoom or pinch
            var maxScale = Math.Max(e.DeltaManipulation.Scale.X, e.DeltaManipulation.Scale.Y);
            //check if not crossing minimum and maximum zoom limit
            if ((maxScale < 1 && borderMatrix.M11 * maxScale > 0) ||
            (maxScale > 1 && borderMatrix.M11 * maxScale < 100))
            {
                //scale to most recent change (delta) in X & Y 
                borderMatrix.ScaleAt(e.DeltaManipulation.Scale.X,
                        e.DeltaManipulation.Scale.Y,
                        MapImage.ActualWidth / 2,
                        MapImage.ActualHeight / 2);
                //render new matrix
                MapImage.RenderTransform = new MatrixTransform(borderMatrix);
            }
        }

        private void MapImage_ManipulationCompleted(object sender, ManipulationCompletedEventArgs e)
        {

        }
    }
}
