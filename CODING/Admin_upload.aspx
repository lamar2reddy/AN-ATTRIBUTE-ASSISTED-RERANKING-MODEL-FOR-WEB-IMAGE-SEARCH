<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_upload.aspx.cs" Inherits="Admin_upload" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        
    </style>
    
    <center>
         <div>
        <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images_png/category.png" runat="server" Height="38px" OnClick="ImageButton1_Click"></asp:ImageButton>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images_png/imagetable.png" runat="server" Height="37px" OnClick="ImageButton2_Click"></asp:ImageButton>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images_png/attribute.png" runat="server" Height="37px" OnClick="ImageButton3_Click"></asp:ImageButton>
    </div>
    <br />
        <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
            <asp:View ID="View1" runat="server">
                <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Image Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_imagename" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Image File"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click"></asp:Button>
                <asp:Button ID="Button2" runat="server" Text="sampledb" OnClick="Button2_Click"></asp:Button>
            </td>
        </tr>
    </table>
            </asp:View>
                                                 <%--category chart--%>
           <asp:View ID="View2" runat="server">
               <asp:Button ID="Button3" runat="server" Text="View Category" OnClick="Button3_Click"></asp:Button>
               <br />
               <asp:Chart ID="Chart1" runat=server><Series><asp:Series Name="Series1" YValuesPerPoint="2"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas></asp:Chart>
           
           </asp:View>
                                                  <%--image name chart--%>
                <asp:View ID="View3" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:Button ID="Button4" runat="server" Text="Attr Count" OnClick="Button4_Click"></asp:Button>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                        </ContentTemplate></asp:UpdatePanel>
                </asp:View>
                                       <%--attribute image chart--%>
            <asp:View ID="View4" runat="server">
                <asp:Button ID="Button5" runat="server" Text="View Result" OnClick="Button5_Click"></asp:Button>
                <br />
                <asp:Panel ID="Panel1"  ScrollBars="Both" runat="server">
                    <asp:GridView ID="GridView2" runat="server">

                </asp:GridView>
                </asp:Panel>
                <br />
            </asp:View>
        </asp:MultiView>
    
        </center>
</asp:Content>

