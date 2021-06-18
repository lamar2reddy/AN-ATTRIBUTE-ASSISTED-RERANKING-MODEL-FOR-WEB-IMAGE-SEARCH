using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Image_UploadAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["admin"] = "Admin";
        Session["user"] = "empty";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        clear();
        // Response.Redirect("TreeStructure.aspx");
    }
    public void clear()
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