   M S B A M L   `   `   `  ����F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nullm;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages-Microsoft.Samples.Kinect.ControlsBasics.Pages  5      Dclr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes6Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes  5      >    8Microsoft.Samples.Kinect.ControlsBasics.Pages.PeoplePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Mlocal;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages     5      U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  5	      J FWpfAnimatedGif, Version=1.4.14.0, Culture=neutral, PublicKeyToken=null,gif"http://wpfanimatedgif.codeplex.com  5
      RloadingDclr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes  5      $��10,10,10,10q�5      .��5      �� -   5          ��Name$  navigationRegion��5   3   $��1��6   $��2��6"   .��5   
   �  � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $��* �6     � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $��* �6#   .+�5      ��    HeaderStyle#��[  6   $��	UltraBold"�6=   $��0��6T   $��0��6a   $��	0 10 0 10q�6q   $��People��6�   $��36(�6�   ���	#FFEEEEEE6�   �� 5      $��0��6   $��1��6%   $��Right=�65   #��[  6Q   $>��8Select a row to open a map with to where you want to go!��6v   $��	0,10,0,10q�6�   ���	#FFFFC0006�   K   EMicrosoft.Samples.Kinect.ControlsBasics.Helper_Classes.LoadingControl  5      -   5          Name$ Loading��5   c   $��Center=�6%   $��2��6B   $��1��6V   6c   �� 5      -   5         ��Name$ scrollViewer��5      $��1��5      $��0��5      $��2��5      $
��Auto=�5       $��Disabled=�5!      0  *Microsoft.Kinect.Wpf.Controls.KinectRegion   IsScrollInertiaEnabled . .��5#      &   System.Windows.Controls.DataGrid  -   5          Name$ 
PeopleGrid��5#         AlternatingRowBackground �	#FF424242 �� AlternationCount$ 2��5$   <   	   RowBackground
	 ���� ��. $
��Auto=�5'      
   
IsReadOnly
 .    AutoGenerateColumns .     EnableRowVirtualization .  !   EnableColumnVirtualization .     	RowHeight$	 100Q�5-         SelectionMode$ Single=�5.         AreRowDetailsFrozen . ��5(   )   �� ��5*      Z�    ColumnHeaderStyle 50      �� 51       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6    .�52      ��  �� Property � �� �� Value
 �����6;   �� 53       � ��
 ���� 6;   54         	CellStyle 56      �� 57      *  $System.Windows.Controls.DataGridCell"  6    .�58      ��  � ��
 �����6;   �� 59       � ��
 ���� 6;   �� 5:       � ��$
 17.5(�69   5;       � 	Resources 5=      ��%T   '��       �� 5>      " ��6    .�5?      ��  � ��$
 Wrap=�6=   5@      5A         Columns 5B      0  *System.Windows.Controls.DataGridTextColumn  5C      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��6-      FontSize$ 18Q�6T      Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto 6b      
FontWeight$
 Bold"�6o      
Foreground
 �����1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding 6;   �� *Name+ 	  ElementStyle 5D      �� 5E   "   .�5F   &   ��  � ��$
 Wrap=�6O   5G   #   5I        5J      $ Office��6-   $ 17Q�6X      	FontStyle$ Italic$�6f   
 ����� 6=   �� *Office+ 5K      �� 5L   "   .�5M   &   ��  � ��$
 Wrap=�6O   5N   #   5P        5Q      $ Hours��6-   $ 17Q�6V   
 ����� 6<   �� *Hours+ 5R      �� 5S   "   .�5T   &   ��  � ��$
 Wrap=�6O   5U   #   5W        5X      $ Email��6-   $ 17Q�6V   
 ����� 6<   �� *Email+ 5Y      �� 5Z   "   .�5[   &   ��  � ��$
 Wrap=�6O   5\   #   5^      ��5a      �� 5b      )
  #System.Windows.Controls.DataGridRow" 
 6    .�5d      -   5        5e      5g      5h      5i      5j      5k      