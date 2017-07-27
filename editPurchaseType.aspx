<%@ Page Title="Services " Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editPurchaseType.aspx.cs" Inherits="Admin_Default" %>


<%-- 
TITLE: editPurchaseType.aspx
AUTHOR: Shannon Painter
PURPOSE: Admin page used to manage Unlisted services
ORIGINALLY CREATED ON: 29 Mar 2017
LAST MODIFIED ON: 
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 8 Mar 2017 Added stored procedure 'transTypeAmount' which displays transaction type and payment amount.  
                        29 Mar 2017 Commented out unnecessary sp 
    --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br />

    <div>
    <h2>Manage Unlisted Services</h2>
    <%-- Table displays services from dbo.unlistedServices.  --%>

    <asp:GridView ID="servicesGridview" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="ServiceNumber">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ServiceNumber" HeaderText="ServiceNumber" InsertVisible="False" ReadOnly="True" SortExpression="ServiceNumber" />
            <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT * FROM [unlistedServices]" DeleteCommand="DELETE FROM [unlistedServices] WHERE [ServiceNumber] = @ServiceNumber" InsertCommand="INSERT INTO [unlistedServices] ([ServiceName], [Price]) VALUES (@ServiceName, @Price)" UpdateCommand="UPDATE [unlistedServices] SET [ServiceName] = @ServiceName, [Price] = @Price WHERE [ServiceNumber] = @ServiceNumber">
        <DeleteParameters>
            <asp:Parameter Name="ServiceNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ServiceName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ServiceName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="ServiceNumber" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
    
    <div>
    <p>
        <asp:HyperLink ID="Purchases" runat="server" NavigateUrl="adminOnly.aspx"> Return to Databases Management page.</asp:HyperLink>
    </p>
      </div>  

   

  <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
               
        <p class="text-danger">
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </p>
        
      <h4>Add New Service</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="service" CssClass="col-md-2 control-label">Service Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="service" CssClass="form-control" />
                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="service"
                                CssClass="text-danger" ErrorMessage="Field is required." />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="price" CssClass="col-md-2 control-label">Price</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="price"  CssClass="form-control" />
<%--                            <asp:RequiredFieldValidator runat="server" ControlToValidate="price" CssClass="text-danger" ErrorMessage="Field is required." />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Add Service"  CssClass="btn btn-default" OnClick="addService_Click" />
                            </div>
                        </div>

                 </section>
       </div>
      </div>
   
                   
        

</asp:Content>

