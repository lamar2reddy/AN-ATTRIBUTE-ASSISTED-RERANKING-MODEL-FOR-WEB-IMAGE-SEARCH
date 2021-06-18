<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Z_TreeSearch.aspx.cs" Inherits="Z_TreeSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
        function Val() {
            if (document.getElementById("<%=TxtSearch.ClientID%>").value == '') {
                return (false);
            }
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div align="center" style="width: 100%">
        <div align="justify" style="width: 90%">
            <h1 style="color: #808000;">
                Structured Search</h1>
            <p>
                <asp:TextBox ID="TxtSearch" runat="server" Width="50%" Font-Size="Medium" Height="30px"></asp:TextBox>
               <asp:ImageButton ID="BtnAugmentSearch" ImageUrl="~/images/search.jpg" runat="server" Height="34px" OnClientClick="return Val();" OnClick="ImageButton2_Click" Width="113px" />
                    
                <asp:Button ID="BtnAugmentSearch1" runat="server" Text="Tree Semantic Search" OnClientClick="return Val();"
                    OnClick="BtnAugmentSearch_Click" />&nbsp;</p>
            <p style="color: #0000FF; font-style: italic">
                <asp:Label ID="Lbl_NotFound" runat="server" Text="Oops! The Searched Image was Not Found..."
                    Visible="false"></asp:Label></p>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%#Img(Eval("Picture")) %>'
                                    Width="240px" Height="200px" CommandArgument='<%#Eval("HashValue") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>

