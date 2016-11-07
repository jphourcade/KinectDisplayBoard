using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows.Threading;

namespace Microsoft.Samples.Kinect.ControlsBasics
{
    public partial class MainWindow
    {
        private static Timer bongoSwapTimer;
        private static Timer bongoGetTimer;
        private BongoData bongoData;
        private int bongoIndex = 0;
        private static List<VisibleBongoData> fullBongoData = new List<VisibleBongoData>();

        internal static List<VisibleBongoData> FullBongoData
        {
            get
            {
                return fullBongoData;
            }

            set
            {
                fullBongoData = value;
            }
        }

        /// <summary>
        /// Swaps out cards with Bongo data on MainWindow
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SetBongoSwapEvent(object sender, ElapsedEventArgs e)
        {
            List<VisibleBongoData> groupedBongoData = new List<VisibleBongoData>();
            if (bongoIndex < FullBongoData.Count)
            {
                int i = 0;
                while (i + bongoIndex < FullBongoData.Count && i < 4)
                {
                    groupedBongoData.Add(FullBongoData[i + bongoIndex]);
                    i++;
                }
                bongoIndex += 3;
            }
            else
            {
                bongoIndex = 0;
            }
            try
            {
                //Debug.WriteLine("HERE: " + IdleTimeDetector.GetIdleTimeInfo());
                //Udpdate UI thread with new bus group of 4
                if (groupedBongoData.Count >= 1)
                {
                    Dispatcher.Invoke(DispatcherPriority.DataBind, new Action(delegate { BusGrid.DataContext = groupedBongoData; }));
                }

            }
            catch { };
        }

        /// <summary>
        /// Event on a timer for getting the bus data for stop 00001, outside of MacLean Hall.
        /// This method reads in JSON data using async methods.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void GetBusData(object source, ElapsedEventArgs e)
        {
            GetBusData();
        }

        private void GetBusData()
        {
            //Prediction URI from Bongo API for stop 0001 Downtown Interchange
            Uri feedUri = new Uri("http://api.ebongo.org/prediction?format=json&stopid=0001&api_key=XXXX");
            using (WebClient downloader = new WebClient())
            {
                downloader.DownloadStringCompleted += new DownloadStringCompletedEventHandler(downloader_DownloadStringCompletedBongo);
                downloader.DownloadStringAsync(feedUri);
            }
        }

        /// <summary>
        /// Gets the Bongo data (Json form) and creates BongoData objects
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void downloader_DownloadStringCompletedBongo(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                string responseStream = e.Result;
                bongoData = JsonConvert.DeserializeObject<BongoData>(responseStream);
            }
            SetBongoData();
        }


        /// <summary>
        /// Timer for swaping out the Bongo info cards.
        /// </summary>
        private void SetSwapTimer()
        {
            // Create a timer with a 7 second interval.
            bongoSwapTimer = new Timer(7000);
            // Hook up the Elapsed event for the timer. 
            bongoSwapTimer.Elapsed += SetBongoSwapEvent;
            bongoSwapTimer.AutoReset = true;
            bongoSwapTimer.Enabled = true;
        }

        /// <summary>
        /// Timer for downloading Bongo Data
        /// </summary>
        private void SetBongoGetTimer()
        {
            // Create a timer with a 1 min interval.
            bongoGetTimer = new Timer(60000);
            // Hook up the Elapsed event for the timer. 
            bongoGetTimer.Elapsed += GetBusData;
            bongoGetTimer.AutoReset = true;
            bongoGetTimer.Enabled = true;
        }

        /// <summary>
        /// Sets the full list of Bongo data for ListView Data Binding
        /// </summary>
        private void SetBongoData()
        {
            if (bongoData != null)
            {
                FullBongoData.Clear();
                foreach (var bd in bongoData.predictions)
                {
                    string minString = bd.minutes.ToString() + "min.";

                    if (bd.minutes == 0)
                    {
                        minString = "Arriving";
                    }

                    string colorString = "#FFFFFF";
                    if (bd.agency.Equals("cambus"))
                    {
                        colorString = "#FFEB3B";
                    }
                    else if (bd.agency.Equals("iowa-city"))
                    {
                        colorString = "indianred";
                    }
                    else if (bd.agency.Equals("coralville"))
                    {
                        colorString = "royalblue";
                    }

                    if (bd.minutes <= 15 || bongoData.predictions.Count <= 8)
                    {
                        FullBongoData.Add(new VisibleBongoData() { stopname = bd.stopname, minutes = minString, routename = bd.title, color = colorString });
                    }
                }
            }
            else
            {
                FullBongoData.Add(new VisibleBongoData() { stopname = "No buses running", color = "#FFFFFF" });
            }
        }
    }
}
