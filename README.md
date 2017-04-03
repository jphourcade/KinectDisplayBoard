# KinectCSDisplay
WPF app display board using Microsoft Kinect for University of Iowa's MacLean Hall

## Running the Display on the CS Computer
The computer that this display is running on has a custom script from ITS.  The script will minimize any window that is covering the display within 15 seconds.
To start the display and script, restart the computer.
To shutoff the script, open task manager, and kill PowerShell.  This will stop the script from hiding windows. You can resume normal computer use. Restart computer when finished.

### Running the Display on a personal computer
To run the display on any computer, you do not need a Kinect.  However, you need to install [Kinect for Windows Runtime 2.0](https://www.microsoft.com/en-us/download/details.aspx?id=44559)
The display won't run without the Kinect Runtime or Kinect SDK 2.0 installed.

## Developing on the Display
To develop and fork this code, you need to install [Kinect SDK 2.0](https://developer.microsoft.com/en-us/windows/kinect)

At this momment, XAML (Windows Store 8.1) apps using Kinect SDK don't work on Windows 10.  As a solution this application uses WPF.

The cursor code is from ControlBasics WPF from the Kinect SDK samples.

## Other
This display pulls RSS feeds from Uiowa CLAS, Iowa Computer Science events and news, CNET, BBC, AP.
Also it pulls from WeatherUnderground.
Lastly, the display parses HTML, and has a dependency from [Iowa Computer Science People](https://cs.uiowa.edu/people) and [Digital Signage](http://signage.uiowa.edu/computer-science/computer-science)
