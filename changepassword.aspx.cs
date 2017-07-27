using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class changepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }

    protected void ChangePassword_Click(object sender, EventArgs e)
    {
        SqlConnection vid = new SqlConnection("Data Source= Catalog= ;Persist Security Info=True;User ID= ;Password= ");
        SqlDataAdapter sda = new SqlDataAdapter("select Password from Customers where Password = '" + OldPassword.Text + "'", vid);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count == 1)
        {
            if (NewPassword.Text == ConfirmNewPassword.Text)
            {
                vid.Open();
                SqlCommand cmd = new SqlCommand("Update Customers set Password = '" + ConfirmNewPassword.Text + "' where Password = '" + OldPassword.Text + "'", vid);
                cmd.ExecuteNonQuery();
                vid.Close();
                //pwdlabel.Text = "Password updated successfully.";
                //pwdlabel.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                pwdlabel.Text = "New Password and Confirm Password should match.";
            }
        }

        if (NewPassword.Text == ConfirmNewPassword.Text)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

    }
}
