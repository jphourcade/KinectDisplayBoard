   M S B A M L   `   `   `  ���� F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nullm;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages-Microsoft.Samples.Kinect.ControlsBasics.Pages  Dclr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes6Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes  >    8Microsoft.Samples.Kinect.ControlsBasics.Pages.PeoplePage   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     Mlocal;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages     U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  J FWpfAnimatedGif, Version=1.4.14.0, Culture=neutral, PublicKeyToken=null,gif"http://wpfanimatedgif.codeplex.com  RloadingDclr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes  $��10,10,10,10q�.���   � RowDefinitions  �� $
��Auto ��� $��* �.+���    HeaderStyle#��[  $��	UltraBold"�$��0��$��0��$��	0 10 0 10q�$��People��$��36(����	#FFEEEEEEK   EMicrosoft.Samples.Kinect.ControlsBasics.Helper_Classes.LoadingControl  -     Name$ Loading��$��Center=�$��1���� -    ��Name$ scrollViewer��$��1��$
��Auto=�$��Disabled=�0  *Microsoft.Kinect.Wpf.Controls.KinectRegion   IsScrollInertiaEnabled . .��&   System.Windows.Controls.DataGrid  -     Name$ 
PeopleGrid��   AlternatingRowBackground �	#FF424242 �� AlternationCount$ 2����. $
��Auto=�   
IsReadOnly .    AutoGenerateColumns .  	   EnableRowVirtualization	 .  !
   EnableColumnVirtualization
 .  ���� ��Z�    ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value
 �������  � ��
 ����    	CellStyle �� *  $System.Windows.Controls.DataGridCell"  .���  � ��
 �������  � ��$
 17.5(� � 	Resources ��%/   '��       �� " ��.���  � ��$
 Wrap=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��   FontSize$ 18Q�   Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto    
FontWeight$
 Bold"�   
Foreground
 �����1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding �� *Name+ 	  ElementStyle �� .���  � ��$
 Wrap=�  $ Office��$ 17Q�   	FontStyle$ Italic$�
 ����� �� *Office+ �� .���  � ��$
 Wrap=�  $ Hours��$ 17Q�
 ����� �� *Hours+ �� .���  � ��$
 Wrap=�  $ Email��$ 17Q�
 ����� �� *Email+ �� .���  � ��$
 Wrap=