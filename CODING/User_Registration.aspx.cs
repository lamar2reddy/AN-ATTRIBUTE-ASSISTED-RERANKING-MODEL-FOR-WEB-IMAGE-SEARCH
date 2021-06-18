using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;
public partial class User_Registration : System.Web.UI.Page
{
    Service1Client sc1 = new Service1Client();
    BALProcess obj_bal = new BALProcess();
    Register obj_reg = new Register();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string str = "";
        if(RadioButton1.Checked==true)
        {
            str = "Male";
        }
        else
        {
            str = "Female";
        }

        Register obj_reg = new Register();
        obj_reg.name = txt_fname.Text;
        obj_reg.userid = txt_uid.Text;
        obj_reg.password = txt_passwd.Text;
        obj_reg.gender = str.ToString();
        obj_reg.email = txt_Email.Text;
        obj_reg.mobile = Convert.ToInt64(txt_mobile.Text);
        obj_reg.location = txt_location.Text;
        bool i = obj_bal.register_cs(obj_reg);
        if(i==true)
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Register Successful')</script>");
            clear();
        }
        else
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Register Failed')</script>");
        }
    }
    public void clear()
    {
        txt_fname.Text = "";
        txt_uid.Text = "";
        txt_passwd.Text = "";
        txt_Email.Text = "";
        txt_mobile.Text = "";
        txt_location.Text = "";

    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("User_login.aspx");
        clear();
    }
}