using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_upload : System.Web.UI.Page
{
    Service1Client sc1 = new Service1Client();
    DALProcess obj_dal = new DALProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            FileUpload img = (FileUpload)FileUpload1;
            Byte[] imgbyte = null;
            if (FileUpload1.HasFile)
            {
                HttpPostedFile File = FileUpload1.PostedFile;
                imgbyte = new Byte[File.ContentLength];
                File.InputStream.Read(imgbyte, 0, File.ContentLength);

                textupload obj_txt = new textupload();
                obj_txt.imgname = txt_imagename.Text;
                obj_txt.imgfile = imgbyte;
                bool i = sc1.textupload_cs(obj_txt);
                if (i == true)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Image Uploaded Successfully')</script>");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Image Uploaded Failed')</script>");
                }
            }
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Image Size is very Big')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string fname = Path.GetFileNameWithoutExtension(filename);
        string ext = Path.GetExtension(filename);
        int length = FileUpload1.PostedFile.ContentLength;
        byte[] img1 = new byte[length];
        HttpPostedFile image = FileUpload1.PostedFile;
        image.InputStream.Read(img1, 0, length);
        if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == "jpeg" || ext == ".JPG" || ext == ".PNG" || ext == ".GIF" || ext == "JPEG")
        {
            //bo.Fname = filename;
            //bo.Fsize = length;
            //bo.Imag = img1;
            //bo.Fname1 = fname;
            //bo.Signature = txt_sig.Text;
            //bo.Category = drop_cat.SelectedItem.Text;

            textupload obj_txt = new textupload();
            obj_txt.imgname = txt_imagename.Text;
            obj_txt.imgfile = img1;
            bool i = sc1.textupload_cs(obj_txt);
            if (i==true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "validation", "<script language='javascript'>alert('File Uploaded Successfully...')</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "validation", "<script language='javascript'>alert('????...')</script>", false);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "validation", "<script language='javascript'>alert('File format not supported...')</script>", false);
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = obj_dal.chart_dal();

        string[] x = new string[dt.Rows.Count];
        int[] y = new int[dt.Rows.Count];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            x[i] = dt.Rows[i][0].ToString();
            y[i] = Convert.ToInt32(dt.Rows[i][1]);
        }
        Chart1.Series[0].Points.DataBindXY(x, y);
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //DataSet ds = new DataSet();
        //ds = obj_dal.AttrCount_dal();
        GridView1.DataSource = obj_dal.AttrCount_dal();
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        GridView2.DataSource = obj_dal.Attributelist_dal();
        GridView2.DataBind();
    }
}