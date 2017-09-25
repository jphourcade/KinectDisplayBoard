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
    /// <summary>
    /// Helper file for MainWindow class that handles all slides on MainWindow
    /// </summary>
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

        /// <summary>
        /// Gets the slides for the page async
        /// </summary>
        private async void GetSlides()
        {
            List<BitmapImage> imageList = await GetSlidesAsync();
            slideImages = imageList;
        }

        /// <summary>
        /// Helper method that is called on a timer to get slides
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void GetSlideURLs(object sender, ElapsedEventArgs e)
        {
            GetSlides();
        }

        /// <summary>
        /// Gets the slides and saves them in a list as bitmapImages
        /// </summary>
        /// <returns></returns>
        async Task<List<BitmapImage>> GetSlidesAsync()
        {
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                HttpClient client = new HttpClient();
                var doc = new HtmlDocument();
                string html = await client.GetStringAsync("http://signage.uiowa.edu/computer-science/computer-science");
                doc.LoadHtml(html);
                List<string> imageLinks = await Task.Run(() =>
                {
                    List<string> links = new List<string>();
                    try
                    {
                        if(doc == null)
                        {
                            return links;
                        }
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
            catch {
                return new List<BitmapImage>();
            }
        }
    }
}
