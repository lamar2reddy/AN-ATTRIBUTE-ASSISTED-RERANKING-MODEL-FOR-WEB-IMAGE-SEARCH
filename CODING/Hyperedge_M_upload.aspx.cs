using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hyperedge_upload : System.Web.UI.Page
{
    public static int Count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Btn_UploadtoDB.Enabled = false;
        }
        btn_refresh.Visible = false;
    }
    protected void Btn_Img_Upload_Click(object sender, EventArgs e)
    {
        if (TxtImgName.Text.Length < 3)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Enter Images Name');", true);
        }
        else
        {
            try
            {
                string Filename = FileUpload_AIA_Img.PostedFile.FileName;
                string Extension = Path.GetExtension(Filename);
                string TempPath = Server.MapPath("~/View/Users/Temp/");
                string ResizePath = Server.MapPath("~/View/Users/Resized/");
                FileUpload_AIA_Img.SaveAs(TempPath + TxtImgName.Text + Extension);
                //Resizing Uploaded Image Here//
                Bitmap OriginalBM = new Bitmap(TempPath + TxtImgName.Text + Extension);
                Size newSize = new Size(390, 390);
                Bitmap ResizedBM = new Bitmap(OriginalBM, newSize);
                string ResizedImg = ResizePath + TxtImgName.Text + Extension;
                string NewImgname = TxtImgName.Text + Extension;
                ResizedBM.Save(ResizedImg, ImageFormat.Jpeg);
                originalImage.Src = "~/View/Users/Resized/" + NewImgname;
                Session["Img"] = NewImgname;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('" + ex.Message.ToString() + "');", true);
            }
        }
    }
   
    //protected void Btn_UploadtoDB_Click(object sender, EventArgs e)
    //{
    //    ImgStream obj_imgstrm = new ImgStream();
    //    Local_DataMember obj_locdm = new Local_DataMember();
    //    try
    //    {
    //        string[] Attr = new string[6];
    //        Attr[0] = Text1.Value;
    //        Attr[1] = Text2.Value;
    //        Attr[2] = Text3.Value;
    //        Attr[3] = Text4.Value;
    //        Attr[4] = Text5.Value;
    //        Attr[5] = Text6.Value;
    //        obj_locdm.Attrs = Attr;
    //        obj_locdm.OrgImgPath = Server.MapPath("~/View/Users/Temp/");
    //        obj_locdm.CropImgPath = Server.MapPath("~/View/Users/Crop/");
    //        bool r = obj_imgstrm.ImgUpload_frm_Folder(obj_locdm);
    //        if (r)
    //        {
    //            clr();
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Upload Successfully');", true);
    //        }
    //        else
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Error in Upload');", true);

    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('" + ex.Message.ToString() + "');", true);
    //    }
    //}

    protected void clr()
    {
        Count = 0;
        originalImage.Src = "";
        Img1.Src = "";
        Img2.Src = "";
        Img3.Src = "";
        Img4.Src = "";
        Img5.Src = "";
        Img6.Src = "";
        Text1.Value = "";
        Text2.Value = "";
        Text3.Value = "";
        Text4.Value = "";
        Text5.Value = "";
        Text6.Value = "";
        try
        {
            string Path1 = Server.MapPath("~/View/Users/Crop/");
            string Path2 = Server.MapPath("~/View/Users/Resized/");
            string Path3 = Server.MapPath("~/View/Users/Temp/");
            string[] Files = Directory.GetFiles(Path1);
            foreach (string Imgname in Files)
            {
                File.Delete(Imgname);
            }
            Files = Directory.GetFiles(Path2);
            foreach (string Imgname in Files)
            {
                File.Delete(Imgname);
            }
            Files = Directory.GetFiles(Path3);
            foreach (string Imgname in Files)
            {
                File.Delete(Imgname);
            }
        }
        catch { }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string extension = "";
        int[] X1 = { 19, 191, 8, 242, 201, 7 };
        int[] Y1 = { 153, 284, 15, 29, 181, 115 };
        int w = 150;
        int h = 150;
        string originalFile = Server.MapPath("~/View/Users/Resized/" + Session["Img"].ToString());
        for (int count = 0; count < 6; count++)
        {
            int X = X1[count];
            int Y = Y1[count];
            using (System.Drawing.Image img = System.Drawing.Image.FromFile(originalFile))
            {
                using (System.Drawing.Bitmap _bitmap = new System.Drawing.Bitmap(w, h))
                {
                    _bitmap.SetResolution(img.HorizontalResolution, img.VerticalResolution);
                    using (Graphics _graphic = Graphics.FromImage(_bitmap))
                    {
                        _graphic.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                        _graphic.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                        _graphic.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                        _graphic.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                        _graphic.DrawImage(img, 0, 0, w, h);
                        _graphic.DrawImage(img, new Rectangle(0, 0, w, h), X, Y, w, h, GraphicsUnit.Pixel);

                        extension = Path.GetExtension(originalFile);
                        Count++;
                        string croppedFileName = Count.ToString();
                        string path = Server.MapPath("~/View/Users/Crop/");

                        if (extension.EndsWith("gif", StringComparison.OrdinalIgnoreCase))
                        {
                            extension = ".png";
                        }

                        string newFullPathName = string.Concat(path, croppedFileName, extension);

                        using (EncoderParameters encoderParameters = new EncoderParameters(1))
                        {
                            encoderParameters.Param[0] = new EncoderParameter(Encoder.Quality, 100L);
                            _bitmap.Save(newFullPathName, ImgCodec.GetImageCodec(extension), encoderParameters);
                        }

                    }

                }
            }
        }
        Img1.Src = "~/View/Users/Crop/1" + extension;
        Img2.Src = "~/View/Users/Crop/2" + extension;
        Img3.Src = "~/View/Users/Crop/3" + extension;
        Img4.Src = "~/View/Users/Crop/4" + extension;
        Img5.Src = "~/View/Users/Crop/5" + extension;
        Img6.Src = "~/View/Users/Crop/6" + extension;
        btnCrop.Enabled = false;
        Btn_UploadtoDB.Enabled = true;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImgStream obj_imgstrm = new ImgStream();
        Local_DataMember obj_locdm = new Local_DataMember();
        try
        {
            string[] Attr = new string[6];
            Attr[0] = Text1.Value;
            Attr[1] = Text2.Value;
            Attr[2] = Text3.Value;
            Attr[3] = Text4.Value;
            Attr[4] = Text5.Value;
            Attr[5] = Text6.Value;
            obj_locdm.Attrs = Attr;
            obj_locdm.OrgImgPath = Server.MapPath("~/View/Users/Temp/");
            obj_locdm.CropImgPath = Server.MapPath("~/View/Users/Crop/");
            obj_locdm.categoryy = DropDownList1.SelectedItem.Text;
            bool r = obj_imgstrm.ImgUpload_frm_Folder(obj_locdm);
            if (r)
            {
                clr();
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Upload Successfully');", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Error in Upload');", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('" + ex.Message.ToString() + "');", true);
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void Btn_Clear_Click(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TxtImgName.Text = DropDownList1.SelectedItem.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Testing.aspx");
    }
    protected void btn_refresh_Click(object sender, ImageClickEventArgs e)
    {
        string Path1 = Server.MapPath("~/View/Users/Crop/");
        string Path2 = Server.MapPath("~/View/Users/Resized/");
        string Path3 = Server.MapPath("~/View/Users/Temp/");
        string[] Files = Directory.GetFiles(Path1);
        foreach (string Imgname in Files)
        {
            File.Delete(Imgname);
        }
        Files = Directory.GetFiles(Path2);
        foreach (string Imgname in Files)
        {
            File.Delete(Imgname);
        }
        Files = Directory.GetFiles(Path3);
        foreach (string Imgname in Files)
        {
            File.Delete(Imgname);
        }
    }
}
