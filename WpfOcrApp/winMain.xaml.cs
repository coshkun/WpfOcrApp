using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using WpfOcrApp.appdata;

namespace WpfOcrApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public data3000Entities kontess;

        public MainWindow()
        {
            InitializeComponent();
            kontess = new data3000Entities();
        }

        private void btnOCR_Click(object sender, RoutedEventArgs e)
        {
            var wocr = new winOCR();
            wocr.ShowDialog();
        }

        private void txtAddMap_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                if (txtAddMap.Text != string.Empty)
                {
                    lstNoticedMaps.Items.Add(txtAddMap.Text.ToUpper().Trim());
                    txtAddMap.Text = string.Empty;
                }
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            

            lstNoticedMaps.Items.Clear();
            List<object> lst = new List<object>();
            var snc = from map in kontess.Katalog
                      select new
                      {
                          map.Id,
                          map.MapNumber,
                          map.MapTittle
                      };

            dataGrid1.ItemsSource = snc.ToList();
            
        }
    }
}
