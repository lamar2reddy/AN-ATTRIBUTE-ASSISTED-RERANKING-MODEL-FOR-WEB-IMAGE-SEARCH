<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User_UploadPage.aspx.cs" Inherits="User_UploadPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
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
    <div id="background_top">
        <center>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="Hyperedge_M_upload.aspx" Font-Size="X-Large" CssClass="buttonClass" runat="server">Manual Hyperedge</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" CssClass="buttonClass" Font-Size="X-Large" runat="server">Hyperedge</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" NavigateUrl="TreeStructure.aspx" CssClass="buttonClass" Font-Size="X-Large" runat="server">Attribute TreeStructure</asp:HyperLink>
        </center>
        
    </div>
   
</asp:Content>

