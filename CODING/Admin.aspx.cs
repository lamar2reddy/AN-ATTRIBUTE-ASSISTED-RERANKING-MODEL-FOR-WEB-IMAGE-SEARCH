using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        if(txt_uid.Text=="Admin" && txt_password.Text=="Admin")
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
            Response.Redirect("Admin_upload.aspx");
        }
        else
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Login Failed')</script>");
        }
    }
}