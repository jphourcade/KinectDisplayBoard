﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes;
using System.Web;
using System.Timers;

namespace Microsoft.Samples.Kinect.ControlsBasics.Pages
{
    //TODO only get 1 question a day
 
    /// <summary>
    /// Interaction logic for FunPage.xaml
    /// </summary>
    public partial class FunPage : UserControl
    {
        
        public static string staticTriviaQuestion;
        public static int SavedDay = 999;
        public static Timer GetTimer;
        private static string staticInterviewQuestion;
        private static string staticFunFact;
        private static string staticCorrectAnswer;
        private static string[] staticIncorrectAnswers;
        private static bool staticIsMultiple;

        public FunPage()
        {
            InitializeComponent();
            SetApis();           
        }      

        private void SetApis()
        {
            if (DateTime.Today.Day != SavedDay)
            {
                SavedDay = DateTime.Today.Day;
                GetTrivia();
                SetInterviewQuestion();
                SetFunFact();
            }
            SetTriviaQuestionText();
            SetFunFactText();
            SetInterviewQuestionText();
        }

        private void SetApis(object sender, ElapsedEventArgs e)
        {
            SetApis();
            Debug.WriteLine("HERE");
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            var selectedAnswer = rb.Content;
           
            if (selectedAnswer.Equals(staticCorrectAnswer))
            {
                IncorrectBox.Visibility = Visibility.Hidden;
                CorrectStar.Visibility = Visibility.Visible;
            }
            else
            {
                CorrectStar.Visibility = Visibility.Hidden;
                IncorrectBox.Visibility = Visibility.Visible;
            }
        }

        private void GetTrivia()
        {
            //Trivia URI
            Uri feedUri = new Uri(@"http://opentdb.com/api.php?amount=1&category=18");
            using (HttpClient downloader = new HttpClient())
            {
                Task<string> jsonString = downloader.GetStringAsync(feedUri);
                if(jsonString.Result != null)
                {
                    TriviaRoot triviaRoot = JsonConvert.DeserializeObject<TriviaRoot>(jsonString.Result);
                    ParseTrivia(triviaRoot);
                }                
            }
        }
               

        private void SetInterviewQuestion()
        {
            Random rand = new Random();
            int questionNum = rand.Next(0, MainWindow.interviewQuestions.Count);
            staticInterviewQuestion = MainWindow.interviewQuestions[questionNum];
        }

        private void SetInterviewQuestionText()
        {
            InterviewQuestionText.Text = staticInterviewQuestion;
        }

        private void SetFunFact()
        {
            DateTime today = DateTime.Today;
            Debug.WriteLine(today.Month + " " + today.Day);
            Uri feedUri = new Uri(@"http://numbersapi.com/" + today.Month + "/" + today.Day + "/date?json");
            using (HttpClient downloader = new HttpClient())
            {
                var funFactString = downloader.GetStringAsync(feedUri);
                if (funFactString.Result != null)
                {
                    FunFact funFact = JsonConvert.DeserializeObject<FunFact>(funFactString.Result);
                    staticFunFact = funFact.text;
                }
            }
        }

        private void SetFunFactText()
        {
            FunFactText.Text = staticFunFact;
        }

        private void SetTriviaQuestionText()
        {
            Question.Text = staticTriviaQuestion;
            if (staticIsMultiple)
            {
                MultiAnswer.Visibility = Visibility.Visible;
                TrueFalse.Visibility = Visibility.Collapsed;
                SetMultiAnswers(staticCorrectAnswer, staticIncorrectAnswers);
            }
            else
            {
                MultiAnswer.Visibility = Visibility.Collapsed;
                TrueFalse.Visibility = Visibility.Visible;
            }
        }

        private void ParseTrivia(TriviaRoot triviaRoot)
        {
            if(triviaRoot.response_code == 4)
            {
                
                GetTrivia();
            } else if(triviaRoot.response_code == 0)
            {
                TriviaResult tres = triviaRoot.results[0];
                staticIsMultiple = tres.type.Equals("multiple");
                staticTriviaQuestion = HttpUtility.HtmlDecode(tres.question);
                staticCorrectAnswer = tres.correct_answer;
                staticIncorrectAnswers = tres.incorrect_answers;               
            }
        }

        

        private void SetMultiAnswers(string correct_answer, string[] incorrect_answers)
        {
            Random rand = new Random();
            int correctNumber = rand.Next(1,5);  //Random Number between 1 and 4
            switch (correctNumber)
            {
                case 1:
                    AnswerA.Content = HttpUtility.HtmlDecode(correct_answer);
                    AnswerB.Content = HttpUtility.HtmlDecode(incorrect_answers[0]);
                    AnswerC.Content = HttpUtility.HtmlDecode(incorrect_answers[1]);
                    AnswerD.Content = HttpUtility.HtmlDecode(incorrect_answers[2]);

                    break;
                case 2:
                    AnswerB.Content = HttpUtility.HtmlDecode(correct_answer);
                    AnswerA.Content = HttpUtility.HtmlDecode(incorrect_answers[0]);
                    AnswerC.Content = HttpUtility.HtmlDecode(incorrect_answers[1]);
                    AnswerD.Content = HttpUtility.HtmlDecode(incorrect_answers[2]);

                    break;

                case 3:
                    AnswerC.Content = HttpUtility.HtmlDecode(correct_answer);
                    AnswerB.Content = HttpUtility.HtmlDecode(incorrect_answers[0]);
                    AnswerA.Content = HttpUtility.HtmlDecode(incorrect_answers[1]);
                    AnswerD.Content = HttpUtility.HtmlDecode(incorrect_answers[2]);

                    break;

                case 4:
                    AnswerD.Content = HttpUtility.HtmlDecode(correct_answer);
                    AnswerB.Content = HttpUtility.HtmlDecode(incorrect_answers[0]);
                    AnswerC.Content = HttpUtility.HtmlDecode(incorrect_answers[1]);
                    AnswerA.Content = HttpUtility.HtmlDecode(incorrect_answers[2]);

                    break;
            }
        }
    }
}