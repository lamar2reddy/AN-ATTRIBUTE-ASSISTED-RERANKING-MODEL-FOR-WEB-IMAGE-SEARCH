using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserView_Hyper_view : System.Web.UI.Page
{
    DataMember obj_dm = new DataMember();
    BALProcess obj_bal = new BALProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            obj_dm.Hashvalue = Convert.ToInt32(Session["ImgID"].ToString());
            DataSet ds = new DataSet();
            ds = obj_bal.ViewAIA(obj_dm);
            DataList_AIA.DataSource = ds;
            DataList_AIA.DataBind();
        }
        catch
        {
            Response.Redirect("Z_HyperSearch.aspx");
        }
    }
    public string Img(object image)
    {
        byte[] bytes = (byte[])image;
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        return "data:image/png;base64," + base64String;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
    }
}