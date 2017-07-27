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
    //SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["shkitcheConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            Response.Redirect("~/purchase.aspx");
        }
    }

    //Stored procedure for course project
//    protected void ValidateUser_Click(object sender, EventArgs e)
//    {
//        SqlParameter parus = new SqlParameter("@Email", UserName.Text.Trim());
//        SqlParameter parpwd = new SqlParameter("@Password", Password.Text.Trim());
//        SqlCommand cmd2 = new SqlCommand("sp_CheckLogin", vid);
//        cmd2.Parameters.Add(parus);
//        cmd2.Parameters.Add(parpwd);
//        cmd2.CommandType = CommandType.StoredProcedure;
//        vid.Open();
//        SqlDataReader dr = cmd2.ExecuteReader();

//        if (dr.Read())
//        {
//            SqlCommand approved = new SqlCommand("Update Customers set IsApproved = '" + "1" + "' where Email = '" + UserName.Text + "'", vid);
//            approved.Parameters.AddWithValue("@IsApproved", "1");
//            Session["UserName"] = this.UserName.Text.Trim();
//            Response.Redirect("~/purchase.aspx");
//        }
//        else
//        {
//            Label2.Text = ("Log in information is incorrect");
//        }

//        vid.Close();

//    }
//}

//Lab5
protected void ValidateUser_Click(object sender, EventArgs e)
   {
        SqlConnection vid = new SqlConnection("Data Source=IN-CSCI-ASPNET;Initial Catalog=shkitche;Persist Security Info=True;User ID=shkitche;Password=s8414kit");
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

    //create a cookie on user's harddrive. Disable cookies on the browser, change the cookie name to try to create a new cookie and cookie values will not be retrieved.
   // protected void setCookie(string em)
    ////{   HttpCookie oCookie = Request.Cookies["Name5"];
    //    if (oCookie == null)
    //    {
    //        HttpCookie cookie = new HttpCookie("Name5");

    //        cookie["fn"] = ("select fname from customer where  email = '" + em + "';");
    //        cookie["em"] = em;
    //        cookie["Language"] = "English";
    //        cookie.Expires = DateTime.Now.AddYears(1);

    //        Response.Cookies.Add(cookie);

    //    }
       
        
  }
       
