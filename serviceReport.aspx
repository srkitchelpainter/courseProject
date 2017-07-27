<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="serviceReport.aspx.cs" Inherits="Admin_serviceReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<%-- 
TITLE: serviceReport.aspx
AUTHOR: Shannon Painter
PURPOSE: SQL Admin Report of Services Purchased
ORIGINALLY CREATED ON: 19 Apr 2017
LAST MODIFIED ON: 2 May 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: Corrected error with search field view overflowing into footer (Presentation 4 feedback) by using 100% for width/height.
    --%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br />
    <asp:HyperLink ID="Purchases" runat="server" NavigateUrl="adminOnly.aspx"> Return to Databases Management page.</asp:HyperLink>
    <br />
    <div class="form-group">
        <h3>Services Purchased</h3>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="100%" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="Admin\serviceReport.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="serviceType" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT * FROM [Purchases]"></asp:SqlDataSource>
        </div>
</asp:Content>

