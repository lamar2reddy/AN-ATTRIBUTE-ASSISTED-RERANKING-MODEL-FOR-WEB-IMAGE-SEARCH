<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hyperedge.aspx.cs" Inherits="XXX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/jcrop.css" rel="stylesheet" type="text/css" />
    <link href="../../style/jcrop.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.Jcrop.js" type="text/javascript"></script>
    <script src="../../js/crop.js" type="text/javascript"></script>
</head>
<body onload="Init();" style="background-image: url('http://localhost:2666/images/img01.jpg')">
    <form id="form1" runat="server">
        <style>
        .buttonClass {
            padding: 2px 20px;
            text-decoration: none;
            /*border: solid 2px Green;*/
        }

            .buttonClass:hover {
                background-color: Blue;
                cursor: pointer;
            }

        #background_top {
            padding: 10px;
            margin: 0 0 20px 0;
            font-size: 15px;
            color: #cbc750;
            background: url(images/templatemo_h1_bg.jpg);
            border-radius: 30px;
        }
            #Text1 {
                height: 28px;
            }
            #Text2 {
                height: 24px;
            }
            #Text3 {
                height: 28px;
            }
            #Text4 {
                height: 26px;
            }
            #Text5 {
                height: 28px;
            }
            #Text6 {
                height: 27px;
            }
    </style>
    <%--<div id="background_top">
        <center>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="Hyperedge_M_upload.aspx" CssClass="buttonClass" Font-Size="Small" ForeColor="WhiteSmoke" Font-Bold="true" runat="server">Manual Hyperedge</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" CssClass="buttonClass" Font-Size="Small" ForeColor="WhiteSmoke" Font-Bold="true" runat="server">Hyperedge</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" NavigateUrl="TreeStructure.aspx" Font-Size="Small" ForeColor="WhiteSmoke" Font-Bold="true" CssClass="buttonClass" runat="server">Attribute TreeStructure</asp:HyperLink>
        </center>
    </div>--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="main_image" style="background-image: url('images/img01.jpg')">
        <asp:Button ID="Button1" Font-Size="X-Large" BackColor="Green" ForeColor="White" runat="server" Text="Back" OnClick="Button1_Click" />
            <asp:Button ID="btn_back2" Font-Size="X-Large" BackColor="Green" ForeColor="White" runat="server" Text="Back" OnClick="btn_back2_Click"  />
        <br />
    <div>
    <br />
    <p align="center">
        
        <asp:Label ID="Label2" Font-Size="Large" runat="server"  Text="Enter Image Name:"></asp:Label>
        <asp:TextBox ID="TxtImgName" Font-Size="Large" runat="server" placeholder="Image Name"></asp:TextBox>
        <asp:FileUpload ID="FileUpload_HP_Img" Font-Size="Large" runat="server" />
        <asp:Button ID="Btn_Img_Upload" Font-Size="Large" runat="server" OnClick="Btn_Img_Upload_Click" Text="Upload Image" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btn_refresh" ImageUrl="~/Images_png/refresh.jpg" runat="server" Height="20px"  Width="42px" OnClick="btn_refresh_Click"></asp:ImageButton>     
    
        <br />
        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Category :"></asp:Label>
        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" Font-Size="Large" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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
                    X1
                    <input type="text" size="4" id="x1" name="x1" class="coor" readonly="readonly" style="border-color: #FFFF00" />
                    Y1
                    <input type="text" size="4" id="y1" name="y1" class="coor" readonly="readonly" />
                    X2
                    <input type="text" size="4" id="x2" name="x2" class="coor" readonly="readonly" />
                    Y2
                    <input type="text" size="4" id="y2" name="y2" class="coor" readonly="readonly" />
                    W
                    <input type="text" size="4" id="w" name="w" class="coor" readonly="readonly" />
                    H
                    <input type="text" size="4" id="h" name="h" class="coor" readonly="readonly" />
                </div>
                <div>
                </div>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                <asp:Button runat="server" ID="btnCrop" OnClick="btnCrop_Click" ForeColor="Red" Text=">>" OnClientClick="return ValidateSelected();" />
               </ContentTemplate></asp:UpdatePanel>
                     <br />
                <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/cropimage.jpg" runat="server" Height="34px" Width="70px"   />
            </td>
            <td>
                <div style="width: 440px; height: 440px; overflow: auto; padding: 10px; margin-bottom: 5px;">
                    <img id="Img1" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text1" placeholder="Attribute1" />
                    
                    <img id="Img2" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text2" placeholder="Attribute2" />
                    <br />
                    <img id="Img3" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text3" placeholder="Attribute3" />
                   
                    <img id="Img4" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text4" placeholder="Attribute4" />
                    <br />
                    <img id="Img5" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text5" placeholder="Attribute5" />
                
                    <img id="Img6" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text6" placeholder="Attribute6" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <center>
                    <asp:ImageButton ID="Btn_UploadtoDB" ImageUrl="~/images/upload-button-hi.png" runat="server" Height="41px" Width="125px" OnClick="ImageButton2_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/clear-button-hi.png" runat="server" Height="41px" Width="125px" />
                        </center>
                </div>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:Button ID="Btn_UploadtoDB1" runat="server" Text="Upload To Db" OnClick="Btn_UploadtoDB_Click" />
        <asp:Button ID="Btn_Clear" runat="server" Text="Clear" OnClick="Btn_Clear_Click" />
    </div>
    <div>
        <p align="center" style="color: #FF6666; height: 260px;">
            &copy; ...</p>
    </div>

    </div>
            </div>
    </form>
</body>
</html>
