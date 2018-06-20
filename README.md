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

## How to Turn Off Display Board Script
The display board computer has a PowerShell script that will minimize windows covering the main display window. You have 15 seconds to kill the PowerShell task. If you fail to do this repeatedly, ITS and others will get an email notification.

### Instructions
- Open Task Manager (Press Ctrl-Shift-Esc)
- Select PowerShell and click "End Task"
- Resume normal computer activity. Start with Windows key to get all the apps. Restart the computer to reboot the PowerShell script and the display.

## How to update the app on the computer
- Build the app and run it on your own Windows 10 Computer. You do not need to have a Kinect to do this.
- Find the build files on your computer: c:/Users/appdata/.../Kinect.....   etc.
- Copy and past the build files on your flash drive. Typically the .exe file is the only file you need to update the app.
- Go to the display board machine. Open the start menu and click on KinectBoard Location. It is a short cut to the .exe file where you need to copy the files over.
- Click on Kinectboard host and copy all the file from the flash drive over to this folder.
- Restart the computer and make sure the update occured.

