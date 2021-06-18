<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User_Registration.aspx.cs" Inherits="User_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
    <CENTER> <div><h3>REGISTRATION PAGE</h3></div>
    <table border="1" style="border-color:#e524ed" cellspacing="10" cellpadding="10">
        <tr>
            <td>
                <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_fname" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Font-Size="Large" runat="server" ErrorMessage="Enter Name" ControlToValidate="txt_fname" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="Label3" Font-Size="Large" runat="server" Text="User ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_uid" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Font-Size="Large" runat="server" ErrorMessage="Enter User ID" ControlToValidate="txt_uid" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_passwd" TextMode="Password" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Size="Large" Text="Re-Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_repass" TextMode="Password" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Font-Size="Large" ErrorMessage="Password Mismatch" ControlToCompare="txt_passwd" ControlToValidate="txt_repass" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Gender"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="RadioButton1" GroupName="gen" Font-Size="Large" Text="Male" runat="server" />
                <asp:RadioButton ID="RadioButton2" GroupName="gen" Font-Size="Large" Text="FeMale" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Size="Large" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_Email" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Font-Size="Large" runat="server" ErrorMessage="Enter Valid Email"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_Email" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Size="Large" Text="Mobile"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_mobile" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Font-Size="Large" runat="server" ErrorMessage="Enter 10 digit Number" validationexpression="^[0-9]{10}$" ControlToValidate="txt_mobile" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Size="Large" Text="Location"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_location" Font-Size="Large" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Font-Size="Large" runat="server" ErrorMessage="Enter Location" ControlToValidate="txt_location" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Button ID="btn_submit" runat="server" Font-Size="Large" Text="Submit" OnClick="btn_submit_Click" />
            </td>
            <td style="text-align:center">
                <asp:Button ID="btn_cancel" runat="server" Font-Size="Large" Text="Cancel" OnClick="btn_cancel_Click" />
            </td>
        </tr>
        
    </table>
        </CENTER>
</asp:Content>

