<%@ Page Title="Create Administrator "Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="createAdmin.aspx.cs" Inherits="Admin_createAdmin" %>

<%-- 
TITLE: createAdmin.aspx
AUTHOR: Shannon Painter
PURPOSE: Admin registration page.
ORIGINALLY CREATED ON: 26 Mar 2017
LAST MODIFIED ON: 
LAST MODIFIED BY: 
MODIFICATION HISTORY: 
    --%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <br /> <br /> <br /> <br />

    <asp:Label ID="Label2" runat="server"></asp:Label>

    <h2>Create Administrator Log In</h2>
    <br /> <br />

     <%--Email address is used to create administrator user name--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AdminUserName" CssClass="col-md-2 control-label">Email Address</asp:Label> 
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AdminUserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AdminUserName"
                    CssClass="text-danger" ErrorMessage="Email address field is required in order to create an administrator account." />
             <%-- Email must be in valid format --%>
                <asp:RegularExpressionValidator runat="server" ID="validEmail" ControlToValidate="AdminUserName" validationExpression=".*@.{2,}\..{2,}"
							CssClass="text-danger" ErrorMessage="Email address is not a valid format">
    				</asp:RegularExpressionValidator>

                <p>Email address will be your administrator user name.</p>

            </div>
        </div>

        <%-- Create Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AdminPassword" CssClass="col-md-2 control-label">Create Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AdminPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AdminPassword"
                    CssClass="text-danger" ErrorMessage="Password is required." />
                <%--Password must contain: Minimum 8 characters at least 1 Alpha and 1 Number--%>
                <asp:RegularExpressionValidator runat="server" ID="validPassword" ControlToValidate="AdminPassword" validationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
							CssClass="text-danger" ErrorMessage="Password must contain a minimum of 8 characters, at least 1 letter and 1 number.">
    				</asp:RegularExpressionValidator>
         
                       <p>Password must contain a minimum of 8 characters, at least 1 letter and 1 number.</p>
          </div>
        </div>

        <%-- Confirm Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmAdminPassword" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmAdminPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmAdminPassword"
                    CssClass="text-danger" ErrorMessage="Must confirm password." />
                <asp:CompareValidator runat="server" ControlToCompare="AdminPassword" ControlToValidate="ConfirmAdminPassword"
                    CssClass="text-danger" ErrorMessage="Passwords do not match." />
            </div>

		
			 <%-- Submit customer registration data --%>
            <div class="form-group">
             <div class="col-md-offset-2 col-md-10">
            <asp:Button ID="submitAdmit" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="submitAdmit_Click"/>
                              </div>
            </div>
        </div>
 
    
  </asp:Content>  
    
