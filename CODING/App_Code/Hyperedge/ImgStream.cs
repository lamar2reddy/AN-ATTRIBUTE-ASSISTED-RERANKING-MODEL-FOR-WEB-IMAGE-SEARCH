using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

public class ImgStream
{
    BALProcess obj_bal = new BALProcess();
    DataMember obj_dm = new DataMember();
    public bool ImgUpload_frm_Folder(Local_DataMember obj_locdm)
    {
        try
        {
            string[] OrgFile = Directory.GetFiles(obj_locdm.OrgImgPath);
            string[] CropFiles = Directory.GetFiles(obj_locdm.CropImgPath);
            string ImgNam = Path.GetFileName(OrgFile[0]);

            FileStream fs = new FileStream(OrgFile[0], FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            FileInfo fi = new FileInfo(CropFiles[0]);
            fs.Close();

            obj_dm.OrgImg = bytes;
            obj_dm.ImgName = Path.GetFileNameWithoutExtension(OrgFile[0]);
            obj_dm.ImgSize = Convert.ToInt32(fi.Length);
            obj_dm.ImgType = Path.GetExtension(OrgFile[0]);

            fs = new FileStream(CropFiles[0], FileMode.Open, FileAccess.Read);
            br = new BinaryReader(fs);
            bytes = br.ReadBytes((Int32)fs.Length);
            obj_dm.Img1 = bytes;
            fs.Close();

            fs = new FileStream(CropFiles[1], FileMode.Open, FileAccess.Read);
            br = new BinaryReader(fs);
            bytes = br.ReadBytes((Int32)fs.Length);
            obj_dm.Img2 = bytes;
            fs.Close();

            fs = new FileStream(CropFiles[2], FileMode.Open, FileAccess.Read);
            br = new BinaryReader(fs);
            bytes = br.ReadBytes((Int32)fs.Length);
            obj_dm.Img3 = bytes;
            fs.Close();

            fs = new FileStream(CropFiles[3], FileMode.Open, FileAccess.Read);
            br = new BinaryReader(fs);
            bytes = br.ReadBytes((Int32)fs.Length);
            obj_dm.Img4 = bytes;
            fs.Close();

            fs = new FileStream(CropFiles[4], FileMode.Open, FileAccess.Read);
            br = new BinaryReader(fs);
            bytes = br.ReadBytes((Int32)fs.Length);
            obj_dm.Img5 = bytes;
            fs.Close();

            fs = new FileStream(CropFiles[5], FileMode.Open, FileAccess.Read);
            br = new BinaryReader(fs);
            bytes = br.ReadBytes((Int32)fs.Length);
            obj_dm.Img6 = bytes;
            fs.Close();

            obj_dm.Attr = obj_locdm.Attrs;
            obj_dm.category1 = obj_locdm.categoryy;
            bool r = obj_bal.Upload_Image(obj_dm);
            if (r)
            {
                return true;
            }
            else
                return false;
        }
        catch
        {
            return false;
        }
    }


    public bool TreeSem_ImgUpload_frm_Folder(Local_DataMember obj_locdm)
    {
        try
        {
            string[] OrgFile = Directory.GetFiles(obj_locdm.OrgImgPath);
            string ImgNam = Path.GetFileName(OrgFile[0]);

            FileStream fs = new FileStream(OrgFile[0], FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            FileInfo fi = new FileInfo(OrgFile[0]);
            fs.Close();

            obj_dm.OrgImg = bytes;
            obj_dm.ImgName = Path.GetFileNameWithoutExtension(OrgFile[0]);
            obj_dm.ImgSize = Convert.ToInt32(fi.Length);
            obj_dm.ImgType = Path.GetExtension(OrgFile[0]);

            obj_dm.Attr = obj_locdm.Attrs;
           
            obj_dm.Imgclass = obj_locdm.Imgclass;
            obj_dm.ImgMidclass = obj_locdm.ImgMidclass;

            bool r = obj_bal.Treesem_Upload_Image(obj_dm);
            if (r)
            {
                return true;
            }
            else
                return false;
        }
        catch
        {
            return false;
        }
    }
}

public class Local_DataMember
{
    public string Imgclass { get; set; }
    public string ImgMidclass { get; set; }
    public string[] Attrs { get; set; }
    public string OrgImgPath { get; set; }
    public string CropImgPath { get; set; }

    public string categoryy { get; set; }
}