using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;

public partial class User_login : System.Web.UI.Page
{
    Service1Client sc1 = new Service1Client();
    BALProcess obj_bal = new BALProcess();
    Register obj_reg = new Register();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            
            //Register obj_log = new Register();
            obj_reg.userid = txt_uid.Text;
            obj_reg.password = txt_password.Text;
            bool i = obj_bal.login_cs(obj_reg);
            if(i==true)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
                Response.Redirect("User_UploadPage.aspx");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Login Failed')</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
        
    }
}