using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

using Emgu.CV;
using Emgu.CV.CvEnum;
using Emgu.CV.OCR;
using Emgu.CV.Structure;
using Emgu.CV.Util;
using Emgu.Util;

namespace WpfOcrApp
{
    /// <summary>
    /// Interaction logic for winOCR.xaml
    /// </summary>
    public partial class winOCR : Window
    {
        OpenFileDialog openFileDialog = new OpenFileDialog();
        private System.Drawing.Bitmap imgDBug;
        private Mat imgDebug;

        public winOCR()
        {
            InitializeComponent();
            List<VectorOfPoint> contours = new List<VectorOfPoint>();
        }

        private void btnOpen_Click(object sender, RoutedEventArgs e)
        {
            openFileDialog.Filter = "Image files (*.jpg *.jpeg *.png *.bmp *.gif)|*.jpg;*.jpeg;*.png;*.bmp;*.gif|All files (*.*)|*.*";

            if (openFileDialog.ShowDialog() != System.Windows.Forms.DialogResult.OK) { return; }
            txtFileName.Text = openFileDialog.FileName;
            string ext = System.IO.Path.GetExtension(openFileDialog.FileName);

            if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".bmp" || ext == ".gif")
            {
                try {imboxSource.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                     txtInfo.AppendText("\n" + openFileDialog.SafeFileName + " loaded.");
                    imgDBug = new Bitmap(openFileDialog.FileName);
                    imgDebug = new Mat(openFileDialog.FileName, LoadImageType.Color);
                    var sor = imgDebug.Depth;
                    // imgDebug = new Mat(imgDBug.Size, DepthType.Cv8U, 1, imgDBug.GetHbitmap(), 1);
                    
                }
                catch (Exception hata) { txtInfo.AppendText("\n" + hata.Message); }
            }

            RecognizeImage();
        }

        private void RecognizeImage()
        {
            // CvInvoke.Imshow("imgDebug", imgDebug);
        }
    }
}
