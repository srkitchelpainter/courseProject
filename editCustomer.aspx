<%@ Page Title="Manage Customers " Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editCustomer.aspx.cs" Inherits="Admin_editCustomer" %>

<%-- 
TITLE: editCustomer.aspx
AUTHOR: Shannon Painter
PURPOSE: Admin page used to manage customer data
ORIGINALLY CREATED ON: 6 Mar 2017
LAST MODIFIED ON: 8 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 8 Mar 2017 Added stored procedure 'getEmailAddress' which displays all customer email address from dbo.Customers
    --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br />

    <h2>Manage Customers</h2>
    
    <%-- Table displays all customer data from dbo.Customers.  Needs modified to a stored procedure for final product --%>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" CellPadding="4" DataKeyNames="CustomerNumber" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField ItemStyle-Width="150px" DataField="CustomerNumber" HeaderText="CustomerNumber" InsertVisible="False" ReadOnly="True" SortExpression="CustomerNumber" />
        <asp:BoundField ItemStyle-Width="150px" DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
        <asp:BoundField ItemStyle-Width="150px" DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
        <asp:BoundField ItemStyle-Width="150px" DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
        <asp:BoundField ItemStyle-Width="150px" DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
        <asp:BoundField ItemStyle-Width="150px" DataField="City" HeaderText="City" SortExpression="City" />
        <asp:BoundField ItemStyle-Width="150px" DataField="State" HeaderText="State" SortExpression="State" />
        <asp:BoundField ItemStyle-Width="150px" DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
        <asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" SortExpression="IsApproved" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerNumber] = @CustomerNumber" InsertCommand="INSERT INTO [Customers] ([FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [ZIP], [Email], [Password], [IsApproved]) VALUES (@FirstName, @MiddleName, @LastName, @StreetAddress, @City, @State, @ZIP, @Email, @Password, @IsApproved)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [MiddleName] = @MiddleName, [LastName] = @LastName, [StreetAddress] = @StreetAddress, [City] = @City, [State] = @State, [ZIP] = @ZIP, [Email] = @Email, [Password] = @Password, [IsApproved] = @IsApproved WHERE [CustomerNumber] = @CustomerNumber">
        <DeleteParameters>
            <asp:Parameter Name="CustomerNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZIP" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="IsApproved" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZIP" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="IsApproved" Type="Boolean" />
            <asp:Parameter Name="CustomerNumber" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div>
     <p>
        <asp:HyperLink ID="Purchases" runat="server" NavigateUrl="adminOnly.aspx"> Return to Databases Management page.</asp:HyperLink>
    </p>
        </div>

  <%--  <h2>Email Addresses</h2>
    <%-- stored procedure 'getEmailAddress' displays all customer email addresses from dbo.Customers --%>
       <%-- <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerNumber" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CustomerNumber" HeaderText="CustomerNumber" InsertVisible="False" ReadOnly="True" SortExpression="CustomerNumber" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="EXECUTE getEmailAddress">
         </asp:SqlDataSource>--%>
 
</asp:Content>
