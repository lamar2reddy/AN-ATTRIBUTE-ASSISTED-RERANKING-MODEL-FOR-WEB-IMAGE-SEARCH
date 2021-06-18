using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class DataMember
{
    public int ImgSize { get; set; }
    public string ImgName { get; set; }
    public string ImgType { get; set; }
    public byte[] OrgImg { get; set; }
    public byte[] Img1 { get; set; }
    public byte[] Img2 { get; set; }
    public byte[] Img3 { get; set; }
    public byte[] Img4 { get; set; }
    public byte[] Img5 { get; set; }
    public byte[] Img6 { get; set; }
    public string[] Attr { get; set; }
    public string SearchText { get; set; }
    public int Hashvalue { get; set; }
    public string Imgclass { get; set; }
    public string ImgMidclass { get; set; }
    public int SearchMode { get; set; }
    public string category1 { get; set; }
}

public class DataMember_Auth
{
    public string EMail { get; set; }
    public string Pass { get; set; }
    public string NewPass { get; set; }
}
public class Register
{
 
    public string name { get; set; }

    public string userid { get; set; }

    public string password { get; set; }

    public string gender { get; set; }
 
    public string email { get; set; }

    public Int64 mobile { get; set; }

    public string location { get; set; }
}
