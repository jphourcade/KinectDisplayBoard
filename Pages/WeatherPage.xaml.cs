using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using WpfAnimatedGif;


namespace Microsoft.Samples.Kinect.ControlsBasics
{
    /// <summary>
    /// Interaction logic for WeatherPage.xaml
    /// </summary>
    public partial class WeatherPage : UserControl
    {
        private Rootobject fullWeatherData;
        
        public WeatherPage()
        {
            InitializeComponent();
            fullWeatherData = MainWindow.fullWeatherData;
            PopulateForecast();
            GetRadar();
        }
        
        /// <summary>
        /// Calls the radar URI and animates it
        /// </summary>
        private void GetRadar()
        {
            BitmapImage bitmap = new BitmapImage();
            bitmap.BeginInit();
            bitmap.UriSource = new Uri(@"http://api.wunderground.com/api/75c131024c99cf58/animatedradar/q/IA/Iowa_City.gif?newmaps=1&timelabel=1&timelabel.y=10&num=5&delay=50&width=750&height=750");
            bitmap.EndInit();
            ImageBehavior.SetAnimatedSource(RadarImage, bitmap);
            Loading.Visibility = Visibility.Collapsed;
        }

      /// <summary>
      /// Fills the buttons with the forecast
      /// </summary>
        private void PopulateForecast()
        {

            try
            {
                if(fullWeatherData == null)
                {
                    return;
                }
            Simpleforecast weatherData = fullWeatherData.forecast.simpleforecast;
            string hostIconURL = "../Images/WeatherIcons/";
            if (DateTime.Now.Hour >= 18 || DateTime.Now.Hour <= 4)
            {
                hostIconURL = hostIconURL + "nt_";
            }
                for (int i = 0; i < 10 && i < weatherData.forecastday.Length; i++)
                {
                    if (i == 0)
                    {
                        day1.Text = weatherData.forecastday[i].date.weekday;
                        day1Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp1.Text = weatherData.forecastday[i].high.fahrenheit + "°/" + weatherData.forecastday[i].low.fahrenheit + "°";
                        weatherIcon1.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[0].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 1)
                    {
                        day2.Text = weatherData.forecastday[i].date.weekday;
                        day2Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp2.Text = weatherData.forecastday[1].high.fahrenheit + "°/" + weatherData.forecastday[1].low.fahrenheit + "°";
                        weatherIcon2.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[1].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 2)
                    {
                        day3.Text = weatherData.forecastday[i].date.weekday;
                        day3Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp3.Text = weatherData.forecastday[2].high.fahrenheit + "°/" + weatherData.forecastday[2].low.fahrenheit + "°";
                        weatherIcon3.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[2].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 3)
                    {
                        day4.Text = weatherData.forecastday[i].date.weekday;
                        day4Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp4.Text = weatherData.forecastday[3].high.fahrenheit + "°/" + weatherData.forecastday[3].low.fahrenheit + "°";
                        weatherIcon4.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[3].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 4)
                    {
                        day5.Text = weatherData.forecastday[i].date.weekday;
                        day5Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp5.Text = weatherData.forecastday[4].high.fahrenheit + "°/" + weatherData.forecastday[4].low.fahrenheit + "°";
                        weatherIcon5.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[4].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 5)
                    {
                        day6.Text = weatherData.forecastday[i].date.weekday;
                        day6Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp6.Text = weatherData.forecastday[5].high.fahrenheit + "°/" + weatherData.forecastday[5].low.fahrenheit + "°";
                        weatherIcon6.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[5].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 6)
                    {
                        day7.Text = weatherData.forecastday[i].date.weekday;
                        day7Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp7.Text = weatherData.forecastday[6].high.fahrenheit + "°/" + weatherData.forecastday[6].low.fahrenheit + "°";
                        weatherIcon7.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[6].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 7)
                    {
                        day8.Text = weatherData.forecastday[i].date.weekday;
                        day8Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp8.Text = weatherData.forecastday[7].high.fahrenheit + "°/" + weatherData.forecastday[7].low.fahrenheit + "°";
                        weatherIcon8.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[7].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 8)
                    {
                        day9.Text = weatherData.forecastday[i].date.weekday;
                        day9Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp9.Text = weatherData.forecastday[8].high.fahrenheit + "°/" + weatherData.forecastday[8].low.fahrenheit + "°";
                        weatherIcon9.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[8].icon + ".png", UriKind.Relative));
                    }
                    else if (i == 9)
                    {
                        day10.Text = weatherData.forecastday[i].date.weekday;
                        day10Num.Text = weatherData.forecastday[i].date.month + "/" + weatherData.forecastday[i].date.day;
                        Temp10.Text = weatherData.forecastday[9].high.fahrenheit + "°/" + weatherData.forecastday[9].low.fahrenheit + "°";
                        weatherIcon10.Source = new BitmapImage(new Uri(hostIconURL + weatherData.forecastday[9].icon + ".png", UriKind.Relative));
                    }
                }
                moreDetailDayTitle.Text = fullWeatherData.forecast.txt_forecast.forecastday[0].title;
                moreDetailDayText.Text = fullWeatherData.forecast.txt_forecast.forecastday[0].fcttext;
                moreDetailNightTitle.Text = fullWeatherData.forecast.txt_forecast.forecastday[1].title;
                moreDetailNightText.Text = fullWeatherData.forecast.txt_forecast.forecastday[1].fcttext;
            }
            catch {
                return;
            }
        }

        /// <summary>
        /// Click handler for each button click on weather page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void MoreDetailsClick(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            int day = int.Parse(button.Name.Substring(2)) * 2;
            try
            {
                if(fullWeatherData == null)
                {
                    moreDetailDayText.Text = "Sorry, the internet isn't connected right now.";
                    return;
                }
                moreDetailDayTitle.Text = fullWeatherData.forecast.txt_forecast.forecastday[day].title;
                moreDetailDayText.Text = fullWeatherData.forecast.txt_forecast.forecastday[day].fcttext;
                moreDetailNightTitle.Text = fullWeatherData.forecast.txt_forecast.forecastday[day + 1].title;
                moreDetailNightText.Text = fullWeatherData.forecast.txt_forecast.forecastday[day + 1].fcttext;
            } catch{ }
            
        }
    }
}
