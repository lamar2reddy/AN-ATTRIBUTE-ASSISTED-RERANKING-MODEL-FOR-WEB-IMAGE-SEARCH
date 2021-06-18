<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User_Search.aspx.cs" Inherits="User_Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   <style>
       .buttonClass
{
    padding: 2px 20px;
    text-decoration: none;
    border: solid 2px Green;
}
.buttonClass:hover
{
    background-color: Blue;
    cursor:pointer;
}
#bar{
    padding: 10px;
	margin: 0 0 20px 0;
	font-size: 15px;
	color: #cbc750;
	background: url(images/templatemo_h1_bg.jpg);
    border-radius: 30px;
}

   </style>
    
    <asp:HyperLink ID="HyperLink1" NavigateUrl="Augment_upload.aspx" CssClass="buttonClass" runat="server">Manual Hyperedge</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Hyperedge_upload.aspx" CssClass="buttonClass" runat="server">Hyperedge</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" CssClass="buttonClass" runat="server">Attribute Search</asp:HyperLink>
    
    <div id="bar">
        
        <center>     
      <asp:Label ID="Label1" runat="server" Text="Search" Font-Size="Larger"></asp:Label>&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="26px" Width="522px"></asp:TextBox>
            
            <asp:LinkButton ID="LinkButton1" Font-Bold="true" ForeColor="#ffff00" BackColor="#663300" runat="server" CssClass="blink" OnClick="LinkButton1_Click">Click here</asp:LinkButton>
      </center>
        
    </div>

    <div>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" CellPadding="5"  Width="684px" style="text-align: center;" BorderColor="#006600">
                     
                    <ItemTemplate>
                       
                    <asp:Image ID="im" runat="server" ImageUrl='<%# imgs(Eval("ImageFile")) %>' Width="150" />
                    <br />
                    
                    <asp:LinkButton ID="lm" runat="server"  Text="Download" CommandName="buy"  CommandArgument='<%# Eval("ImageName") + "," +  Eval("ImageFile") %>'  />
                    
                    </ItemTemplate>
                     <ItemStyle BorderColor="#FF9900" BorderStyle="dotted" BorderWidth="3px" HorizontalAlign="Center"
                       VerticalAlign="Bottom" />
                    
                    </asp:DataList>
    </div>
    
</asp:Content>


