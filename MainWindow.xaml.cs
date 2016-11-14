using System;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Kinect;
using Microsoft.Kinect.Wpf.Controls;
using System.Timers;
using System.Diagnostics;
using System.Windows.Media.Animation;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows.Media.Imaging;
using System.Xml;
using System.Xml.Serialization;
using System.Windows.Automation.Peers;
using System.Linq;
using System.Text;
using System.Windows.Navigation;
using System.Windows.Media;
using System.ComponentModel;
using System.Windows.Threading;
using System.Threading.Tasks;
using System.Net.Http;
using HtmlAgilityPack;
using Microsoft.Samples.Kinect.ControlsBasics.DataModel;
using Microsoft.Kinect.Input;
using Microsoft.Samples.Kinect.ControlsBasics.Pages;

namespace Microsoft.Samples.Kinect.ControlsBasics
{
    /// <summary>
    /// Interaction logic for MainWindow
    /// </summary>
    public partial class MainWindow
    {
        public static Timer pageTimer;
        private static Timer clockTimer;

        private static bool isKinectActive = false;
        public static List<string> interviewQuestions;
        

        private NavigationService navService;
        private KinectSensor kinectSensor = null;

        /// <summary>
        /// Reader for color frames
        /// </summary>
        private ColorFrameReader colorFrameReader = null;

        /// <summary>
        /// Bitmap to display
        /// </summary>
        private WriteableBitmap colorBitmap = null;
        private int swapIndex;

        /// <summary>
        /// Initializes a new instance of the <see cref="MainWindow"/> class. 
        /// </summary>
        public MainWindow()
        {
            this.InitializeComponent();

            navService = NavigationService.GetNavigationService(this);

            HelpSlide.Visibility = Visibility.Collapsed;

            KinectRegion.SetKinectRegion(this, kinectRegion);

            App app = ((App)Application.Current);
            app.KinectRegion = kinectRegion;

            // Use the default sensor
            this.kinectRegion.KinectSensor = KinectSensor.GetDefault();

            this.kinectSensor = KinectSensor.GetDefault();

            //// open the reader for the color frames
            this.colorFrameReader = this.kinectSensor.ColorFrameSource.OpenReader();

            // wire handler for frame arrival
            this.colorFrameReader.FrameArrived += this.Reader_ColorFrameArrived;

            // create the colorFrameDescription from the ColorFrameSource using Bgra format
            FrameDescription colorFrameDescription = this.kinectSensor.ColorFrameSource.CreateFrameDescription(ColorImageFormat.Bgra);

            // create the bitmap to display
            this.colorBitmap = new WriteableBitmap(colorFrameDescription.Width, colorFrameDescription.Height, 96.0, 96.0, PixelFormats.Bgr32, null);

            // open the sensor
            this.kinectSensor.Open();

            //// Add in display content
            var mainGridDataSource = DataSource.GetGroup("Group-1");
            itemsControl.ItemsSource = mainGridDataSource;

            //Starts timer for clock
            SetClockTimer();

            //Set bongo timers
            SetBongoGetTimer();

            SetSwapTimer();

            //Sets the scrolling bottom bar text event
            StartBottomBar();

            //Sets timers and weather data            
            SetWeatherTimer();
            SetCSEventsTimer();

            GetInitalApiData();

            GetSlides();

            SetSlideSwapTimer();

            var window = KinectCoreWindow.GetForCurrentThread();
            window.PointerEntered += OnKinectPointerEntered;
            window.PointerExited += OnKinectPointerExited;
            SetPageTimer();
            GetInterviewQuestions();
            
        }

        private void OnKinectPointerExited(object sender, KinectPointerEventArgs e)
        {
            isKinectActive = false;
            pageTimer.Start();
        }

        private void OnKinectPointerEntered(object sender, KinectPointerEventArgs e)
        {
            isKinectActive = true;
            pageTimer.Stop();
        }

