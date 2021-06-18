<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Image_UploadAdmin.aspx.cs" Inherits="Image_UploadAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
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
             <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" Font-Size="X-Large" CssClass="buttonClass" runat="server">Hyperedge</asp:HyperLink>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:LinkButton ID="LinkButton1" Font-Size="X-Large" runat="server" OnClick="LinkButton1_Click">Refresh</asp:LinkButton>
         </center>
         </div>
</asp:Content>

