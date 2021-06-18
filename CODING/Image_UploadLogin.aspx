<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Image_UploadLogin.aspx.cs" Inherits="Image_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
        <table border="1" style="border-color:#070606" cellspacing="10" cellpadding="10">
            <tr>
                <td colspan="2" style="text-align:center">
                    <h3>Admin Login</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="User Name"></asp:Label>
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
                <td>
                    <asp:Button ID="btn_login" Font-Size="Large" runat="server" Text="Login" OnClick="btn_login_Click" ></asp:Button>
                </td>
                <td>
                    <asp:Button ID="btn_cancel" Font-Size="Large" runat="server" Text="Cancel"></asp:Button>
                    </td>
            </tr>
        </table>
    </center>
</asp:Content>

