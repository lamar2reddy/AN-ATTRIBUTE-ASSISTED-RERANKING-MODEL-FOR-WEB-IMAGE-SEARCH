using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public class DALProcess
{
    ConnectionString obj_con = new ConnectionString();
    public List<string> m1(string PrefixText, int count)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        List<string> Imagename = new List<string>();
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_AutoExtender", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PrefixText", PrefixText);
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    Imagename.Add(dr["ImageNames"].ToString());
                }

            }
            con.Close();
            return Imagename;
        }
        catch
        {
            return Imagename;
        }
    }

                       // Image uploading
    public bool HyperedgeImageUpload(DataMember obj_dm)
    {
       // Local_DataMember l = new Local_DataMember();
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        try
        {                  //wait
            SqlCommand cmd = new SqlCommand("Sp_HyperImageUpload", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Imgname", obj_dm.ImgName);
            cmd.Parameters.AddWithValue("@OrgImg", obj_dm.OrgImg);
            cmd.Parameters.AddWithValue("@Img1", obj_dm.Img1);
            cmd.Parameters.AddWithValue("@Img2", obj_dm.Img2);
            cmd.Parameters.AddWithValue("@Img3", obj_dm.Img3);
            cmd.Parameters.AddWithValue("@Img4", obj_dm.Img4);
            cmd.Parameters.AddWithValue("@Img5", obj_dm.Img5);
            cmd.Parameters.AddWithValue("@Img6", obj_dm.Img6);
            cmd.Parameters.AddWithValue("@Size", obj_dm.ImgSize);
            cmd.Parameters.AddWithValue("@Type", obj_dm.ImgType);
            cmd.Parameters.AddWithValue("@Attr1", obj_dm.Attr[0]);
            cmd.Parameters.AddWithValue("@Attr2", obj_dm.Attr[1]);
            cmd.Parameters.AddWithValue("@Attr3", obj_dm.Attr[2]);
            cmd.Parameters.AddWithValue("@Attr4", obj_dm.Attr[3]);
            cmd.Parameters.AddWithValue("@Attr5", obj_dm.Attr[4]);
            cmd.Parameters.AddWithValue("@Attr6", obj_dm.Attr[5]);
            cmd.Parameters.AddWithValue("@category",obj_dm.category1);
            con.Open();
            int r = cmd.ExecuteNonQuery();
            if (r > 0)
                return true;
            else
                return false;
        }
        catch
        {
            return false;
        }
        finally
        {
            con.Close();
        }

    }
                      // user search image
    internal DataSet SearchImage(DataMember obj_bo)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_SearchImage2", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SearchText", obj_bo.SearchText);
            cmd.Parameters.AddWithValue("@Mode", obj_bo.SearchMode);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }
                     // views the image results
    internal DataSet View_HyperImages(DataMember obj_dm)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_UserView_HyperImages", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@HashValue", obj_dm.Hashvalue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }

                     // user upload image
    internal bool SemanticImageUpload(DataMember obj_dm)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_TreeImageUpload", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Imgname", obj_dm.ImgName);
            cmd.Parameters.AddWithValue("@OrgImg", obj_dm.OrgImg);
            cmd.Parameters.AddWithValue("@MidClass", obj_dm.ImgMidclass);
            cmd.Parameters.AddWithValue("@Class", obj_dm.Imgclass);
            cmd.Parameters.AddWithValue("@Size", obj_dm.ImgSize);
            cmd.Parameters.AddWithValue("@Type", obj_dm.ImgType);
            cmd.Parameters.AddWithValue("@Attr1", obj_dm.Attr[0]);
            cmd.Parameters.AddWithValue("@Attr2", obj_dm.Attr[1]);
            cmd.Parameters.AddWithValue("@Attr3", obj_dm.Attr[2]);
            cmd.Parameters.AddWithValue("@Attr4", obj_dm.Attr[3]);
            cmd.Parameters.AddWithValue("@Attr5", obj_dm.Attr[4]);
            cmd.Parameters.AddWithValue("@Attr6", obj_dm.Attr[5]);
            con.Open();
            int r = cmd.ExecuteNonQuery();
            if (r > 0)
                return true;
            else
                return false;
        }
        catch
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    internal DataSet View_SemanticImages(DataMember obj_dm)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_UserView_TreeImages", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@HashValue", obj_dm.Hashvalue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }
                        // Registration Coding.....
    internal bool register_dal(Register obj_reg)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        try 
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Sp_register", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", obj_reg.name);
            cmd.Parameters.AddWithValue("@user_ID", obj_reg.userid);
            cmd.Parameters.AddWithValue("@Password", obj_reg.password);
            cmd.Parameters.AddWithValue("@Gender", obj_reg.gender);
            cmd.Parameters.AddWithValue("@Email", obj_reg.email);
            cmd.Parameters.AddWithValue("@Mobile", obj_reg.mobile);
            cmd.Parameters.AddWithValue("@Location", obj_reg.location);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
        finally
        {
            con.Close();
        }
        
    }
   
                       // User Login Coding.....
    internal bool Login_dal(Register obj_reg)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Sp_login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_ID", obj_reg.userid);
            cmd.Parameters.AddWithValue("@Password", obj_reg.password);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }
    
    
                      // Attribue image Search
    internal DataSet AttrSearchImage(DataMember obj_bo)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_AttributeSearchImage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SearchText", obj_bo.SearchText);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }


    internal DataSet SemanticSearchImage(DataMember obj_bo)
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        List<string> SemanticWords = new List<string>();
        try
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT ImageNames FROM dbo.ImageNames WHERE SemanticWords like '" + obj_bo.SearchText + "'+'%'", con);
            SqlDataReader reader = cmd1.ExecuteReader();
            DataTable schemaTable = reader.GetSchemaTable();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    SemanticWords.Add((string)reader["ImageNames"]);
                }
            }
            con.Close();
            con.Open();
            foreach (string searchword in SemanticWords)
            {
                SqlCommand cmd = new SqlCommand("stp_SemanticSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SearchText", searchword);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }
            return ds;
        }
        catch
        {
            return ds;
        }
    }
                       // chart coding 
    public DataTable chart_dal()
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataTable ds = new DataTable();
        try
        {
            SqlCommand cmd = new SqlCommand("select category, count(*) from ImageNames group by category", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }
    public DataSet attrchart_dal()
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("select category, count(*) from ImageNames group by category", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }

    public DataSet AttrCount_dal()
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("select Attribute_Name, count(*) Total_Images from (select Attr1 as Attribute_Name from [Hperedge_Attributes] union all select Attr2 from [Hperedge_Attributes] union all select Attr3 from [Hperedge_Attributes] union all select Attr4 from [Hperedge_Attributes] union all select Attr5 from [Hperedge_Attributes] union all select Attr6 from [Hperedge_Attributes]) d group by Attribute_Name order by Total_Images desc", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@Attr1", DBNull.Value);
            //cmd.Parameters.AddWithValue("@Attr2", DBNull.Value);
            //cmd.Parameters.AddWithValue("@Attr3", DBNull.Value);
            //cmd.Parameters.AddWithValue("@Attr4", DBNull.Value);
            //cmd.Parameters.AddWithValue("@Attr5", DBNull.Value);
            //cmd.Parameters.AddWithValue("@Attr6", DBNull.Value);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }

    public DataSet Attributelist_dal()
    {
        string constr = obj_con.Connstring;
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from TreeAttributes", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            return ds;
        }
        catch
        {
            return ds;
        }
    }
}

