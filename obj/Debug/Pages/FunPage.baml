   M S B A M L   `   `   `  ����F  BKinectBoard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=nullm;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages-Microsoft.Samples.Kinect.ControlsBasics.Pages  5      ;    5Microsoft.Samples.Kinect.ControlsBasics.Pages.FunPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Mlocal;clr-namespace:Microsoft.Samples.Kinect.ControlsBasics.Pages     5      U QMaterialDesignThemes.Wpf, Version=2.1.0.657, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      d `Microsoft.Kinect.Wpf.Controls, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e350k(http://schemas.microsoft.com/kinect/2014  5      c _Microsoft.Expression.Drawing, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35=ed4http://schemas.microsoft.com/expression/2010/drawing  5	      c _Microsoft.Expression.Effects, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35h	 dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35?ee4http://schemas.microsoft.com/expression/2010/effects  	 6N   $��10,10,10,10q�5      .��5      �   � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $
��0.6* �6   �� 5      $
��0.4* �6   .+�5   
   ��    HeaderStyle#��[  6   $��	UltraBold"�69   $��0��6P   $��0��6]   $��	0 10 0 10q�6m   $��	Daily Fun��6�   $��36(�6�   ���	#FFEEEEEE6�   �� 5   
   $��1��6   $��0��6!   #��[  61   ���	#FFFFC000$��Daily CS Trivia��6m   � 5   
   -   5         �Name$ 
TriviaGrid��5   ,   $��2��6   $��0��6   $��
0,10,10,10q�6@   $��Center=�6T     5      �� 5      $
��Auto �6    �� 5      $��* �6    �� 5      $��* �6     5!      �� 5"      $��* �6#   .+�5$      �� -   5         ��Name$ Question��5$      $
��Wrap=�6*   $��0��6>   $��0��6K   $��25(�6[   
�������6i   �� 5%      -   5         ��Name$ MultiAnswer��5%   &   $��1��6   $��0��6;   .+�5&      ��  �� Orientation$ 
Horizontal=�6   .+�5'      	� -   5         	�Name$ AnswerA��5'   "    	� 	GroupName$ MutipleChoiceGroup��63   $��Stretch=�6R   $��Answer A��6p     RadioButtonStyle#��[ 6�   6�   	� 5(      -   5        $ AnswerB��5(   "   $ MutipleChoiceGroup��63   $��Stretch=�6R   $��Answer B��6p   #��[ 6�   6�   5)      �� 5*      $ 
Horizontal=�6   .+�5+      	� -   5        $ AnswerC��5+   "   $ MutipleChoiceGroup��63   $��Stretch=�6R   $��Answer C��6p   #��[ 6�   6�   	� 5,      -   5        $ AnswerD��5,   "   $ MutipleChoiceGroup��63   $��Stretch=�6R   $��Answer D��6p   #��[ 6�   6�   5-      5.      �� 5/      -   5        $ 	TrueFalse��5/   6   $��1��6   $��0��6&   .+�50      �� $ 
Horizontal=�6   .+�51      	� -	   5        $ 
AnswerTrue��51   "   $ MutipleChoiceGroup��66   $��Stretch=�6U   $
��True��6s   #��[ 6�   6�   	� 52      -
   5        $ AnswerFaluse��52   "   $ MutipleChoiceGroup��68   $��Stretch=�6W   $��False��6u   #��[ 6�   6�   53      54      �� 55      -   5        $ CorrectStar��55      $��2��6.   $ 
Horizontal=�6;   $��Center=�6T   $y�Hidden=�6q    J� RenderTransformOrigin$ 0.466,0.517&�6�   .+�56      �� 
��������� 60   $�Correct!��64   6G   0  *Microsoft.Expression.Shapes.RegularPolygon  57      ���	#FF00F332/  )Microsoft.Expression.Media.GeometryEffect	   GeometryEffect8  2Microsoft.Expression.Media.GeometryEffectConverter$	 Sketch 65   $	��200��6_   
   InnerRadius$
 0.47211Q�6l      
PointCount$ 5Q�6�    �� Stretch$
 Fill=�6�   
���   �$	��200��6�    J� Effect 58      4  .Microsoft.Expression.Media.Effects.BloomEffect  59         BloomIntensity$ 1Q�6)      BaseSaturation$ 1Q�6<      BaseIntensity$ 1Q�6O      BloomSaturation$	 0.5Q�6a      	Threshold$	 0.5Q�6w   5;      �� 5<      
��������� 60   $�
Well Done!��64   6I   5=      �� 5>      -   5        $ IncorrectBox��5>      $��2��6/   $ 
Horizontal=�6<   $��Center=�6U   $y�Hidden=�6r   .+�5?      �� 
��������� 60   $�Wrong Answer��64   6K     5@      
���  ��$	 Sketch 6/   $	��200��6Y   $
 1Q�6f   $ 6Q�6v   $
 Fill=�6�   
���   �$��Center=�6�   $	��200��6�    5A        5B      $ 1Q�6)   $ 1Q�6<   $ 1Q�6O   $	 0.5Q�6a   $	 0.5Q�6w   5D      �� 5E      
��������� 60   $�
Try Again!��64   6I   5F      5H      � 5J   
   -   5        $ InterviewGrid��5J      $��1��5K      $��3��5L      $��1��5M        5N      �� 5O      $
��Auto �6    �� 5P      $��* �6    �� 5Q      $
��Auto �6    �� 5R      $��* �6    .+�5T      �� -   5        $ InterviewTitle��5T   %   $��0��6   #��[  6=   ���	#FFFFC000$��Daily Interview Question��6y   �� 5U      -   5        $ InterviewQuestionText��5U   9   $��1��6   $
��Wrap=�6%   
�������$��25(�6k   �� 5V      -   5        $ FunFactTitle��5V   %   $��2��6   #��[  6;   ���	#FFFFC000$��
Daily Fact��6w   �� 5W      -   5        $ FunFactText��5W   9   $��3��6   $
��Wrap=�6%   
�������$��25(�6a   5Y      5[      5\      