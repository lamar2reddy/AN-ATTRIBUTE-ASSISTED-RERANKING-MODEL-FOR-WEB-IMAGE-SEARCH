using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

public class BALProcess : DataMember
{
    DALProcess obj_dal = new DALProcess();

    public List<string> m1(string Prefix, int count)
    {
        return obj_dal.m1(Prefix, count);
    }
                                           // Upload new images Logic
    public bool Upload_Image(DataMember obj_dm)
    {
        return obj_dal.HyperedgeImageUpload(obj_dm); 
    }
                                           // Search Images Logic
    public DataSet SearchImage(DataMember obj_bo)
    { 
        return obj_dal.SearchImage(obj_bo);
    }

    public DataSet ViewAIA(DataMember obj_dm)
    {
        return obj_dal.View_HyperImages(obj_dm);
    }
                                         // Tree Images Upload logic
    internal bool Treesem_Upload_Image(DataMember obj_dm)
    {
        return obj_dal.SemanticImageUpload(obj_dm);
    }

    public DataSet ViewTreeSem(DataMember obj_dm)
    { 
        return obj_dal.View_SemanticImages(obj_dm);
    }


    public DataSet AttrSearchImage(DataMember obj_bo)
    {
        return obj_dal.AttrSearchImage(obj_bo);
    }
    public DataTable chart_bal()
    {
        return obj_dal.chart_dal();
    }

    public DataSet SemanticSearchImage(DataMember obj_bo)
    { 
        return obj_dal.SemanticSearchImage(obj_bo); 
    }
                                           // User Registration Logic
    public bool register_cs(Register obj_reg)
    {
        return obj_dal.register_dal(obj_reg);
    }
                                         // User Login Logic
    public bool login_cs(Register obj_log)
    {
        return obj_dal.Login_dal(obj_log);
    }
    public DataSet AttrCount_bal()
    {
        return obj_dal.AttrCount_dal();
    }

    public DataSet AttributeList_bal()
    {
        return obj_dal.Attributelist_dal();
    }
}

