   M S B A M L   `   `   `  ����F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nullm;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages-Microsoft.Samples.Kinect.ControlsBasics.Pages  5      =    7Microsoft.Samples.Kinect.ControlsBasics.Pages.BongoPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Mlocal;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages     5      U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  5      $��10,10,10,10q�5
      .��5      �   � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   ��    HeaderStyle#��[  6   $��	UltraBold"�69   $��0��6P   $��0��6]   $��	0 10 0 10q�6m   $��Bongo Bus Schedule��6�   $��36(�6�   ���	#FFEEEEEE6�   �� 5   
   $��1��6   $��0��6!   #��[  61   ���	#FFFFC000	Bus Stops6x   �� 5   
   $��2��6   $��0��6"   .+�5      	� -   5         	� 	GroupName$ BongoButtonGroup��5      $��Stretch=�67   $(��"Dwtn. Interchange (Schaeffer Hall)��6U     RadioButtonStyle#��[ 6�   6�   	� 5      -   5        $ BongoButtonGroup��5      $��Stretch=�67   $&�� IC Dwtn. Interchange (Mall Side)��6U   #��[ 6�   6�   	� 5      -   5        $ BongoButtonGroup��5      $��Stretch=�67   $��MacBride Hall��6U   #��[ 6m   6�   5      �� 5    
   -   5         ��Name$ BusTimesText��5    ?   $��1��6   $��1��6!   $
��10,0q�61   #��[  6U   ���	#FFFFC000	Bus Times6�   &   System.Windows.Controls.DataGrid  5#   
   -   5          Name$ BusGrid��5#         
IsReadOnly . $
��10,0q�66      AutoGenerateColumns .     SelectionMode$ Single=�6x      SelectionUnit$
 Cell=�6�   	 �� PanningMode$	 VerticalFirst=�5$      ��. $
��Auto=�5&      $��2��5'      $��1��5(      0  *Microsoft.Kinect.Wpf.Controls.KinectRegion
   IsScrollInertiaEnabled
 . $
��Auto=�5*         EnableRowVirtualization .  !   EnableColumnVirtualization .  ��5#   D   �� ��6�   Z�    Columns 5.      0  *System.Windows.Controls.DataGridTextColumn  5/      ,  &System.Windows.Controls.DataGridColumn   Header$ Stop Number     ��6%      FontSize$ 16Q�6Z   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6?   �� *stopid+6Z     50      $ Route Name     ��6%   $ 16Q�6\    6>   �� *	routename+6\     51      $
 Time��6%   $ 16Q�6O    63   �� *	minutes+6O      RowStyle 53      �� 54       �� 
TargetType)  #System.Windows.Controls.DataGridRow"  6   .�55      ��  �� Property � �� �� Value 63   �� *color+56       � 	Resources 58      ��%a   '        �� 59      "  6   .�5:      ��  �@J�IsHitTestVisible .  69   5;      5<         ColumnHeaderStyle 5=      �� 5>      =  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5?      ��  � ��
 �����63   �� 5@       � ��
 ���� 63   5A      5C      5E      5F      