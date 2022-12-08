<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body style="color:darkolivegreen">
    <form id="form1" runat="server">
            <div>
        <asp:Label ID="lbl_cname" runat="server" style= "color: darkgoldenrod; font:bold;" Text="Category Name"></asp:Label>
        <asp:TextBox ID="txt_cname" runat="server" style="margin-left: 11px" OnTextChanged="txt_cname_TextChanged"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" style="margin-left: 21px; color: white; background-color:dodgerblue;" />
        <asp:GridView ID="grid" runat="server" style="margin-top: 37px" AutoGenerateColumns="False" Height="16px" OnPageIndexChanging="grid_PageIndexChanging" Width="424px" AllowPaging="True" AllowCustomPaging="True" PageSize="4" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="&quot;First&quot;" LastPageImageUrl="&quot;Last&quot;" PageButtonCount="4" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
            <p>
                <asp:Label ID="lbl_result" runat="server" style= "background-color:darkred; color:white; " Text=""></asp:Label>
            </p>
    </form>

</body>
</html>
