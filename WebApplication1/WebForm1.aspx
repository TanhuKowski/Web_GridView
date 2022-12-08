<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <div>
        <asp:Label ID="lbl_cname" runat="server" Text="CategoryName"></asp:Label>
        <asp:TextBox ID="txt_cname" runat="server" style="margin-left: 11px" OnTextChanged="txt_cname_TextChanged"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" style="margin-left: 21px" />
        <asp:GridView ID="grid" runat="server" style="margin-top: 37px" AutoGenerateColumns="False" Height="16px" OnPageIndexChanging="grid_PageIndexChanging" Width="424px" AllowPaging="True" AllowCustomPaging="True" PageSize="4">
            <PagerSettings FirstPageText="&quot;First&quot;" LastPageImageUrl="&quot;Last&quot;" Mode="NumericFirstLast" PageButtonCount="4" />
                </asp:GridView>
            </div>
            <p>
                <asp:Label ID="lbl_result" runat="server" Text=""></asp:Label>
            </p>
    </form>

</body>
</html>
