   M S B A M L   `   `   `  ���� F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nullDclr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes6Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes  9    3Microsoft.Samples.Kinect.ControlsBasics.WeatherPage   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  J FWpfAnimatedGif, Version=1.4.14.0, Culture=neutral, PublicKeyToken=null,gif"http://wpfanimatedgif.codeplex.com  d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  RloadingDclr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes  $��10,10,10,10q�.���   � RowDefinitions  �� $
��Auto ��� $��* �.+��� -    ��Name$ weatherPageTitle��$��0��   HeaderStyle#��[  $��	0 10 0 10q�$��Weather��$��36(�$��	UltraBold"����	#FFEEEEEE�� -    ��Name$ WULogo��$��0��$0��*../Images/wundergroundLogo_4c_rev_horz.jpg��$��100px��$��Center=�$��Right=�� $��1�� � ColumnDefinitions �� $
��0.6* ��� $
��0.4* �.+�� $��0��  �� $
��Auto ��� $
��0.7* ��� $
��0.3* �.+��� -   $ Forecast��$��0��#��[  $��Forecast��$��
10,10,0,10q����	#FFFFC000� -    �Name$ WeatherCards��$��1��$��10,0,0,0q�  �� $
��0.5* ��� $
��0.5* � �� $��0.20* ��� $��0.20* ��� $��0.20* ��� $��0.20* ��� $��0.20* �.+��� -    ��Name$	 wb0��$��0��$��0��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Center=�$��5q�  KinectTileButton#��[ ��Z� .��#  MaterialDesignThemes.Wpf.Card  ���	#FF424242$��Center=�.���� -    ��Name$ weather1��$��Bottom=�.+��� -   $
 day1�� �� TextAlignment$ Center=�$��20(����	#FFFFC000$��Center=���Z� �� -   $ day1Num��$ Center=�
��������� -	   $ weatherIcon1��$
��50px��$
��50px���� -
   $ Temp1��$��20(�$ Center=�
��������� -   $	 wb1��$��0��$��1��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -   $ weather2��.+��� -   $
 day2��$ Center=�$��20(����	#FFFFC000��Z� �� -   $ day2Num��$ Center=�
��������� -   $ weatherIcon2��$
��50px��$
��50px���� -   $ Temp2��$��20(�$ Center=�
��������� -   $	 wb2��$��0��$��2��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -   $ weather3��.+��� -   $
 day3��$ Center=�$��20(����	#FFFFC000��Z� �� -   $ day3Num��$ Center=�
��������� -   $ weatherIcon3��$
��50px��$
��50px���� -   $ Temp3��$��20(�$ Center=�
��������� -   $	 wb3��$��0��$��3��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -   $ weather4��.+��� -   $
 day4��$ Center=�$��20(����	#FFFFC000��Z� �� -   $ day4Num��$ Center=�
��������� -   $ weatherIcon4��$
��50px��$
��50px���� -   $ Temp4��$��20(�$ Center=�
��������� -   $	 wb4��$��0��$��4��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -   $ weather5��.+��� -   $
 day5��$ Center=�$��20(����	#FFFFC000��Z� �� -    $ day5Num��$ Center=�
��������� -!   $ weatherIcon5��$
��50px��$
��50px���� -"   $ Temp5��$��20(�$ Center=�
��������� -#   $	 wb5��$��1��$��0��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -$   $ weather6��.+��� -%   $
 day6��$ Center=�$��20(����	#FFFFC000��Z� �� -&   $ day6Num��$ Center=�
��������� -'   $ weatherIcon6��$
��50px��$
��50px���� -(   $ Temp6��$��20(�$ Center=�
��������� -)   $	 wb6��$��1��$��1��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -*   $ weather7��.+��� -+   $
 day7��$ Center=�$��20(����	#FFFFC000��Z� �� -,   $ day7Num��$ Center=�
��������� --   $ weatherIcon7��$
��50px��$
��50px���� -.   $ Temp7��$��20(�$ Center=�
��������� -/   $	 wb7��$��1��$��2��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -0   $ weather8��.+��� -1   $
 day8��$ Center=�$��20(����	#FFFFC000��Z� �� -2   $ day8Num��$ Center=�
��������� -3   $ weatherIcon8��$
��50px��$
��50px���� -4   $ Temp8��$��20(�$ Center=�
��������� -5   $	 wb8��$��1��$��3��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -6   $ weather9��.+��� -7   $
 day9��$ Center=�$��20(����	#FFFFC000��Z� �� -8   $ day9Num��$ Center=�
��������� -9   $ weatherIcon9��$
��50px��$
��50px���� -:   $ Temp9��$��20(�$ Center=�
��������� -;   $	 wb9��$��1��$��4��$
��Auto��$��Stretch=�$
��Auto��$��Stretch=�$��Stretch=�$��Center=�$��5q�#��[ ��Z� .��  ���	#FF424242$��Center=�.���� -<   $ 	weather10��.+��� -=   $ day10��$ Center=�$��20(����	#FFFFC000��Z� �� ->   $ day10Num��$ Center=�
��������� -?   $ weatherIcon10��$
��50px��$
��50px���� -@   $ Temp10��$��20(�$ Center=�
��������� -A   $ MoreDetailWeather��$��2��$
��10,5q�.+��� -B   $ moreDetailTitle��$��20)����	#FFFFC000More Details�� -C   $ moreDetailDayTitle��$��19(�$��	Underline{�$
��Wrap=�
��������� -D   $ moreDetailDayText��$��19(�$�� {�$��Italic$�$
��Wrap=�
��������� -E   $ moreDetailNightTitle��$��19(�$��	Underline{�$
��Wrap=�
��������� -F   $ moreDetailNightText��$��19(�$�� {�$��Italic$�$
��Wrap=�
��������� $��1��.+��� -G   $ 
RadarTitle��#��[  $��Radar��$��
10,10,0,10q����	#FFFFC000K   EMicrosoft.Samples.Kinect.ControlsBasics.Helper_Classes.LoadingControl  -H     Name$ Loading���� -I   $ 
RadarImage��$��0q�$	��550��$	��550��