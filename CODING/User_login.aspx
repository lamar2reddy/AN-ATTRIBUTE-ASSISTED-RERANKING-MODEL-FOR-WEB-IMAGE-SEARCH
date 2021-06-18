<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User_login.aspx.cs" Inherits="User_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
        <div>
        <table style="border-style:dotted" cellspacing="15" cellpadding="15">
            <tr>
                <td style="text-align:center" colspan="2">
                    <h3>User Login</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="User ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_uid" Font-Size="Large" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" Font-Size="Large" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_password" Font-Size="Large" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Button ID="Button1" runat="server" Font-Size="Large" Text="Login" OnClick="Button1_Click"></asp:Button>
                </td>
                <td style="text-align:center">
                    <asp:HyperLink ID="HyperLink1" Font-Size="Large" NavigateUrl="~/User_Registration.aspx" ForeColor="LawnGreen" runat="server">New User !!!</asp:HyperLink>
                    
                </td>
            </tr>
        </table>
            </div>
    </center>
</asp:Content>

