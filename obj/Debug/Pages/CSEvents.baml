   M S B A M L   `   `   `  ����F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nullm;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages-Microsoft.Samples.Kinect.ControlsBasics.Pages  5      <    6Microsoft.Samples.Kinect.ControlsBasics.Pages.CSEvents   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Mlocal;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages     5      U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  5	      $��10,10,10,10q�5
      .��5      � -   5          �Name$  MainEventsGrid��5       � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   .+�5   
   ��    HeaderStyle#��[  6   $��	UltraBold"�69   $��0��6P   $��0��6]   $��0,0,0,5q�6m   $��News & Events��6~   $��36(�6�   ���	#FFEEEEEE6�   � 5   
   -   5        $  
EventsGrid��5      $��1��6#    5      �� 5      $
��Auto �6    �� 5      $
��0.7* �6    �� 5      $
��0.3* �6    .+�5      �� -   5         ��Name$ eventsTitle��5   J   $��0��6   #��[  6%   $��10,0,0,0q�6_   ���	#FFFFC000Department Events6�   �� 5      -   5         ��Name$ scrollViewer��5      $��1��5      $��Disabled=�5       $
��Auto=�5!      0  *Microsoft.Kinect.Wpf.Controls.KinectRegion   IsScrollInertiaEnabled . $��10,0,0,0q�5"   H   .��5#      &   System.Windows.Controls.DataGrid  -   5          Name$ EventsDataGrid��5#         AlternatingRowBackground �	#FF424242 �� AlternationCount$ 2��5%   @   	   AutoGenerateColumns	 .  
   SelectionMode$
 Single=�5'         SelectionUnit$
 Cell=�5(      $   HorizontalScrollBarVisibility$ Disabled=�5*      "   VerticalScrollBarVisibility$
 Auto=�5+         
IsReadOnly . ��5$      �� ��5)      Z�    Columns 5-      0  *System.Windows.Controls.DataGridTextColumn  5.      ,  &System.Windows.Controls.DataGridColumn   Header$ Event��6-      FontSize$ 18Q�6]      Width5  /System.Windows.Controls.DataGridLengthConverter$
 0.4* 6k      
FontWeight$
 Bold"�6x      
Foreground
 �����1  +System.Windows.Controls.DataGridBoundColumn   Binding 6<   �� *csEventTitle+   ElementStyle 5/      �� 50   "   .�51   &   ��  �� Property � �� �� Value$
 Wrap=�6O   52   #   54        55      $
 Time��6-   $ 18Q�6[   $
 0.2* 6i      	FontStyle$ Italic$�6v   
 ����� 6;   �� *csEventTime+ 56      �� 57   "   .�58   &   ��  � ��$
 Wrap=�6O   59   #   5;        5<      $ Location��6-   $ 18Q�6c   $
 0.3* 6q   
 ����� 6?   �� *csEventLocation+ 5=      �� 5>   "   .�5?   &   ��  � ��$
 Wrap=�6O   5@   #   5B         ColumnHeaderStyle 5D      �� 5E       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6    .�5F      ��  � ��
 �����6;   �� 5G       � ��
 ���� 6;   5H         RowStyle 5J      �� 5K      )  #System.Windows.Controls.DataGridRow"  6    .�5L      ��  � �� 6;   �� *color+5M       � 	Resources 5O      ��%a   '        �� 5P      "  6    .�5Q      ��  �@J�IsHitTestVisible .  6A   5R      5S      5T      5U      �� 5V      $��2��6   .+�5W      �� -   5        $ 	newsTitle��5W   B   #��[  6   $��Department News��6U   $��10,0,0,0q�6l   ���	#FFFFC0006~   �� 5X      -   5         ��Name$ csCard��5X   !   $
��10,5q�61   .+�5Y      �� -   5        $ csNewsTitle��5Y   $   $��20(�69   $
��Wrap=�6G   
�������6[   �� 5Z      -	   5        $ 
csNewsTime��5Z   $   $��18(�68   $��Italic$�6F   
�������No News at this time...6�   �� 5[      -
   5        $ csNewsLocation��5[   $   $��18(�6<   
�������6_   5\      5]      5^      � 5_   
   -   5        $  NewsGrid��5_      $��1��6!   $��1��61    5`      �� 5a      $
��Auto �6    �� 5b      $��* �6    .+�5d      �� -   5        $ generalNewsTitle��5d   J   $��0��6   #��[  6%   $��Today's Headlines��6d   $��10,0,0,0q�6}   ���	#FFFFC0006�   � 5f      $��1��6    5g      �� 5h      $
��0.6* �6$   �� 5i      $
��0.4* �6$   .+�5l      �� -   5         ��Name$ genNewsList��5l      $��0��5m      $��Stretch=�5p        �� SelectionMode$  Single=�5q      $��	10,0,10,5q�5r      $��Disabled=�5s      $
��Auto=�5t      ��5n      Z� ��5o      Z� ��5u      �� 5v      " ��6    .�5w      ��  � ��$ Stretch=�6K   �� 5x       � ��
 ���� 6;   �� 5y       � �� 5z   "   �� 5{   &   ! �� 
TargetType"! ��66   .R�5|   *   �� 5}   '   5      5�      ��5�      �� 5�      .R�5�      �� $ generalNewsCard��6)   $
��10,0q�6B   .+�5�   "   �� $ genNewsTitle��6,   $��20(�6B   $
��Wrap=�6P   
���������6w   �� *	NewsTitle+6�   �� 5�   "   $ genNewsDescription��6,   $��18(�6H   $
��Wrap=�6V   ���	#FFaaaaaa��6�   �� *NewsDescription+6�   �� 5�   "   $ genNewsDate��6,   $��18(�6A   $
��Wrap=�6P   $��Italic$�6d   ���	#FFaaaaaa��6�   �� *NewsPublicationDate+6�   5�      5�      5�      �� 5�      $��1��6   .+�5�      �� " �� Orientation$" 
Horizontal=�6!   .+�5�      	� -   5        # 	� 	GroupName$# NewsButtonGroup��5�   &   $��Stretch=�6B   $��AP Top News��6`     RadioButtonStyle#��[ 6v   6�   	� 5�      -   5        $# NewsButtonGroup��5�   &   $��Stretch=�6B   $��CNET Tech News��6`   #��[ 6y   6�   5�      �� 5�      $" 
Horizontal=�6!   .+�5�      	� -   5        $# NewsButtonGroup��5�   &   $��Stretch=�6B   $��BBC World News��6`   #��[ 6y   6�   	� 5�      -   5        $# NewsButtonGroup��5�   &   $��Stretch=�6B   $��	CLAS News��6`   #��[ 6t   6�   5�      5�      5�      5�      5�      5�      