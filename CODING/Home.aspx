<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <%--CSS SCRIPTING LANGUAGE END--%>
    <style>
        .buttonClass {
            padding: 2px 20px;
            text-decoration: none;
            border: solid 2px Green;
        }

            .buttonClass:hover {
                background-color: Blue;
                cursor: pointer;
            }

        #bar {
            padding: 10px;
            margin: 0 0 20px 0;
            font-size: 15px;
            color: #cbc750;
            background: url(images/templatemo_h1_bg.jpg);
            border-radius: 30px;
        }
    </style>
    <%--USER SEARCH ENGINE CODING--%>
    <div id="bar">

        <center>     
      <asp:Label ID="Label1" runat="server" Text="Search" Font-Size="Larger"></asp:Label>&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="26px" Width="522px"></asp:TextBox>
            
            <asp:LinkButton ID="LinkButton1" Font-Bold="true" ForeColor="#ffff00" BackColor="#663300" runat="server" CssClass="blink" >Click here</asp:LinkButton>
      </center>

    </div>

    <%--SEARCH BUTTON CODING--%>
    <div>
        <center>
            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/s4.png" runat="server" Height="36px" OnClick="ImageButton1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/s5.png" runat="server" Height="36px" OnClick="ImageButton2_Click" />
        <br />    <br />
        <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/s6.png" runat="server" Height="33px" OnClick="ImageButton3_Click" />
             </center>
    </div>

</asp:Content>

