using Newtonsoft.Json;
using System;
using System.Net;
using System.Timers;
using System.Windows.Media.Imaging;

namespace Microsoft.Samples.Kinect.ControlsBasics
{
    /// <summary>
    /// Helper file for MainWindow class that handles all weather on MainWindow
    /// </summary>
    public partial class MainWindow
    {
        private static Timer weatherTimer;
        private static Simpleforecast weatherData;
        public static Rootobject fullWeatherData;

        /// <summary>
        /// Timer used to call an API update for Weather Data
        /// </summary>
        private void SetWeatherTimer()
        {
            // Create a timer with a 10 min interval.
            weatherTimer = new Timer(600000);
            // Hook up the Elapsed event for the timer. 
            weatherTimer.Elapsed += GetWeatherData;
            weatherTimer.AutoReset = true;
            weatherTimer.Enabled = true;
        }

        /// <summary>
        /// Gets weather in JSON form from WeatherUnderground
        /// Calls convsersion to WeatherData objects.
        /// Only used on timer call
        /// </summary>
        private void GetWeatherData(object source, ElapsedEventArgs e)
        {
            GetWeatherData();
        }

        private void GetWeatherData()
        {
            //Weather Forcast from Weather Underground.com
            Uri feedUri = new Uri("http://api.wunderground.com/api/75c131024c99cf58/forecast10day/q/IA/Iowa_City.json");
            using (WebClient downloader = new WebClient())
            {
                downloader.DownloadStringCompleted += new DownloadStringCompletedEventHandler(downloader_DownloadStringCompletedWeather);
                downloader.DownloadStringAsync(feedUri);
            }
        }

        /// <summary>
        /// Gets the Weather forcast data (Json form) and creates WeatherData objects
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void downloader_DownloadStringCompletedWeather(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                string responseStream = e.Result;
                try
                {
                    Rootobject root = JsonConvert.DeserializeObject<Rootobject>(responseStream);
                    fullWeatherData = root;
                    try
                    {
                        weatherData = root.forecast.simpleforecast;
                    }
                    catch { }
                    SetWeatherData();
                }
                catch { }
            }
        }

        /// <summary>
        /// Sets the weather data with the icons on the mainwindow
        /// </summary>
        private void SetWeatherData()
        {
            if (weatherData != null)
            {
                int i = 0;
                string hostIconURL = "Images/WeatherIcons/";
                //if (DateTime.Now.Hour >= 18 || DateTime.Now.Hour <= 4)
                //{
                //    hostIconURL = hostIconURL + "nt_";
                //}
                while (i <= 3 && i < weatherData.forecastday.Length)
                {
                    if (i == 0)
                    {
                        Temp1.Text = weatherData.forecastday[0].high.fahrenheit + "°/" + weatherData.forecastday[0].low.fahrenheit + "°";
                        weatherIcon1.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[0].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 1)
                    {
                        day2.Text = weatherData.forecastday[1].date.weekday;
                        Temp2.Text = weatherData.forecastday[1].high.fahrenheit + "°/" + weatherData.forecastday[1].low.fahrenheit + "°";
                        weatherIcon2.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[1].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 2)
                    {
                        day3.Text = weatherData.forecastday[2].date.weekday;
                        Temp3.Text = weatherData.forecastday[2].high.fahrenheit + "°/" + weatherData.forecastday[2].low.fahrenheit + "°";
                        weatherIcon3.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[2].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 3)
                    {
                        day4.Text = weatherData.forecastday[3].date.weekday;
                        Temp4.Text = weatherData.forecastday[3].high.fahrenheit + "°/" + weatherData.forecastday[3].low.fahrenheit + "°";
                        weatherIcon4.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[3].icon + ".png", UriKind.Relative));
                    }
                    i++;
                }

            }
        }
    }
}
