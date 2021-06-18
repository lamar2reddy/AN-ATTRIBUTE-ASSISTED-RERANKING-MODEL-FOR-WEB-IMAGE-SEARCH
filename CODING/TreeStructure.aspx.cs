using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TreeStructure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public string Img(object image)
    {
        byte[] bytes = (byte[])image;
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        return "data:image/png;base64," + base64String;
    }
    protected void Btn_Img_Upload_Click(object sender, EventArgs e)
    {
        if (TxtImgName.Text.Length < 3)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Warning", "alert('Enter Sub-Class Name');", true);
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
    //        obj_locdm.ImgMidclass = DropDownList1.SelectedItem.Text;
    //        obj_locdm.Imgclass = Ddl_Classes.SelectedItem.Text;
    //        obj_locdm.Attrs = Attr;
    //        obj_locdm.OrgImgPath = Server.MapPath("~/View/Users/Temp/");
    //        bool r = obj_imgstrm.TreeSem_ImgUpload_frm_Folder(obj_locdm);
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
        originalImage.Src = "";
        try
        {
            Text1.Value = "";
            Text2.Value = "";
            Text3.Value = "";
            Text4.Value = "";
            Text5.Value = "";
            Text6.Value = "";
            TxtImgName.Text = "";
            string Path2 = Server.MapPath("~/View/Users/Resized/");
            string Path3 = Server.MapPath("~/View/Users/Temp/");
            string[] Files = Directory.GetFiles(Path2);
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
    protected void Ddl_Classes_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        if (Ddl_Classes.SelectedItem.Text == "--Select--")
        {
        }
        else if (Ddl_Classes.SelectedItem.Text == "Animal")
        {
            DropDownList1.Items.Add("Craniate");
            DropDownList1.Items.Add("Chordate");
        }
        else if (Ddl_Classes.SelectedItem.Text == "Bird")
        {
            DropDownList1.Items.Add("Can Fly");
            DropDownList1.Items.Add("Can't Fly");
        }
        else if (Ddl_Classes.SelectedItem.Text == "Flower")
        {
            DropDownList1.Items.Add("All Time Flower");
            DropDownList1.Items.Add("Season Flower");
        }
        else if (Ddl_Classes.SelectedItem.Text == "Human")
        {
            DropDownList1.Items.Add("Male");
            DropDownList1.Items.Add("Female");
        }
        else if (Ddl_Classes.SelectedItem.Text == "Vechicle")
        {
            DropDownList1.Items.Add("Two Wheeler");
            DropDownList1.Items.Add("Three Wheeler");
            DropDownList1.Items.Add("Four Wheeler");
            DropDownList1.Items.Add("Heavy Vechicle");
        }
        else
        {
            DropDownList1.Items.Add("Others");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
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
            obj_locdm.ImgMidclass = DropDownList1.SelectedItem.Text;
            obj_locdm.Imgclass = Ddl_Classes.SelectedItem.Text;
            obj_locdm.Attrs = Attr;
            obj_locdm.OrgImgPath = Server.MapPath("~/View/Users/Temp/");
            bool r = obj_imgstrm.TreeSem_ImgUpload_frm_Folder(obj_locdm);
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
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        clr();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Testing.aspx");
    }
    protected void btn_refresh_Click(object sender, EventArgs e)
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
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
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