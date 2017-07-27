using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] == null)
        {
            Response.Redirect("adminLogin.aspx");
        }
        
        ////display registration success message if data updates to SQL
        if (Page.IsPostBack == true)
        {
            Label3.Text = ("New service has been submitted successfully. Refresh table.");
        }
    }
    protected void addService_Click(object sender, EventArgs e)
    {
        SqlConnection vid = new SqlConnection("Data Source=IN-CSCI-ASPNET;Initial Catalog=shkitche;Persist Security Info=True;User ID=shkitche;Password=s8414kit");
        {
            SqlCommand ser = new SqlCommand("Insert into unlistedServices(ServiceName, Price) Values(@ServiceName, @Price)", vid);

           
            ser.Parameters.AddWithValue("@ServiceName", service.Text);
            ser.Parameters.AddWithValue("@Price", price.Text);


            vid.Open();
            ser.ExecuteNonQuery();
            vid.Close();

        }


        if (IsPostBack)
        {
            service.Text = "";
            price.Text = "";
        }
    }
}