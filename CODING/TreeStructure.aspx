<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TreeStructure.aspx.cs" Inherits="TreeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
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
    </style>                                        <%--Script menu end--%>

    <%--<div id="background_top">
        <center>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="Hyperedge_M_upload.aspx" CssClass="buttonClass" runat="server">Manual Hyperedge</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" CssClass="buttonClass" runat="server">Hyperedge</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" NavigateUrl="TreeStructure.aspx" CssClass="buttonClass" runat="server">Attribute TreeStructure</asp:HyperLink>
        </center>
    </div>--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
    <%--main coding--%>
    <center>
    <div>
    <p align="center">
        
        <asp:FileUpload ID="FileUpload_AIA_Img" runat="server" />
        <asp:Button ID="Btn_Img_Upload" runat="server" OnClick="Btn_Img_Upload_Click" Text="Upload Image" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images_png/refresh.jpg" runat="server" Height="20px" OnClick="ImageButton1_Click1" Width="42px"></asp:ImageButton>     
    </p>
    <br />
    <br />
    <table width="100%">
        <tr>
            <td align="center">
                <div style="width: 450px; height: 450px; overflow: auto;" id="imgContainer">
                    <img id="originalImage" runat="server" width="400" height="395" />
                </div>
            </td>
            <td><center>
                <div style="width: 540px; height: 440px; overflow: auto; padding: 10px; margin-bottom: 5px;">
                    <asp:Label ID="Label1" runat="server" Text="Class" CssClass="Label"></asp:Label>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <asp:DropDownList ID="Ddl_Classes" runat="server" Width="50%" OnSelectedIndexChanged="Ddl_Classes_SelectedIndexChanged"
                        AutoPostBack="True">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Animal</asp:ListItem>
                        <asp:ListItem>Bird</asp:ListItem>
                        <asp:ListItem>Flower</asp:ListItem>
                        <asp:ListItem>Human</asp:ListItem>
                        <asp:ListItem>Vechicle</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Mid-Class" CssClass="Label"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="50%">
                    </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Sub-Class" CssClass="Label"></asp:Label>
                    <br />
                    <asp:TextBox ID="TxtImgName" runat="server" placeholder="Enter image Name here..."
                        Width="50%"></asp:TextBox>
                    <br /><br /><br /><br />
                    <asp:Label ID="Label4" runat="server" Text="Attributes" CssClass="Label"></asp:Label>
                    <br />
                    <input type="text" runat="server" id="Text1" placeholder="Sub 1" />
                    <br /><br />
                    <input type="text" runat="server" id="Text2" placeholder="Sub 2" />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" runat="server" id="Text3" placeholder="Sub 3" />
                    <br /><br />
                    <input type="text" runat="server" id="Text4" placeholder="Sub 4" />
                 &nbsp;&nbsp;
                    <input type="text" runat="server" id="Text5" placeholder="Sub 5" />
              &nbsp;&nbsp;
                    <input type="text" runat="server" id="Text6" placeholder="Sub 6" />
                    <br /><br />
                    <br />
                    <br />
                    <asp:ImageButton ID="Btn_UploadtoDB" ImageUrl="~/images/upload-button-hi.png" Height="32px" Width="125px" runat="server" OnClick="ImageButton1_Click"></asp:ImageButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/clear-button-hi.png" Height="32px" Width="125px" runat="server" OnClick="ImageButton2_Click"></asp:ImageButton>
                </div></center>
            </td>
        </tr>
    </table>
    </div>
        </center>
    
</asp:Content>

