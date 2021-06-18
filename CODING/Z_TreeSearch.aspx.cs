using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Z_TreeSearch : System.Web.UI.Page
{
    BALProcess obj_bal = new BALProcess();
    DataMember obj_bo = new DataMember();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                obj_bo.SearchText = Session["SEM"].ToString();
                obj_bo.SearchMode = 2;
                TxtSearch.Text = Session["SEM"].ToString();
                DataSet ds = new DataSet();
                ds = obj_bal.SearchImage(obj_bo);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Lbl_NotFound.Visible = false;
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                }
            }
            catch
            {
                DataList1.DataSource = null;
                DataList1.DataBind();
            }
        }
    }
    public string Img(object image)
    {
        byte[] bytes = (byte[])image;
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        return "data:image/png;base64," + base64String;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> ImageNames(string prefixText, int count)
    {
        List<string> ImageName = new List<string>();
        BALProcess obj_bal = new BALProcess();
        ImageName = obj_bal.m1(prefixText, count);
        return ImageName;
    }

    protected void BtnAugmentSearch_Click(object sender, EventArgs e)
    {
        try
        {
            obj_bo.SearchText = TxtSearch.Text;
            obj_bo.SearchMode = 2;
            DataSet ds = new DataSet();
            ds = obj_bal.SearchImage(obj_bo);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Lbl_NotFound.Visible = false;
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                DataList1.DataSource = null;
                DataList1.DataBind();
                Lbl_NotFound.Visible = true;
            }
        }
        catch (Exception Ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Exception", "alert('" + Ex.Message.ToString() + "');", true);
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Session["ImgID"] = e.CommandArgument.ToString();
        Response.Redirect("~/UserView/TreeView.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            obj_bo.SearchText = TxtSearch.Text;
            obj_bo.SearchMode = 2;
            DataSet ds = new DataSet();
            ds = obj_bal.SearchImage(obj_bo);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Lbl_NotFound.Visible = false;
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                DataList1.DataSource = null;
                DataList1.DataBind();
                Lbl_NotFound.Visible = true;
            }
        }
        catch (Exception Ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Exception", "alert('" + Ex.Message.ToString() + "');", true);
        }
    }
}