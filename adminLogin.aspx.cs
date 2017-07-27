using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections;


///// <summary>
///// Log in functions for admin login 
///// </summary>
///// 


public partial class Admin_adminLogin : System.Web.UI.Page
{
 protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            Response.Redirect("adminOnly.aspx");
        }
    }
    
    protected void LogIn_Click(object sender, EventArgs e)
    {
        SqlConnection vid = new SqlConnection("Data Source=IN-CSCI-ASPNET;Initial Catalog=shkitche;Persist Security Info=True;User ID=shkitche;Password=s8414kit");
        vid.Open();
        string checkadminuser = "Select count(*) from Admin where AdminUserName='" + AdminUserName.Text + "'";
        SqlCommand com = new SqlCommand(checkadminuser, vid);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        vid.Close();
        if (temp == 1)
        {
            vid.Open();
            string checkadminpassword = "Select AdminPassword from Admin where AdminUserName='" + AdminUserName.Text + "'";
            SqlCommand passcom = new SqlCommand(checkadminpassword, vid);
            string password = passcom.ExecuteScalar().ToString();
            if (password == AdminPassword.Text)
            {
                {
                    SqlCommand isapproved = new SqlCommand("Update Admin set AdminApproved = '" + "1" + "' where AdminUserName = '" + AdminUserName.Text + "'", vid);

                    isapproved.Parameters.AddWithValue("@AdminApproved", "1");
                    isapproved.ExecuteNonQuery();
                    Session["New"] = AdminUserName.Text;
                    Response.Redirect("adminOnly.aspx");
                }


            }

            else
            {
                Label3.Text = ("Password is incorrect");
            }
        }
        else
        {
            Label3.Text = ("User name is incorrect.");
        }
    }

}


