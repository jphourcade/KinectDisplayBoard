using HtmlAgilityPack;
using Microsoft.Samples.Kinect.ControlsBasics.Helper_Classes;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows.Controls;
using System;
using System.Windows.Threading;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls.Primitives;

namespace Microsoft.Samples.Kinect.ControlsBasics.Pages
{
    /// <summary>
    /// Interaction logic for PeoplePage.xaml
    /// </summary>
    public partial class PeoplePage : UserControl
    {
        private Regex firstFloor = new Regex("^[1][0-9][0-9].*MLH$");
        private Regex secondFloor = new Regex("^[2][0-9][0-9].*MLH$");
        private Regex thirdFloor = new Regex("^[3][0-9][0-9].*MLH$");
        private Regex basementFloor = new Regex("^B[0-9][0-9]?.*MLH$");
        private Regex groundFloor = new Regex("^[0-9][0-9]?.*MLH$");
        

        public PeoplePage()
        {
            InitializeComponent();
            SetPeopleList();
        }
      

        /// <summary>
        /// Async method that waits for API call and then updates UI
        /// </summary>
        private async void SetPeopleList()
        {
            try
            {
                List<CSPeople> peopleList = await ParseHttpPeopleAsync();
                Dispatcher.Invoke(DispatcherPriority.DataBind, new Action(delegate { PeopleGrid.DataContext = peopleList; }));
            }
            catch { }
                Loading.Visibility = Visibility.Collapsed;
           
        }
        
        /// <summary>
        /// Async method that returns Parsed list of CSPeople
        /// </summary>
        /// <returns></returns>
        async Task<List<CSPeople>> ParseHttpPeopleAsync()
        {
            HttpClient client = new HttpClient();
            var doc = new HtmlDocument();
            var html = await client.GetStringAsync("https://www.cs.uiowa.edu/people");
            doc.LoadHtml(html);

            List<CSPeople> p = await Task.Run(() => { 
                List<CSPeople> people = new List<CSPeople>();
                var rows = doc.DocumentNode.SelectNodes("//table[contains(@class,'views-table')]//tr");

                foreach (var tr in rows)
                {               
                    CSPeople person = new CSPeople();
                    foreach (var td in tr.ChildNodes)
                    {
                        if (td.GetAttributeValue("class", "Not found").Equals("views-field views-field-title"))
                        {
                            person.Name = td.InnerText;
                        }
                        else if (td.GetAttributeValue("class", "Not found").Equals("views-field views-field-field-office"))
                        {
                            person.Office = td.InnerText;
                        }
                        else if (td.GetAttributeValue("class", "Not found").Equals("views-field views-field-field-hours"))
                        {
                            person.Hours = td.InnerText;
                        }                    
                        else if (td.GetAttributeValue("class", "Not found").Equals("views-field views-field-field-email"))
                        {
                            person.Email = td.InnerText;
                        }
                    }
                    people.Add(person);
                }
                Regex r = new Regex(@"\W*Name\W*");
                Regex blanksReg = new Regex(@"^\W*$");
                
                people.RemoveAll(person => r.IsMatch(person.Name));
                people.RemoveAll(person => blanksReg.IsMatch(person.Office));
                
                return people;
            });            
            return p;   
        }

        /// <summary>
        /// Sets the floor and checks a regex if the office is on that floor
        /// </summary>
        /// <param name="innerText"></param>
        /// <returns></returns>
        private string SetFloor(string innerText)
        {
            if (firstFloor.IsMatch(innerText))
            {
                return "Floor 1";
            }
            else if (secondFloor.IsMatch(innerText))
            {
                return "Floor 2";
            }
            else if (thirdFloor.IsMatch(innerText))
            {
                return "Floor 3";
            }
            else if (groundFloor.IsMatch(innerText))
            {
                return "Ground Floor";
            }
            else if (basementFloor.IsMatch(innerText))
            {
                return "Basement";
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Click handler for rows in datagrid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Row_Click(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            DataGridCellsPresenter dataRow = (DataGridCellsPresenter)e.Source;
            CSPeople person = (CSPeople)dataRow.DataContext;   
            string office = Regex.Replace(person.Office, @"\s+", "");
            string floor  = SetFloor(office);
            if(floor != null)
            {
                MapsPage.initMap = floor;
                navigationRegion.Content = Activator.CreateInstance(typeof(MapsPage));
            }
            else
            {
                MessageBox.Show("Office is not in Maclean Hall. Please tap 'OK' to remove");
            }            
        }
    }
}
