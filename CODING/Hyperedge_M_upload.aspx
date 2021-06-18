<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hyperedge_M_upload.aspx.cs" Inherits="Hyperedge_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <link href="../../style/jcrop.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.Jcrop.js" type="text/javascript"></script>
    <script src="../../js/crop.js" type="text/javascript"></script>
    <%--javascript end--%>
    <%--scripting language--%>
    <style>
        .buttonClass
{
    padding: 2px 20px;
    text-decoration: none;
    /*border: solid 2px Green;*/
}
.buttonClass:hover
{
    background-color: Blue;
    cursor:pointer;
}
        #background_top{
    padding: 10px;
	margin: 0 0 20px 0;
	font-size: 15px;
	color: #cbc750;
	background: url(images/templatemo_h1_bg.jpg);
    border-radius: 30px;
}

    </style>
  <%--  script end--%>
   
        <%--<uc:Menu ID="Menu1" runat="server" />--%>
        
   <%--<div id="background_top">
        <center>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="Hyperedge_M_upload.aspx" CssClass="buttonClass" runat="server">Manual Hyperedge</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" CssClass="buttonClass" runat="server">Hyperedge</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" NavigateUrl="TreeStructure.aspx" CssClass="buttonClass" runat="server">Attribute TreeStructure</asp:HyperLink>
        </center>
    </div>--%>
    <asp:Button ID="Button1" runat="server" Font-Size="Large" Text="Back" OnClick="Button1_Click" />
    <br />
    <p align="center">
       
        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text=" Enter Image Name:"></asp:Label>
        <asp:TextBox ID="TxtImgName" runat="server" Font-Size="Large" placeholder="Image Name"></asp:TextBox>
        <asp:FileUpload ID="FileUpload_AIA_Img" Font-Size="Large" runat="server" />
        <asp:Button ID="Btn_Img_Upload" runat="server" OnClick="Btn_Img_Upload_Click" Text="Upload Image" />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btn_refresh" ImageUrl="~/Images_png/refresh.jpg" runat="server" Height="20px"  Width="42px" OnClick="btn_refresh_Click"></asp:ImageButton>     
   
        <br />

        <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Category :"></asp:Label>
        <asp:DropDownList ID="DropDownList1" Font-Size="Large" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>--SELECT--</asp:ListItem>
            <asp:ListItem>Birds</asp:ListItem>
            <asp:ListItem>Animals</asp:ListItem>
            <asp:ListItem>Flowers</asp:ListItem>
            <asp:ListItem>Nature</asp:ListItem>
            <asp:ListItem>Human</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:DropDownList>
    </p>
   
        
      
    <br />
    <br />
    <table width="100%">
        <tr>
            <td align="center">
                <div style="width: 450px; height: 450px; overflow: auto;" id="imgContainer">
                    <img id="originalImage" runat="server" width="400" height="395" />
                </div>
                
                <div>
                </div>
            </td>
            <td>
                <asp:ImageButton ID="btnCrop" ImageUrl="~/images/cropimage.jpg" runat="server" Height="34px" Width="70px" OnClick="ImageButton1_Click" />
            </td>
            <td>
                <div style="width: 440px; height: 440px; overflow: auto; padding: 10px; margin-bottom: 5px;">
                    <img id="Img1" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text1" placeholder="Hyperedge1" />
                 
                    <img id="Img2" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text2" placeholder="Hyperedge2" />
                    <br /><br />
                    <img id="Img3" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text3" placeholder="Hyperedge3" />
                  
                    <img id="Img4" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text4" placeholder="Hyperedge4" />
                    
                    <br /><br />
                    <img id="Img5" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text5" placeholder="Hyperedge5" />
                   
                    <img id="Img6" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text6" placeholder="Hyperedge6" />
                    <br /><br /><br /><br /><br /><br />
                    <center>
                    <asp:ImageButton ID="Btn_UploadtoDB" ImageUrl="~/images/save.jpg" runat="server" Height="41px" Width="125px" OnClick="ImageButton2_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/clear-button-hi.png" runat="server" Height="41px" Width="125px" OnClick="ImageButton3_Click" />
                        </center>
                </div>
            </td>
            
        </tr>
        
    </table>
    
        
    
    <div align="center">
    </div>
    <div>
        <p align="center" style="color: #FF6666">
            &copy;Thank You</p>
    </div>

</asp:Content>

