using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Microsoft.Kinect;

namespace PruebaKinect
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        KinectSensor miKinect;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            miKinect = KinectSensor.KinectSensors[0];
            // miKinect = KinectSensor.KinectSensors.FirstOrDefault();
            //Iniciamos kinect
            miKinect.Start();
            //damos inicio a envio de datos de parte del kinect, son string , flujo de datos
            miKinect.ColorStream.Enable();
            miKinect.ColorFrameReady += MiKinect_ColorFrameReady;

        }

        private void MiKinect_ColorFrameReady(object sender, ColorImageFrameReadyEventArgs e)
        {
            //Para poder reproducirlo como video, tomamos el flujo de datos
            using (ColorImageFrame frameImagen = e.OpenColorImageFrame())
            {
                if (frameImagen == null)
                {
                    return;
                }
                else
                {
                    //octenemos tamano de la imagen

                    byte[] datosColor = new byte[frameImagen.PixelDataLength];

                    frameImagen.CopyPixelDataTo(datosColor);

                    //Bitmap
                    //96 es punto por pulgadas horizontales y verticales
                    MostrarVideo.Source = BitmapSource.Create
                        (frameImagen.Width, frameImagen.Height
                        ,96,96,
                        PixelFormats.Bgr32,null,datosColor,
                        frameImagen.Width*frameImagen.BytesPerPixel);

                }
            }
        }
    }
}
