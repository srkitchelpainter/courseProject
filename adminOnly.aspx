<%@ Page Title="Database Administration " Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="adminOnly.aspx.cs" Inherits="Admin_adminOnly" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%-- 
TITLE: adminOnly.aspx
AUTHOR: Shannon Painter
PURPOSE: Admin landing page after log in.
ORIGINALLY CREATED ON: 6 Mar 2017
LAST MODIFIED ON: 8 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 
    --%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br />
    
    <asp:Label ID="Label_welcome" runat="server" Text="Welcome">Welcome to the administrator management page </asp:Label>
<div class="form-group">
    <h2>Databases</h2>
    <p>Select Database to Manage</p>
    <p>
       <asp:HyperLink ID="Customers" runat="server" NavigateUrl="~/Admin/editCustomer.aspx">Customers</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="Transactions" runat="server" NavigateUrl="~/Admin/editTransaction.aspx">Purchases</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="Purchases" runat="server" NavigateUrl="~/Admin/editPurchaseType.aspx">Unlisted Services</asp:HyperLink>
    </p>

    <h2>Reports</h2>
   <p>
       <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/totalCustomersReport.aspx">Total Customers</asp:HyperLink>
          
    </p>
    
    <p>  
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/purchasesReport.aspx">Total Purchases By Date</asp:HyperLink>         
    </p>
    <p>  
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/serviceReport.aspx">Service Report</asp:HyperLink>
    </p>

</div>


    <div class="form-group">
             <div class="col-md-offset-2 col-md-10">
       <asp:Button ID="logoutbutton" runat="server" Text="Log Out" CssClass="btn btn-default" OnClick="logoutbutton_Click" />
                 </div>
        </div>

</asp:Content>

