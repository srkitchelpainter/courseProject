<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="purchase.aspx.cs" Inherits="purchase" %>

<%-- 
TITLE: purchase.aspx
AUTHOR: Shannon Painter (editor)
PURPOSE: Service purchase page and account management.
ORIGINALLY CREATED ON: 22 Mar 2017
LAST MODIFIED ON: 
LAST MODIFIED BY: 
MODIFICATION HISTORY: 
NOTES:      --%>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br/>  <br/>  <br/>  

    <asp:Label ID="welcome" runat="server" Text="Welcome">Welcome to your service management page </asp:Label>

    <p class="text-danger">
        <asp:Label ID="Label2" runat="server"></asp:Label>  <%-- Displays purchase info errors --%>
                </p>

    <div class="form-horizontal">

    <h1>Purchase Unlisted Service</h1>
   
         
        <%--Data located in unlistedServices table--%>


                 
    <%--Service type--%>
        <div class="form-group">
            <asp:Label ID="radiolist" runat="server"  CssClass="col-md-2 control-label">Service Type:</asp:Label>
             <div class="col-md-10">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="ServiceName">
            </asp:RadioButtonList>

        </div> <%--End form group div--%>
             </div> <%-- End div "col-md-10"--%>

        <%--Credit card type--%>
        <div class="form-group">
        <asp:Label ID="transTypeLabel" runat="server"  CssClass="col-md-2 control-label">Credit Card Type:</asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT [ServiceName], [Price] FROM [unlistedServices]"></asp:SqlDataSource>
            <div class="col-md-10">
        <asp:DropDownList ID="transType" runat="server" CssClass="form-control" DataSourceID="transTypeSource" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
            <asp:SqlDataSource ID="transTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT [Type] FROM [TransactionType]"></asp:SqlDataSource>
             </div>  <%--End form-group div--%>
                </div> <%-- End div "col-md-10"--%>

        <%-- Credit card number --%>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Credit Card Number:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ccard" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="ccard"
                    CssClass="text-danger" ErrorMessage="Credit card number is required." />--%>
                  </div>  <%--End form-group div--%>
                </div> <%-- End div "col-md-10"--%>

             <%-- Credit card expiration date --%>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Expiration Date (mmyy):</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mmyy" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="mmyy"
                    CssClass="text-danger" ErrorMessage="Credit card expiration date is required." />--%>
                  </div>  <%--End form-group div--%>
                </div> <%-- End div "col-md-10"--%>

             <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EmAddress" CssClass="col-md-2 control-label">Email Address:</asp:Label>
            <div class="col-md-10">
            <asp:TextBox runat="server" ID="EmAddress" CssClass="form-control" />
           <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="EmAddress" CssClass="text-danger" ErrorMessage="Email address is required." />--%>
                        </div>
                    </div>

       <%-- Purchase button sends data to Transactions table--%>
        <div class="form-group">
             <div class="col-md-offset-2 col-md-10">
    <asp:Button ID="purchaseButton" runat="server" CssClass="btn btn-default" Text="Purchase" OnClick="purchaseButton_Click"/>
         </div>  <%--End form-group div--%>
                </div> <%-- End div "col"--%>

   

   <div class="form-group">
    <h2>Manage Unlisted Account</h2>
    <div class="col-md-10">
        <asp:HyperLink ID="chngpwdlink" runat="server" NavigateUrl="~/Account/changepassword.aspx">Change Password</asp:HyperLink>
     </div>  <%--End form-group div--%>
                </div> <%-- End div "col"--%>
    

    <%--Customer Transaction History Gridview Display Upon Purchase Button Click --%>
        <div class="form-group">
        <h2>Transaction History</h2>
            <div class="col-md-10">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TransNumber" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Purchases] WHERE ([EmAddress] = @EmAddress)">
            <SelectParameters>
                <asp:ControlParameter ControlID="EmAddress" Name="EmAddress" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                </div>

        </div>
             <div>
                  </div>   <%--End form horizontal div--%>



       <asp:Button ID="logoutbutton" runat="server" Text="Log Out" CssClass="btn btn-default" OnClick="B_Logout_Click" />
            </div>
          
</asp:Content>

