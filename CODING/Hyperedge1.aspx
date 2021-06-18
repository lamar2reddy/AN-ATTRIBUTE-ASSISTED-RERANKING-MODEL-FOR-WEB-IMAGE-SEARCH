<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hyperedge1.aspx.cs" Inherits="Hyperedge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server" onload="Init();">
    
    
    <link href="../../style/jcrop.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.Jcrop.js" type="text/javascript"></script>
    <script src="../../js/crop.js" type="text/javascript"></script>
    <script src="js/crop.js" type="text/javascript"></script>
    <script src="js/jquery.Jcrop.js" type="text/javascript"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
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
    </style>
    <div id="background_top">
        <center>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="Hyperedge_M_upload.aspx" CssClass="buttonClass" runat="server">Manual Hyperedge</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" CssClass="buttonClass" runat="server">Hyperedge</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" NavigateUrl="TreeStructure.aspx" CssClass="buttonClass" runat="server">Attribute TreeStructure</asp:HyperLink>
        </center>
    </div>
    <%--Script end--%>
    <div>
        <p align="center">
        Enter Image Name:<asp:TextBox ID="TxtImgName" runat="server" placeholder="Image Name"></asp:TextBox>
        <asp:FileUpload ID="FileUpload_AIA_Img" runat="server" />
        <asp:Button ID="Btn_Img_Upload" runat="server" OnClick="Btn_Img_Upload_Click" Text="Upload Image" />
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
                    <input type="text" size="4" id="x1" name="x1" class="coor" readonly="readonly" />
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
                <asp:Button runat="server" ID="btnCrop" OnClick="btnCrop_Click" Text="Crop" OnClientClick="return ValidateSelected();" />
            </td>
            <td>
                <div style="width: 440px; height: 440px; overflow: auto; padding: 10px; margin-bottom: 5px;">
                    <img id="Img1" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text1" placeholder="Attribute1" />
                    <br />
                    <img id="Img2" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text2" placeholder="Attribute2" />
                    <br />
                    <img id="Img3" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text3" placeholder="Attribute3" />
                    <br />
                    <img id="Img4" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text4" placeholder="Attribute4" />
                    <br />
                    <img id="Img5" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text5" placeholder="Attribute5" />
                    <br />
                    <img id="Img6" runat="server" height="50" width="50" />
                    <input type="text" runat="server" id="Text6" placeholder="Attribute6" />
                    <br />
                </div>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:Button ID="Btn_UploadtoDB" runat="server" Text="Upload To Db" OnClick="Btn_UploadtoDB_Click" />
        <asp:Button ID="Btn_Clear" runat="server" Text="Clear" OnClick="Btn_Clear_Click" />
    </div>
    <div>
        <p align="center" style="color: #FF6666">
            &copy; Copyrights 2014 Reserved</p>
    </div>
    </div>
</asp:Content>

