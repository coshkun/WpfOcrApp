using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;


using Emgu.CV;
using Emgu.CV.CvEnum;
using Emgu.CV.Structure;
using Emgu.CV.UI;
using Emgu.CV.Util;

namespace WpfOcrApp
{
    public class PossibleChar
    {
        public VectorOfPoint contour;
        public Rectangle boundingRect;
        public int intCenterX,intCenterY;
        public double dblDiagonalSize, dblAspectRatio;
        public int intRectArea;

        public PossibleChar(VectorOfPoint _contour)
        {
            contour = _contour;

            boundingRect = CvInvoke.BoundingRectangle(contour);
            intCenterX = (int)((boundingRect.Left + boundingRect.Right) / 2);
            intCenterY = (int)((boundingRect.Top + boundingRect.Bottom) / 2);

            dblDiagonalSize = Math.Sqrt((boundingRect.Width ^ 2) + (boundingRect.Height ^ 2));

            dblAspectRatio = (double)(boundingRect.Width) / (double)(boundingRect.Height);

            intRectArea = boundingRect.Width * boundingRect.Height;
        }
    }
}
