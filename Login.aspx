<%@ Page Title="Log In " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<%-- 
TITLE: Login.aspx
AUTHOR: Shannon Painter
PURPOSE: Customer log in page.
ORIGINALLY CREATED ON: 6 Mar 2017
LAST MODIFIED ON: 8 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 8 Mar 2017 Draft code for ValidateUser event.
    --%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

<br /><br /><br />
     
    <h2>Log In</h2>
    <br/>
<p class="text-danger">
        <asp:Label ID="Label2" runat="server"></asp:Label>  <%-- Displays log in messages --%>.
              
    </p>

<%-- Enter Email Address --%>.
<div class="form-group">
<asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email Address</asp:Label>
<div class="col-md-10">
<asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="text-danger" ErrorMessage="Field is required." />
                        </div>

                    </div>

<%-- Enter Password--%>.    
<div class="form-group">
<asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
<div class="col-md-10">
 <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
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
       
    <%--Log in Button--%>                              
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
      <asp:Button runat="server" Text="Log in" CssClass="btn btn-default" OnClick="ValidateUser_Click" />
       </div>
            </div>
                
                <p>
                    <asp:HyperLink NavigateUrl="~/Account/Register.aspx" runat="server" ID="RegisterHyperLink">Register</asp:HyperLink>
                    if you don't have an account.
                </p>
         
</asp:Content>

