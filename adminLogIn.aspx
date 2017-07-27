<%@ Page Title="Administrator Log In " Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="adminLogin.aspx.cs" Inherits="Admin_adminLogin" %>

<%-- 
TITLE: adminLogin.aspx
AUTHOR: Shannon Painter
PURPOSE: Admin log in page. Displayed as link in site.Master footer
ORIGINALLY CREATED ON: 6 Mar 2017
LAST MODIFIED ON: 8 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 
    --%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <br /><br /><br />
    
    <p class="text-danger">
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </p>

    <h2><%: Title %></h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
               
                    <h4>  </h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="AdminUserName" CssClass="col-md-2 control-label">Email Address</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="AdminUserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="AdminUserName"
                                CssClass="text-danger" ErrorMessage="Field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="AdminPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="AdminPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="AdminPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
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
                            <asp:Button runat="server" Text="Log in"  CssClass="btn btn-default" OnClick="LogIn_Click" />
                            
                        </div>
                    </div>
               
            </section>
             <p>
                    <asp:HyperLink NavigateUrl="~/Admin/createAdmin.aspx" runat="server" ID="createAdminHyperlink">Register as an Administrator.</asp:HyperLink>
                                   </p>
        </div>

    </div>
</asp:Content>
