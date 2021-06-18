<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="UserView_TreeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .Clas
        {
            font-size: xx-large;
            color: Blue;
        }
        .MidClas
        {
            font-size: x-large;
            color: BlueViolet;
        }
        .SubClas
        {
            font-size: larger;
            color: Brown;
        }
        .Attr
        {
            font-size:x-large;
            color: Black;
        }
        .AttrBorders
        {
            border-style: solid dotted solid dotted;
            border-width: thin;
            border-color: #0000FF;
        }
        #s
        {
            padding:20px;
        }
    </style>
</head>
<body style="background-image: url('http://localhost:2666/Images_png/wood1.jpg')">
    <form id="form1" runat="server">
        <div style="background-image: url('../Images_png/wood1.jpg')">
        <div style="font-size:xx-large;color:whitesmoke">
            Web Image Search
        </div>
        <div style="float:right">
            <asp:Image ID="Image1" ImageUrl="~/Images_png/humming.GIF" runat="server" />
        </div>
        <br />
        <center>
        <div style="color:whitesmoke">
        <h1>Tree Structure Images</h1>
            </div>
            </center>
        <br />
    <div>
    <div align="center">
        <asp:DataList ID="DataList_AIA" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="Imag" runat="server" ImageUrl='<%#Img(Eval("Picture")) %>' Width="500"
                                Height="400" />
                        </td>
                        <td align="center">
                            <asp:Label ID="Label7" runat="server" Text='<%#(Eval("Class")) %>' CssClass="Clas"></asp:Label><br />
                            <br />
                            <asp:Label ID="Label9" runat="server" Text='<%#(Eval("ImageName")) %>' CssClass="MidClas"></asp:Label><br />
                            <br />
                            <asp:Label ID="Label8" runat="server" Text='<%#(Eval("MidClass")) %>' CssClass="SubClas"></asp:Label><br />
                            <br />
                            <table>
                                <tr>
                                    <td id="s">
                                        <center>
                                        <asp:Label ID="Label1" runat="server" Text='<%#(Eval("Attr1")) %>' CssClass="Attr"></asp:Label>
                                 
                                    <br />
                                  
                                        <asp:Label ID="Label2" runat="server" Text='<%#(Eval("Attr2")) %>' CssClass="Attr"></asp:Label>
                                   
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label3" runat="server" Text='<%#(Eval("Attr3")) %>' CssClass="Attr"></asp:Label>
                                    
                                 <br />
                                        <asp:Label ID="Label4" runat="server" Text='<%#(Eval("Attr4")) %>' CssClass="Attr"></asp:Label>
                                 
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label5" runat="server" Text='<%#(Eval("Attr5")) %>' CssClass="Attr"></asp:Label>
                                  
                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label6" runat="server" Text='<%#(Eval("Attr6")) %>' CssClass="Attr"></asp:Label>
                                   
                                            </center>
                                             </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </div> <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            </div>
    </form>
</body>
</html>
