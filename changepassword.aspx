<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

<%-- 
TITLE: changepassword.aspx
AUTHOR: Shannon Painter
PURPOSE: Customer account management feature to change log in password
ORIGINALLY CREATED ON: 29 Mar 2017
LAST MODIFIED ON: 29 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 
    --%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /> <br /> <br />
     <h2>Change Password</h2>
       <br />
    <p>Enter the current username, current password, new password and confirm new password.</p>
    <asp:Label ID="pwdlabel" runat="server"></asp:Label>
    <br />
      <%--Email address is user name--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email Address</asp:Label> 
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="Email address field is required." />
             <%-- Email must be in valid format --%>
                <asp:RegularExpressionValidator runat="server" ID="validEmail" ControlToValidate="UserName" validationExpression=".*@.{2,}\..{2,}"
							CssClass="text-danger" ErrorMessage="Email address is not a valid format">
    				</asp:RegularExpressionValidator>
                </div>
            </div>

     <%-- Old Password --%>
    <div class="form-group">
    <asp:Label runat="server" AssociatedControlID="OldPassword" CssClass="col-md-2 control-label">Current Password</asp:Label>
    <div class="col-md-10">
    <asp:TextBox runat="server" ID="OldPassword" TextMode="Password" CssClass="form-control" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="OldPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
    </div>
    </div>
     
    
     <%-- Create New Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">Create New Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                    CssClass="text-danger" ErrorMessage="Password is required." />
                <%--Password must contain: Minimum 8 characters at least 1 Alpha and 1 Number--%>
                <asp:RegularExpressionValidator runat="server" ID="validPassword" ControlToValidate="NewPassword" validationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
							CssClass="text-danger" ErrorMessage="Password must contain a minimum of 8 characters, at least 1 letter and 1 number.">
    				</asp:RegularExpressionValidator>
         
                       <p>Password must contain a minimum of 8 characters, at least 1 letter and 1 number.</p>
          </div>
        </div>

        <%-- Confirm New Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm New Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                    CssClass="text-danger" ErrorMessage="Must confirm password." />
                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                    CssClass="text-danger" ErrorMessage="Passwords do not match." />
            </div>
            </div>

    <div class="form-group">
             <div class="col-md-offset-2 col-md-10">
            <asp:Button ID="chngpwdbutton" runat="server" Text="Change Password" CssClass="btn btn-default" OnClick="ChangePassword_Click" />
                              </div>
            </div>


    <br />
    <br />
</asp:Content>

