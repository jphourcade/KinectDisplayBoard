using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Timers;
using System.Xml.Serialization;

namespace Microsoft.Samples.Kinect.ControlsBasics
{
    public partial class MainWindow
    {
        private static Timer csEventsTimer;
        private static List<VisibleCSItem> fullCsEventsList = new List<VisibleCSItem>();

        /// <summary>
        /// Timer used to call an API update for CS Events
        /// </summary>
        private void SetCSEventsTimer()
        {
            // Create a timer with a 13 min interval.
            csEventsTimer = new Timer(800000);
            // Hook up the Elapsed event for the timer. 
            csEventsTimer.Elapsed += GetCSEvents;
            csEventsTimer.Elapsed += GetSlideURLs;
            csEventsTimer.AutoReset = true;
            csEventsTimer.Enabled = true;
        }

        /// <summary>
        /// Call CS website for events in XML format
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void GetCSEvents(object obj, ElapsedEventArgs e)
        {
            GetCSEvents();
        }

        private void GetCSEvents()
        {
            //CS Events found on Iowa CS Website
            Uri feedUri = new Uri("https://cs.uiowa.edu/events/rss.xml");
            using (WebClient downloader = new WebClient())
            {
                downloader.DownloadStringCompleted += new DownloadStringCompletedEventHandler(downloader_DownloadStringCompletedCSEvents);
                downloader.DownloadStringAsync(feedUri);
            }
        }

        /// <summary>
        /// Swaps out cards with cs event data on MainWindow
        /// </summary>
        private void SetCSCards()
        {
            fullCsEventsList.Sort((x, y) => DateTime.Compare(x.startDate, y.startDate));
            List<VisibleCSItem> groupedCSEventData = new List<VisibleCSItem>();
            for (int i = 0; i < 4 && i < fullCsEventsList.Count; i++)
            {
                groupedCSEventData.Add(fullCsEventsList[i]);
            }
            try
            {
                //Udpdate UI thread with new event group of 4
                Dispatcher.Invoke(() =>
                {
                    if (groupedCSEventData.Count >= 1)
                    {
                        csEventsList.ItemsSource = groupedCSEventData;
                    }
                });
            }
            catch { }
        }



        private void downloader_DownloadStringCompletedCSEvents(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                string responseStream = e.Result;
                try
                {
                    XmlSerializer serializer = new XmlSerializer(typeof(nodes));
                fullCsEventsList.Clear();
                using (TextReader reader = new StringReader(e.Result))
                {
                    
                        nodes result = (nodes)serializer.Deserialize(reader);

                        foreach (var nd in result.node)
                        {
                            string date = nd.startdate;
                            Regex reg = new Regex("\\(All\\sday\\)");
                            if (reg.IsMatch(nd.startdate))
                            {
                                date = nd.startdate.Substring(0, reg.Match(nd.startdate).Index);
                            }
                            DateTime startDate = DateTime.Parse(date);

                            fullCsEventsList.Add(new VisibleCSItem()
                            {
                                csEventLocation = nd.location == null ? "" : Encoding.UTF8.GetString(Encoding.Default.GetBytes(nd.location)),
                                csEventTime = startDate.Date.ToString("MMMM d, yyyy"),
                                csEventTitle = nd.title == null ? "" : Encoding.UTF8.GetString(Encoding.Default.GetBytes(nd.title)),
                                startDate = startDate,
                                isEvent = true
                            });

                        }
                }
                }
                catch { }
                SetCSCards();
            }
        }
    }
}
