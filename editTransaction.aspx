<%@ Page Title="Manage Transactions " Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editTransaction.aspx.cs" Inherits="Admin_editTransaction" %>

<%-- 
TITLE: editTransaction.aspx
AUTHOR: Shannon Painter
PURPOSE: Admin page used to manage customer payment transaction data
ORIGINALLY CREATED ON: 6 Mar 2017
LAST MODIFIED ON: 8 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 8 Mar 2017 Added stored procedure 'transTypeAmount' which displays transaction type and payment amount
    --%>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br />

    <h2>Manage Purchases</h2>
    <%-- Table displays all customer transactions data from dbo.Purchases.  Needs modified to a stored procedure for final product --%>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TransNumber" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="TransNumber" HeaderText="TransNumber" InsertVisible="False" ReadOnly="True" SortExpression="TransNumber" />
                <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                <asp:BoundField DataField="CreditCardType" HeaderText="CreditCardType" SortExpression="CreditCardType" />
                <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" SortExpression="CardNumber" />
                <asp:BoundField DataField="ExpDate" HeaderText="ExpDate" SortExpression="ExpDate" />
                <asp:BoundField DataField="EmAddress" HeaderText="EmAddress" SortExpression="EmAddress" />
                <asp:BoundField DataField="TransDate" HeaderText="TransDate" SortExpression="TransDate" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" DeleteCommand="DELETE FROM [Purchases] WHERE [TransNumber] = @TransNumber" InsertCommand="INSERT INTO [Purchases] ([CreditCardType], [CardNumber], [ExpDate], [EmAddress]) VALUES (@CreditCardType, @CardNumber, @ExpDate, @EmAddress)" SelectCommand="SELECT * FROM [Purchases]" UpdateCommand="UPDATE [Purchases] SET [CreditCardType] = @CreditCardType, [CardNumber] = @CardNumber, [ExpDate] = @ExpDate, [EmAddress] = @EmAddress WHERE [TransNumber] = @TransNumber">
            <DeleteParameters>
                <asp:Parameter Name="TransNumber" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CreditCardType" Type="String" />
                <asp:Parameter Name="CardNumber" Type="Decimal" />
                <asp:Parameter Name="ExpDate" Type="Decimal" />
                <asp:Parameter Name="EmAddress" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CreditCardType" Type="String" />
                <asp:Parameter Name="CardNumber" Type="Decimal" />
                <asp:Parameter Name="ExpDate" Type="Decimal" />
                <asp:Parameter Name="EmAddress" Type="String" />
                <asp:Parameter Name="TransNumber" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

     <div>
     <p>
        <asp:HyperLink ID="Purchases" runat="server" NavigateUrl="adminOnly.aspx"> Return to Databases Management page.</asp:HyperLink>
    </p>
        </div>
   <%-- <h2>Transaction Data by Payment Type</h2>
    <%-- stored procedure 'transTypeAmount' displays customer transaction type and payment amount from dbo.Transactions --%>
    <%--<p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TransType" HeaderText="TransType" SortExpression="TransType" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="EXECUTE transTypeAmount">
        </asp:SqlDataSource>
    </p>--%>

</asp:Content>
