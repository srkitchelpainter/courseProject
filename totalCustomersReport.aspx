<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="totalCustomersReport.aspx.cs" Inherits="Admin_totalCustomersReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%-- 
TITLE: totalCustomersReport.aspx
AUTHOR: Shannon Painter
PURPOSE: SQL Admin Report of Total Customers 
ORIGINALLY CREATED ON: 19 Apr 2017
LAST MODIFIED ON: 2 May 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: Corrected error with search field view overflowing into footer (Presentation 4 feedback) by using 100% for width/height.
    --%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br />

    <div>
    <asp:HyperLink ID="Purchases" runat="server" NavigateUrl="adminOnly.aspx"> Return to Databases Management page.</asp:HyperLink>
    </div>

    <div class="form-group">
        <h3>Total Customers</h3>
   
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="200px" Width="200px">
        <LocalReport ReportPath="Admin\totalCustomers.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="totalCustomers" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>

         </div>
</asp:Content>

