using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

public partial class Admin_createAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ////display registration success message if data updates to SQL
        if (Page.IsPostBack == true)
        {
            Label2.Text = ("Administrator registration has been submitted successfully.");
        }

    }
    
    protected void submitAdmit_Click(object sender, EventArgs e)
    {
 
        SqlConnection vid = new SqlConnection("Data Source=IN-CSCI-ASPNET;Initial Catalog=shkitche;Persist Security Info=True;User ID=shkitche;Password=s8414kit");
        {
            SqlCommand admin = new SqlCommand("Insert into Admin(AdminUserName, AdminPassword, AdminApproved) Values(@AdminUserName, @AdminPassword, @AdminApproved)", vid);

            admin.Parameters.AddWithValue("@AdminUserName", AdminUserName.Text);
            admin.Parameters.AddWithValue("@AdminPassword", ConfirmAdminPassword.Text);
            admin.Parameters.AddWithValue("@AdminApproved", "0");

                vid.Open();
                admin.ExecuteNonQuery();
                vid.Close();
        
                }
                       

        if (IsPostBack)
        {
            AdminUserName.Text = "";
            ConfirmAdminPassword.Text = "";
           }
    }
}
    


       
      

 

    

    
      
    
  


