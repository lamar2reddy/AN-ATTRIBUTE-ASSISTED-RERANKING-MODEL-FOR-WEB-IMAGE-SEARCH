<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Testing.aspx.cs" Inherits="Testing" %>

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
        <div style="float:right">
            <asp:LinkButton ID="link_signout" ForeColor="#66ff33" Font-Bold="true" runat="server" OnClick="link_signout_Click">Logout</asp:LinkButton>
        </div>
        <center>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="Hyperedge_M_upload.aspx" Font-Size="Large" CssClass="buttonClass" runat="server">Manual Hyperedge</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" NavigateUrl="Hyperedge.aspx" Font-Size="Large" CssClass="buttonClass" runat="server">Hyperedge</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" NavigateUrl="TreeStructure.aspx" Font-Size="Large" CssClass="buttonClass" runat="server">Attribute TreeStructure</asp:HyperLink>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" Font-Size="Large" runat="server" OnClick="LinkButton1_Click">Refresh</asp:LinkButton>
        </center>
    </div>
</asp:Content>

