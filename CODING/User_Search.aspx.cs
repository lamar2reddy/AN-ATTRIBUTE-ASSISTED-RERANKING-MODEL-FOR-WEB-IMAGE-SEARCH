using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;

public partial class User_Search : System.Web.UI.Page
{
    Service1Client sc1 = new Service1Client();
    protected void Page_Load(object sender, EventArgs e)
    {
        //DataList1.DataSource = sc1.datalistview_cs();
        //DataList1.DataBind();
    }
    public string imgs(object st)
    {
        byte[] ty = (byte[])st;
        string s = Convert.ToBase64String(ty);
        string ss = "data:image/png;base64," + s;
        return ss;

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}