        /// <summary>
        /// Handles the color frame data arriving from the sensor
        /// </summary>
        /// <param name="sender">object sending the event</param>
        /// <param name="e">event arguments</param>
        private void Reader_ColorFrameArrived(object sender, ColorFrameArrivedEventArgs e)
        {
            // ColorFrame is IDisposable
            using (ColorFrame colorFrame = e.FrameReference.AcquireFrame())
            {
                if (colorFrame != null)
                {
                    FrameDescription colorFrameDescription = colorFrame.FrameDescription;

                    using (KinectBuffer colorBuffer = colorFrame.LockRawImageBuffer())
                    {
                        this.colorBitmap.Lock();

                        // verify data and write the new color frame data to the display bitmap
                        if ((colorFrameDescription.Width == this.colorBitmap.PixelWidth) && (colorFrameDescription.Height == this.colorBitmap.PixelHeight))
                        {
                            colorFrame.CopyConvertedFrameDataToIntPtr(
                                this.colorBitmap.BackBuffer,
                                (uint)(colorFrameDescription.Width * colorFrameDescription.Height * 4),
                                ColorImageFormat.Bgra);

                            this.colorBitmap.AddDirtyRect(new Int32Rect(0, 0, this.colorBitmap.PixelWidth, this.colorBitmap.PixelHeight));
                            KinectStreamView.Source = this.colorBitmap;
                        }

                        this.colorBitmap.Unlock();
                    }
                }
            }
        }
        
        private void SetPageTimer()
        {
            pageTimer = new Timer(10000);
            pageTimer.Elapsed += ReturnToHomePage;
            pageTimer.AutoReset = true;
            pageTimer.Enabled = true;
        }

        private void ReturnToHomePage(object sender, ElapsedEventArgs e)
        {
            //if (!iskinectactive)
            //{
            //    dispatcher.invoke(new action(() =>
            //    {
            //        navigationregion.content = this.kinectregiongrid;
            //        backbutton.visibility = visibility.hidden;
            //    }));
            //}
        }

        /// <summary>
        /// Calls all apis on init
        /// Only used on initalize
        /// </summary>
        private void GetInitalApiData()
        {
            GetCSEvents();
            GetBusData();
            GetWeatherData();
            GetSlides();
        }
       
        //TODO DEBUG page timer
              
        /// <summary>
        /// Creates a time that runs the clock and date for the UI.
        /// </summary>
        private void SetClockTimer()
        {
            // Create a timer with a one second interval.
            clockTimer = new Timer(1000);
            // Hook up the Elapsed event for the timer. 
            clockTimer.Elapsed += SetClockTimeEvent;
            clockTimer.AutoReset = true;
            clockTimer.Enabled = true;
        }

        /// <summary>
        /// Sets the digital clock and date.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void SetClockTimeEvent(Object source, ElapsedEventArgs e)
        {
            try
            {
                Dispatcher.Invoke(() =>
                {
                    dateText.Text = DateTime.Now.Date.ToString("ddd, MMM dd");
                    clockText.Text = DateTime.Now.ToString("h:mm:ss tt");
                });
            }
            catch { }
        }   

        /// <summary>
        /// Handle a button click from the wrap panel.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        private void OpenPage(object sender, RoutedEventArgs e)
        {
            var button = (Button)e.OriginalSource;
            DataItem sampleDataItem = button.DataContext as DataItem;

            if (sampleDataItem != null && sampleDataItem.NavigationPage != null)
            {
                helpButton.Visibility = Visibility.Collapsed;
                backButton.Visibility = Visibility.Visible;
                navigationRegion.Content = Activator.CreateInstance(sampleDataItem.NavigationPage);
            }
            else
            {
                var selectionDisplay = new SelectionDisplay(button.Content as string);
                kinectRegionGrid.Children.Add(selectionDisplay);

                // Selection dialog covers the entire interact-able area, so the current press interaction
                // should be completed. Otherwise hover capture will allow the button to be clicked again within
                // the same interaction (even whilst no longer visible).
                selectionDisplay.Focus();

                // Since the selection dialog covers the entire interact-able area, we should also complete
                // the current interaction of all other pointers.  This prevents other users interacting with elements
                // that are no longer visible.
                this.kinectRegion.InputPointerManager.CompleteGestures();
                e.Handled = true;
            }
        }

        /// <summary>
        /// Handle the back button click.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        private void GoBack(object sender, RoutedEventArgs e)
        {
            backButton.Visibility = Visibility.Collapsed;
            helpButton.Visibility = Visibility.Visible;
            navigationRegion.Content = this.kinectRegionGrid;
        }

