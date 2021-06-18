<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hyper_view.aspx.cs" Inherits="UserView_Hyper_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('http://localhost:2666/Images_png/wood1.jpg')">
    <form id="form1" runat="server">
        <div style="background-image: url('../Images_png/wood1.jpg')">
        <div style="font-size:xx-large;color:whitesmoke">
            Web Image Search
        </div>
        <br />
        <div style="float:right">
            <asp:Image ID="Image1" ImageUrl="~/Images_png/humming.GIF" runat="server" />
        </div>
        <br />
        <br />
        <div style="float:right">
        </div>
        <br />
    <div align="center">
        <div style="color:whitesmoke">
        <h1>Images With Attributes</h1>
            </div>
        <asp:DataList ID="DataList_AIA" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="Imag" runat="server" ImageUrl='<%#Img(Eval("Picture")) %>' Width="600"
                                Height="500" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Img(Eval("Img1")) %>' Width="150"
                                Height="100" />
                            <asp:Label ID="Label1" runat="server" Text='<%#(Eval("Attr1")) %>'></asp:Label>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%#Img(Eval("Img2")) %>' Width="150"
                                Height="100" />
                            <asp:Label ID="Label2" runat="server" Text='<%#(Eval("Attr2")) %>'></asp:Label>
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%#Img(Eval("Img3")) %>' Width="150"
                                Height="100" />
                            <asp:Label ID="Label3" runat="server" Text='<%#(Eval("Attr3")) %>'></asp:Label><br />
                            <br /><br />
                            <asp:Image ID="Image4" runat="server" ImageUrl='<%#Img(Eval("Img4")) %>' Width="150"
                                Height="100" />
                            <asp:Label ID="Label4" runat="server" Text='<%#(Eval("Attr4")) %>'></asp:Label>
                            <asp:Image ID="Image5" runat="server" ImageUrl='<%#Img(Eval("Img5")) %>' Width="150"
                                Height="100" />
                            <asp:Label ID="Label5" runat="server" Text='<%#(Eval("Attr5")) %>'></asp:Label>
                            <asp:Image ID="Image6" runat="server" ImageUrl='<%#Img(Eval("Img6")) %>' Width="150"
                                Height="100" />
                            <asp:Label ID="Label6" runat="server" Text='<%#(Eval("Attr6")) %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div> <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            </div>
    </form>
</body>
</html>
