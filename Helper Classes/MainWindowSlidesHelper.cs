using HtmlAgilityPack;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Timers;
using System.Windows.Media.Imaging;

namespace Microsoft.Samples.Kinect.ControlsBasics
{
    partial class MainWindow
    {
        private static Timer slideSwapTimer;
        private static List<BitmapImage> slideImages = new List<BitmapImage>();

        private void SetSlideSwapTimer()
        {
            slideSwapTimer = new Timer(10000);
            slideSwapTimer.Elapsed += RotateSlides;
            slideSwapTimer.AutoReset = true;
            slideSwapTimer.Enabled = true;
        }

        private async void GetSlides()
        {
            List<BitmapImage> imageList = await GetSlidesAsync();
            slideImages = imageList;
        }

        private void GetSlideURLs(object sender, ElapsedEventArgs e)
        {
            GetSlides();
        }
        async Task<List<BitmapImage>> GetSlidesAsync()
        {

            HttpClient client = new HttpClient();
            var doc = new HtmlDocument();
            var html = await client.GetStringAsync("http://signage.uiowa.edu/computer-science/computer-science");
            doc.LoadHtml(html);
            List<string> imageLinks = await Task.Run(() =>
            {
                List<string> links = new List<string>();
                try
                {
                    var rows = doc.DocumentNode.SelectNodes("//*[@id='flexslider-1']/ul/li/div/div/img");
                    foreach (var row in rows)
                    {
                        links.Add(row.Attributes["src"].Value);
                    }
                    return links;
                }
                catch { return links; }
            });

            List<BitmapImage> images = await Task.Run(() =>
            {
                List<BitmapImage> imgs = new List<BitmapImage>();
                foreach (var link in imageLinks)
                {
                    var webClient = new WebClient();
                    try
                    {
                        var buffer = webClient.DownloadData(link);
                        var bitmapImage = new BitmapImage();
                        using (var stream = new MemoryStream(buffer))
                        {
                            bitmapImage.BeginInit();
                            bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                            bitmapImage.StreamSource = stream;
                            bitmapImage.EndInit();
                            bitmapImage.Freeze();
                            imgs.Add(bitmapImage);
                        }
                    }
                    catch { }
                }
                return imgs;
            });            
            return images;
        }
    }
}
