   M S B A M L   `   `   `  ���� F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nulla5clr-namespace:Microsoft.Samples.Kinect.ControlsBasics'Microsoft.Samples.Kinect.ControlsBasics  O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 8    2Microsoft.Samples.Kinect.ControlsBasics.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  Alocal5clr-namespace:Microsoft.Samples.Kinect.ControlsBasics  U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  3System&clr-namespace:System;assembly=mscorlib  -     �Name$  KinectBoardWindow�� � Title$ Kinect Display Board��$	��500��$	��700�� � WindowState$ 	Maximized=� � WindowStyle$ SingleBorderWindow=�   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�.��0  *Microsoft.Kinect.Wpf.Controls.KinectRegion  -     Name$ kinectRegion��.��� ����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.��� 	 � Color$	 	#FF292929��� $	 	#FF020202��
 � Offset$
 1Q� � RowDefinitions �� $
��Auto ��� $
��100* ��� $��* �.+�� -    �Name$ topBar��$��0��$��0,0,0,7q�
���   � � ColumnDefinitions �� $
��Auto ��� $��* �.+��� -    ��Name$ 
backButton��$y�Hidden=�$��0��  BackButtonStyle#��[ � $��0��$��1�� �� $
��0.2* ��� $
��0.3* � �� $
��Auto ��� $��* ��� $��* �.+��� -    ��Name$ image��$��0��$��0��$��clas.png��$
��Left=�$��20��$��Bottom=��� -    ��Name$	 Sci��$��1��$��0��$	��Top=�$��36(�$��Segoe UI Black)�$
��Left=����	#DDFFFFFF$��0q�$��Computer Science��(� $��0��$��2��$��1��$	��150��$	��150��.���� -   $��KinectStreamView��$��UniformToFill=����� *ImageSource+�� -   $ image1��$��20��$��0��$��2��$��Images/uiowa.png��$��Bottom=�$��Right=�$��0,0,25,0q��� -	    ��Name$ DateTimeClock�� �� Orientation$ 
Horizontal=�$��1��$��2��$��Right=�$	��Top=�$��0,0,20,0q�.+��� ���#333333 �� CornerRadius$ 5��$��5q� �� Padding$ 5q�._��� -
   $ 	clockText��$��20(�$��Segoe UI Black)����	#DDFFFFFF$	��Top=��� $�00:00 pm���� ���#333333$ 5��$��5q�$ 5q�$	��Top=�._��� -   $ dateText��$��20(�$��Segoe UI Black)�$��Center=����	#DDFFFFFF$��0q��� $�
Mon, Jan 1�����	#FF333333�� -    ��Name$ navigationRegion��$��1��$��2��.��� -   $ kinectRegionGrid��$��5,5,5,20q� �� $
��0.4* ��� $
��0.6* � �� $	��15* ��� $
��100* �.+��� -   $ weatherPanel��$��0��$��0��$ 
Horizontal=�$��0,10,0,0q�.+��� .+���   HeaderStyle#��[ $
��Wrap=�$��Forecast��$	��Top=����	#FFFFC000$��24(�$��0q�$��Center=��� -   $ wuLogo��$-��'Images/wundergroundLogo_4c_rev_horz.jpg��$��25��$	��Top=��� -   $ weather1��$
��10,0q�$��Center=�.+��� -   $
 day1�� �� TextAlignment$ Center=�$��20(����	#FFFFC000Today�� -   $ weatherIcon1��$
��40px��$
��40px���� -   $ Temp1��$��20(�$ Center=�
��������� $��Stretch=�$��1��$��2q�
�������$	��0.5���� -   $ weather2��$
��10,0q�.+��� -   $
 day2��$��20(�$ Center=����	#FFFFC000�� -   $ weatherIcon2��$
��40px��$
��40px���� -   $ Temp2��$��20(�$ Center=�
��������� -   $ weather3��$
��10,0q�.+��� -   $
 day3��$��20(�$ Center=����	#FFFFC000�� -   $ weatherIcon3��$
��40px��$
��40px���� -   $ Temp3��$��20(�$ Center=�
��������� -   $ weather4��$
��10,0q�.+��� -   $
 day4��$��20(�$ Center=����	#FFFFC000�� -   $ weatherIcon4��$
��40px��$
��40px���� -   $ Temp4��$��20(�$ Center=�
��������� -     ��Name$ scrollViewer��$��1��$��0��$��Hidden=�$��Disabled=�   IsScrollInertiaEnabled . .���� -!    ��Name$ itemsControl��$��0��  Kinect250x250ItemTemplate#��[ $
��0,10q����� .R�� $��Center=� � Orientation$ Vertical=�$��	75,0,75,0q�� -"   $ RightGridPanel��$��1��$��0��$��2��$��10,0,0,0q� �� $��6* ��� $��4* �.+�� $��0�� �� $
��Auto ��� $��* �.+��� -#   $ NewsAndAnnouncment��$��0��#��[ $
��Wrap=�$��Upcoming News & Events��$	��Top=�$��Stretch=����	#FFFFC000�� -$   $ Slides��$��1������  �� 
TargetType" ��.���  �� Property � �� �� Value$ Disabled=���  � ��$ Disabled=� �� Triggers ��  �� Binding �� *	IsChecked+  �� ElementName$  chkActualSize��! �� Value! True.a���  � ��$
 Auto=���  � ��$
 Auto=�.���� -%   $ 
SlideImage��$��Uniform=����� *SlideSource+�� -&   $ EventsSlide��$��Disabled=�$
��Auto=�$��1��.���� -'   " ��Name$" csEventsList��$��Stretch=�# �� SelectionMode$# Single=�$��	10,0,10,5q�$��Disabled=�$
��Auto=���Z� ��Z� ���� " ��.���  � ��$ Stretch=���  � ��
 ���� ��  � �� �� $ �� 
TargetType"$ ��.R��� ���� .R��� $��Stretch=�.+��� $ csEventTitle��$��20(�$
��Wrap=�
����������� *csEventTitle+�� $ csEventTime��$��18(�$��Italic$����	#FFaaaaaa���� *csEventTime+�� $ csEventLocation��$��18(����	#FFaaaaaa���� *csEventLocation+�� $��1��$	��Top=�
��������� $��1��$��Stretch=�.+��� -(   $ busScheduleTitle��#��[ $��1�����	#FFFFC000Upcoming Buses&   System.Windows.Controls.DataGrid  -)   %  Name$% BusGrid��&   
IsReadOnly& . '   AutoGenerateColumns' .  (   SelectionMode$( Single=�)   SelectionUnit$
) Cell=����� ��Z� *   Columns* 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn+   Header$+ 	Stop Name��,   FontSize$, 16Q�1  +System.Windows.Controls.DataGridBoundColumn-   Binding- �� *
stopname+  $+ 
Route Name��$, 16Q�- �� *	routename+  $
+ Time��$, 16Q�- �� *	minutes+.   ColumnHeaderStyle. �� =  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  � ��
 �������  � ��
 ���� /   RowStyle/ �� )  #System.Windows.Controls.DataGridRow"  .���  � �� �� *color+0 � 	Resources0 ��%<   '        �� "  .���  �@J�IsHitTestVisible .  �� -*   $ 	bottomBar��$ 
Horizontal=�$��26��$��Bottom=����	#FF020202$��Stretch=�$��2��$��1��0 1 ��Name  sb2 g� RepeatBehavior3 �� 
TargetName4 �� TargetProperty	5 W� To6 g� Duration7 W� From8 �� Source��%o   &	       �� $1 sb��$2 Forever��.��W� $3 	translate��$4 X�$5 -3500X�$6 0:0:59D�7 �� #8 Z��.+��� -+   $ bottomBarText��$��Center=�$��20(�$��Segoe UI Black)����	#DDFFFFFFz�T� -,   	translate����Welcome to MacLean Hall! ~~~~~ 欢迎来到 MacLean Hall ~~~~~ ¡Bienvenido a MacLean Hall! ~~~~~ आपका स्वागत है MacLean Hall ~~~~~ To use this board, place your hand in the air and find the hand cursor. ~~~~~ To click on a menu, line the cursor on the button and press it in the air. ~~~~~ The back button is in the top left corner.F� 5����    ���� Zb ����2G[��K�/`@��2G[��K�/`@	$��2.495��$��0,0,-0.5,8.488q�9 �� Stretch$
9 Fill=����	#FFFFC000$��Bottom=�$��5��