        /// <summary>
        /// Starts infinite scrolling bottom bar that contains quick help instructions.
        /// </summary>
        private void StartBottomBar()
        {
            Storyboard s = (Storyboard)bottomBar.TryFindResource("sb");
            s.Begin();	// Start animation
        }

        private void DateTimeClock_MouseDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            /*//DEBUG ONLY
            backButton.Visibility = Visibility.Visible;
            navigationRegion.Content = Activator.CreateInstance(typeof(KinectPointerPointSample));
            */
        }

        private void RotateSlides(object obj, ElapsedEventArgs e)
        {
            Dispatcher.Invoke(() =>
            {
                //Swap and Fade Animation Code
                ScrollViewer slideBox = (ScrollViewer)FindName("Slides");
                // Create a duration of 2 seconds.
                Duration duration = new Duration(TimeSpan.FromSeconds(4));
                Duration duration2 = new Duration(TimeSpan.FromSeconds(4));

                // Create two DoubleAnimations and set their properties.
                DoubleAnimation myDoubleAnimation1 = new DoubleAnimation();
                DoubleAnimation myDoubleAnimation2 = new DoubleAnimation();

                myDoubleAnimation1.Duration = duration;
                myDoubleAnimation2.Duration = duration2;
                myDoubleAnimation2.BeginTime = TimeSpan.FromSeconds(0);

                Storyboard sb = new Storyboard();
                sb.Duration = duration;

                sb.Children.Add(myDoubleAnimation1);
                sb.Children.Add(myDoubleAnimation2);

                Storyboard.SetTargetName(myDoubleAnimation1, "Slides");
                Storyboard.SetTargetName(myDoubleAnimation2, "Slides");

                // Set the attached properties of Opacity
                // to be the target properties of the two respective DoubleAnimations.
                Storyboard.SetTargetProperty(myDoubleAnimation1, new PropertyPath("Opacity"));
                Storyboard.SetTargetProperty(myDoubleAnimation2, new PropertyPath("Opacity"));

                myDoubleAnimation1.To = 0;
                myDoubleAnimation2.From = 0;
                myDoubleAnimation2.To = 1;

                // Make the Storyboard a resource.
                slideBox.Resources.Add("unique_id", sb);
                // Begin the animation.
                try
                {
                    sb.Begin();
                }
                catch { };

                if (swapIndex < slideImages.Count)
                {
                    Slides.Visibility = Visibility.Visible;
                    EventsSlide.Visibility = Visibility.Collapsed;
                    HelpSlide.Visibility = Visibility.Collapsed;
                    if (slideImages.Count > 1)
                    {
                        SlideImage.Source = slideImages[swapIndex];
                    }
                    swapIndex++;
                }
                else if(swapIndex == slideImages.Count)
                {
                    HelpSlide.Visibility = Visibility.Visible;
                    Slides.Visibility = Visibility.Collapsed;
                    EventsSlide.Visibility = Visibility.Collapsed;
                    swapIndex++;
                }
                else
                {
                    
                    Slides.Visibility = Visibility.Collapsed;
                    HelpSlide.Visibility = Visibility.Collapsed;
                    EventsSlide.Visibility = Visibility.Visible;
                    swapIndex = 0;
                }

                slideBox.Resources.Remove("unique_id");
            });
        }        

        private void KinectBoardWindow_GotTouchCapture(object sender, System.Windows.Input.TouchEventArgs e)
        {
            pageTimer.Stop();
            pageTimer.Start();
        }

        private void KinectBoardWindow_MouseDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            pageTimer.Stop();
            pageTimer.Start();
        }

        private void GetInterviewQuestions()
        {
            string line;
            interviewQuestions = new List<string>();
            // Read the file and display it line by line.
            string dir = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            string filePath = dir + @"\Assets\Interview Questions.txt";
            System.IO.StreamReader file = new System.IO.StreamReader(filePath);
            while ((line = file.ReadLine()) != null)
            {
                if (line == null)
                {
                    return;
                }

                if (!(line == String.Empty) || !string.IsNullOrWhiteSpace(line))
                {
                interviewQuestions.Add(line);
                    
                }

            }
            file.Close();         
        }

        private void helpButton_Click(object sender, RoutedEventArgs e)
        {
            helpButton.Visibility = Visibility.Collapsed;
            backButton.Visibility = Visibility.Visible;
            navigationRegion.Content = Activator.CreateInstance(typeof(HelpControl));
        }
    }       
}
