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
using System.Web.SessionState;


/// <summary>
/// Log in functions for customer login 
/// </summary>
/// 


public partial class Account_Login : System.Web.UI.Page
{
    //SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            Response.Redirect("~/purchase.aspx");
        }
    }

protected void ValidateUser_Click(object sender, EventArgs e)
   {
        SqlConnection vid = new SqlConnection("Data Source= Catalog= ;Persist Security Info=True;User ID= ;Password= ");
        vid.Open();
        string checkuser = "Select count(*) from Customers where Email='" + UserName.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, vid);
       int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
       vid.Close();
        if (temp==1)
        {
            vid.Open();
           string checkpassword = "Select Password from Customers where Email='" + UserName.Text + "'";
           SqlCommand passcom = new SqlCommand(checkpassword,vid);
            string password = passcom.ExecuteScalar().ToString();
            if(password == Password.Text)
            {
                  {
                    SqlCommand isapproved  = new SqlCommand("Update Customers set IsApproved = '" + "1" + "' where Email = '" + UserName.Text + "'" , vid);
                    isapproved.Parameters.AddWithValue("@IsApproved", "1");
                   isapproved.ExecuteNonQuery();
                   Session["UserName"] = UserName.Text;
                    Response.Redirect("~/purchase.aspx");
                    vid.Close();
                }

                
            }
           
           else
            {
                Label2.Text = ("Password is incorrect");
            }
        }
             else
            {
                Label2.Text = ("User name is incorrect.");
            }
        }      
        
  }
       
