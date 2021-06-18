using System;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;


public partial class XXX : System.Web.UI.Page
{
    public static int Count = 0;
    DataMember obj_dm = new DataMember();
    BALProcess obj_bal = new BALProcess();

    protected void Page_Load(object sender, EventArgs e)
    {
        string admin = Session["admin"].ToString();
        string user = Session["user"].ToString();
        if ("Admin" == admin)
        {
            btn_back2.Visible = true;
            Button1.Visible = false;
        }
        else if ("User" == user)
        {
            btn_back2.Visible = false;
            Button1.Visible = true;
        }

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
                string Filename = FileUpload_HP_Img.PostedFile.FileName;
                string Extension = Path.GetExtension(Filename);
                string TempPath = Server.MapPath("~/View/Users/Temp/");
                string ResizePath = Server.MapPath("~/View/Users/Resized/");
                FileUpload_HP_Img.SaveAs(TempPath + TxtImgName.Text + Extension);
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

    protected void btnCrop_Click(object sender, EventArgs e)
    {
        int X1 = Convert.ToInt32(Request.Form["x1"]);
        int Y1 = Convert.ToInt32(Request["y1"]);
        int X2 = Convert.ToInt32(Request.Form["x2"]);
        int Y2 = Convert.ToInt32(Request.Form["y2"]);
        int X = System.Math.Min(X1, X2);
        int Y = System.Math.Min(Y1, Y2);
        int w = Convert.ToInt32(Request.Form["w"]);
        int h = Convert.ToInt32(Request.Form["h"]);
        string originalFile = Server.MapPath("~/View/Users/Resized/" + Session["Img"].ToString());
        using (Image img = Image.FromFile(originalFile))
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

                    string extension = Path.GetExtension(originalFile);
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
                    if (Count == 1)
                        Img1.Src = "~/View/Users/Crop/1" + extension;
                    else if (Count == 2)
                        Img2.Src = "~/View/Users/Crop/2" + extension;
                    else if (Count == 3)
                        Img3.Src = "~/View/Users/Crop/3" + extension;
                    else if (Count == 4)
                        Img4.Src = "~/View/Users/Crop/4" + extension;
                    else if (Count == 5)
                        Img5.Src = "~/View/Users/Crop/5" + extension;
                    else if (Count == 6)
                    {
                        Img6.Src = "~/View/Users/Crop/6" + extension;
                        Count = 0;
                        ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Image Crop Over');", true);
                        btnCrop.Enabled = false;
                        Btn_UploadtoDB.Enabled = true;
                    }
                    else
                    {
                        clr();
                    }
                }

            }
        }
    }

    protected void Btn_Clear_Click(object sender, EventArgs e)
    {
        clr();
    }

    protected void Btn_UploadtoDB_Click(object sender, EventArgs e)
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
            bool r = obj_imgstrm.ImgUpload_frm_Folder(obj_locdm);
            if (r)
            {
                clr();
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Image Uploaded Successfully');", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Error in Upload');", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('" + ex.Message.ToString() + "');", true);
        }
    }

    protected void clr()
    {
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
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Image Uploaded Successfully');", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Error in Upload');", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('" + ex.Message.ToString() + "');", true);
        }
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

    protected void btn_back2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Image_UploadAdmin.aspx");
    }
}