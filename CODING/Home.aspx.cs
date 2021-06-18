using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["AIA"] = TextBox1.Text;
        Response.Redirect("Z_HyperSearch.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Session["SEM"] = TextBox1.Text;
        Response.Redirect("Z_TreeSearch.aspx");
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Session["ATTR"] = TextBox1.Text;
        Response.Redirect("Z_AttributeSearch.aspx");
    }
}