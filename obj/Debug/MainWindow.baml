   M S B A M L   `   `   `  ����F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nulla5clr-namespace:Microsoft.Samples.Kinect.ControlsBasics'Microsoft.Samples.Kinect.ControlsBasics  5   	   O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 5	   	   m;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages-Microsoft.Samples.Kinect.ControlsBasics.Pages  5   	   8    2Microsoft.Samples.Kinect.ControlsBasics.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  5   	   :d2http://schemas.microsoft.com/expression/blend/2008  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   Alocal5clr-namespace:Microsoft.Samples.Kinect.ControlsBasics  5   	   U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   3System&clr-namespace:System;assembly=mscorlib  5	   	   K	helpSlide;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages  5   	   -   5          �Name$  KinectBoardWindow��5   	    � Title$ Kinect Display Board��5   	   $	��500��5   	   $	��700��5   	    � WindowState$ 	Maximized=�5   	    � WindowStyle$
 None=�5   	   .��5      0  *Microsoft.Kinect.Wpf.Controls.KinectRegion  -   5          Name$ kinectRegion��5      .��5   
   � ��5      �� 5       �� EndPoint$ 0.5,1&�6&    �� 
StartPoint$ 0.5,0&�67   .��5      �  � Color$ 	#FF292929��6#   � 5      $ 	#FF020202��6#    � Offset$ 1Q�65   5       	 � RowDefinitions	 5"      �� 5#      $
��Auto �6    �� 5$      $
��100* �6    �� 5%      $��* �6    .+�5'      � -   5        
 �Name$
 topBar��5'      $��0��6#   $��0,0,0,7q�60   
���   � � ColumnDefinitions 5(      �� 5)      $
��Auto �6'   �� 5*      $��* �6'   .+�5.      �� -   5         ��Name$ 
backButton��5.      $y�	Collapsed=�6-   $��0��6D      BackButtonStyle#��[  6T   6}   �� 5/      -   5        $ 
helpButton��5/      $y�Visible=�6-   $��0��6B     HelpButtonStyle#��[ 6�   ��6l   Z� 6�   � 52      $��0��6   $��1��6$   	 54      �� 55      $
��0.2* �6(   �� 56      $
��0.3* �6(    58      �� 59      $
��Auto �6+   �� 5:      $��* �6+   �� 5;      $��* �6+   .+�5=      �� -   5         ��Name$ image��5=      $��0��6O   $��0��6\   $��Images/clas.png��6l   $
��Left=�6�   $��20��6�   $��Bottom=�6�   �� 5>      -   5         ��Name$	 Sci��5>   >   $��1��6    $��0��6.   $	��Top=�6K   $��36(�6c   $��Segoe UI Black)�6q   $
��Left=�6�   ���	#DDFFFFFF$��0q�6�   $��Computer Science��6�   (� 5@      $��0��6   $��2��6+   $��1��6<   $	��150��6M   $	��150��6Z   .��5A      �� -   5        $��KinectStreamView��5A       $��UniformToFill=�6W   ��68   �� *ImageSource+6W   5B      �� 5D      -	   5        $ image1��5D      $��20��6,   $��0��68   $��2��6E   $��Images/uiowa.png��6U   $��Bottom=�6o   $��Right=�6�   $��0,0,25,0q�6�   �� 5E      -
   5         ��Name$ DateTimeClock��5E   !    �� Orientation$ 
Horizontal=�68   $��1��6Q   $��2��6^   $��Right=�6n   $	��Top=�6�   $��0,0,20,0q�6�   .+�5F      �� ���#333333 �� CornerRadius$ 5��66   $��5q�6G    �� Padding$ 5q�6R   ._�5G      �� -   5        $ 	clockText��5G   (   $��22(�6<   $��Segoe UI Black)�6J   ���	#DDFFFFFF$	��Top=�6}   �� 6�   $�00:00 pm��6�   6�   5H      �� 5I      ���#333333$ 5��66   $��5q�6G   $ 5q�6R   $	��Top=�6^   ._�5J      �� -   5        $ dateText��5J   (   $��22(�6:   $��Segoe UI Black)�6H   $��Center=�6d   ���	#DDFFFFFF$��0q�6�   �� 6�   $�
Mon, Jan 1��6�   ���	#FF3333336�   6�   5K      5M      5O      5P      �� 5S      -   5         ��Name$ navigationRegion��5S   ;   $��1��6   $��2��6*   .��5U      � -   5        $
 kinectRegionGrid��5U       5V      �� 5W      $
��0.5* �6+   �� 5X      $
��0.5* �6+   	 5Z      �� 5[      $
��Auto �6(   �� 5\      $��* �6(   .+�5_      �� -   5        $ weatherPanel��5a   !   $��0��5_   !   $��0��5`   !   $ 
Horizontal=�5b   !   $��0,10,0,0q�6:   .+�5c      �� .+�5d      ��   HeaderStyle#��[ 6(   $
��Wrap=�6N   $��Forecast��6b   $	��Top=�6r   ���	#FFFFC000$��0q�6�   $��Center=�6�   �� 5e      -   5        $ wuLogo��5e   $   $-��'Images/wundergroundLogo_4c_rev_horz.jpg��65   $��25��6f   $	��Top=�6r   5f      �� 5g      -   5        $ weather1��5g   %   $
��10,0q�68   $��Stretch=�6F   .+�5h      �� -   5        $
 day1��5h   (    �� TextAlignment$ Center=�66   $��24(�6M   ���	#FFFFC000Today6y   �� 5i   "   -   5        $ weatherIcon1��5i   (   $
��80px��6>   $
��80px��6K   �� 5j   "   -   5        $ Temp1��5j   ,   $��24(�6;   $ Center=�6I   
�������6u   5k      �� 5l      $��Stretch=�6$   $��1��6@   $��2q�6J   
�������$	��0.5��6d   �� 5n      -   5        $ weather2��5n   %   $
��10,0q�68   .+�5o   "   �� -   5        $
 day2��5o   ,   $��24(�6:   $ Center=�6H   ���	#FFFFC0006x   �� 5p   "   -   5        $ weatherIcon2��5p   (   $
��80px��6>   $
��80px��6K   �� 5q   "   -   5        $ Temp2��5q   ,   $��24(�6;   $ Center=�6I   
�������6v   5r      �� 5s      -   5        $ weather3��5s   %   $
��10,0q�67   .+�5t      �� -   5        $
 day3��5t   (   $��24(�66   $ Center=�6E   ���	#FFFFC0006u   �� 5u   "   -   5        $ weatherIcon3��5u   (   $
��80px��6>   $
��80px��6K   �� 5v   "   -   5        $ Temp3��5v   ,   $��24(�6;   $ Center=�6I   
�������6u   5w      �� 5x      -   5        $ weather4��5x   )   $
��10,0q�6;   .+�5y      �� -   5        $
 day4��5y   (   $��24(�66   $ Center=�6D   ���	#FFFFC0006t   �� 5z   "   -   5        $ weatherIcon4��5z   (   $
��80px��6>   $
��80px��6K   �� 5{   "   -    5        $ Temp4��5{   ,   $��24(�6;   $ Center=�6I   
�������6u   5|      5}      �� 5      -!   5         ��Name$ scrollViewer��5�   #   $��1��5   #   $��0��5�   #   $��Hidden=�5�   #   $��Disabled=�5�   #      IsScrollInertiaEnabled . .��5�      �� -"   5         ��Name$ itemsControl��5�   4   $��0��6'     Kinect250x250ItemTemplate#��[ 6J   $
��0,10q�6�   ��5�      �� 5�   "   .R�5�   &   � $��Center=�60    � Orientation$ Vertical=�6K   $��	75,0,75,0q�6b   5�   #   5�      5�      � 5�      -#   5        $
 RightGridPanel��5�      $��1��5�      $��0��5�      $��2��5�      $��10,0,0,0q�5�      	 5�      �� 5�      $��0.675* �6,   �� 5�      $��0.325* �6,   .+�5�      � $��0��6   	 5�      �� 5�   "   $
��Auto �60   �� 5�   "   $��* �60   .+�5�      �� -$   5        $ NewsAndAnnouncment��5�   (   $��0��5�   (   #��[ 65   $
��Wrap=�5�   (   $��Upcoming News & Events��5�   (   $	��Top=�5�   (   $��Stretch=�5�   (   ���	#FFFFC0005�   (   �� 5�      -%   5        $ Slides��5�   8   $��1��6+   ��5�   "   �� 5�   &    �� 
TargetType" ��6,   .�5�   *   ��  �� Property � �� �� Value$ Disabled=�6Z   �� 5�   *    � ��$ Disabled=�6X    �� Triggers 5�   *   �� 5�   .    �� Binding 6:   �� *	IsChecked+ �� ElementName$ chkActualSize�� �� Value True6s   .a�5�   2   ��  � ��$
 Auto=�6b   �� 5�   2    � ��$
 Auto=�6`   5�   /   5�   '   .��5�   "   �� -&   5        $ 
SlideImage��5�   (   $��Uniform=�6[   ��6<   �� *SlideSource+6[   5�      �� 5�      -'   5        $ 	HelpSlide��5�   +   $��Disabled=�5�   +   $
��Auto=�5�   +   $��1��5�   +   .��5�   "   ?   9Microsoft.Samples.Kinect.ControlsBasics.Pages.HelpControl  6:   5�      �� 5�      -(   5        $ EventsSlide��5�   +   $��Disabled=�5�   +   $
��Auto=�5�   +   $��1��5�   +   .��5�   "   �� -)   5          ��Name$  csEventsList��5�   +   $��Stretch=�5�   '   ! �� SelectionMode$! Single=�5�   '   $��	10,0,10,5q�5�   (   $��Disabled=�5�   '   $
��Auto=�5�   '   ��5�   '   Z� ��5�   '   Z� ��5�   &   �� 5�   *   " ��60   .�5�   .   ��  � ��$ Stretch=�6[   �� 5�   .    � ��
 ���� 6K   �� 5�   .    � �� 5�   2   �� 5�   6   " �� 
TargetType"" ��6F   .R�5�   :   �� 5�   7   5�   /   5�   +   ��5�   &   �� 5�   *   .R�5�   .   �� $��Stretch=�69   .+�5�   2   �� $ csEventTitle��6<   $��20(�6p   $
��Wrap=�6~   
���������6R   �� *csEventTitle+6�   �� 5�   2   $ csEventTime��6<   $��18(�6n   $��Italic$�6|   ���	#FFaaaaaa��6Q   �� *csEventTime+6�   �� 5�   2   $ csEventLocation��6<   $��18(�6v   ���	#FFaaaaaa��6U   �� *csEventLocation+6�   5�   /   5�   +   5�   #   5�      5�      �� 5�      $��1��6$   $	��Top=�61   
�������6^   �� 5�      $��1��6%   $��Stretch=�62   $��0,0,0,10q�6P   .+�5�      �� -*   5        $ busScheduleTitle��5�   M   #��[ 6(   $��1��6g   ���	#FFFFC000Upcoming Buses6�   &   System.Windows.Controls.DataGrid  5�      -+   5        #  Name$# BusGrid��5�   '   $   
IsReadOnly$ . %   AutoGenerateColumns% .  &   SelectionMode$& Single=�5�   '   '   SelectionUnit$
' Cell=�5�   '   (   EnableRowVirtualization( .  !)   EnableColumnVirtualization) .  ��5�   '   �� ��5�   <   Z� *   Columns* 5�   "   0  *System.Windows.Controls.DataGridTextColumn  5�   &   ,  &System.Windows.Controls.DataGridColumn+   Header$+ Stop Number     ��69   ,   FontSize$, 16Q�6n   1  +System.Windows.Controls.DataGridBoundColumn-   Binding- 6S   �� *stopid+6n     5�   &   $+ Route Name     ��69   $, 16Q�6p   - 6R   �� *	routename+6p     5�   &   $
+ Time��69   $, 16Q�6c   - 6G   �� *	minutes+6c   .   ColumnHeaderStyle. 5�   "   �� 5�   &   =  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6,   .�5�   *   ��  � ��
 �����6G   �� 5�   *    � ��
 ���� 6G   5�   '   /   RowStyle/ 5�   "   �� 5�   &   )  #System.Windows.Controls.DataGridRow"  6,   .�5�   *   ��  � �� 6G   �� *color+5�   '   0 � 	Resources0 5�   "   ��%a   '        �� 5�   &   "  6,   .�5�   *   ��  �@J�IsHitTestVisible .  6M   5�   '   5   #   5     5     5     5     5     �� 5	     -,   5        $ 	bottomBar��5	  �   $ 
Horizontal=�6   $��26��62   $��Bottom=�6>   ���	#FF020202$��Stretch=�6r   $��2��6�   $��1��6�   0 5
     1 ��Name  sb2 g� RepeatBehavior3 �� 
TargetName4 �� TargetProperty	5 W� To6 g� Duration7 W� From8 �� Source��%�   &	       �� 5     $1 sb��6,   $2 Forever��68   .��5     W� $3 	translate��6*   $4 X�5  *   $5 -6200X�5  *   $6 0:1:45D�5  *   7 5  *   �� #8 Z��5  *   5     5     .+�5     �� 2	  ,System.Windows.Markup.XmlAttributeProperties9 	 XmlSpace9 preserve6�   --   5        $ bottomBarText��5     $��Center=�64   $��20(�6O   $��Segoe UI Black)�6]   ���	#DDFFFFFFz�5     T� 5     -.   5        	translate��5  -   ��
                    Welcome to MacLean Hall!         •         欢迎来到 MacLean Hall         •         ¡Bienvenido a MacLean Hall!           •          आपका स्वागत है MacLean Hall        •        Place your hand above your head and find the hand cursor.        •        Click on a menu: line the cursor on the button and push your hand forward with an open hand.        •        To scroll, make a fist and move your hand up or down.  Open your hand when done.        •        The back button is in the top left corner.        •        I am a touch screen too! You can touch, tap, and play.        •        Come check the weather, news, department events, maps, daily trivia and more!   •
                5     5     F� 5     5����    ���� Zb ����2G[��K�/`@��2G[��K�/`@	$��2.495��6Q   $��0,0,-0.5,8.488q�6`   : �� Stretch$
: Fill=�6x   ���	#FFFFC000$��Bottom=�6�   $��5��6�   5     5!     5"     