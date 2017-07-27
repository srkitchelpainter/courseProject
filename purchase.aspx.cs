using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (Session["UserName"] == null)
       {
           Response.Redirect("~/Account/Login.aspx");
       }
        
        if (!this.IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                this.welcome.Text = string.Format("Welcome {0}", Session["UserName"].ToString());
            }
        }
    }

    protected void B_Logout_Click(object sender, EventArgs e)
    {
        Session.Remove("UserName");
        Session.RemoveAll();
        Session["New"] = null;
        Response.Redirect("Default.aspx");
    }


    protected void purchaseButton_Click(object sender, EventArgs e)
    {

        SqlConnection vid = new SqlConnection("Data Source= Catalog= ;Persist Security Info=True;User ID= ;Password= ");
        {
            SqlCommand purchase = new SqlCommand("Insert into Purchases(Service, CreditCardType, CardNumber, ExpDate, EmAddress) Values(@Service, @CreditCardType, @CardNumber, @ExpDate, @EmAddress)", vid);

            purchase.Parameters.AddWithValue("@Service", RadioButtonList1.SelectedValue);
            purchase.Parameters.AddWithValue("@CreditCardType", transType.SelectedValue);
            purchase.Parameters.AddWithValue("@CardNumber", ccard.Text);
            purchase.Parameters.AddWithValue("@ExpDate", mmyy.Text);
            purchase.Parameters.AddWithValue("@EmAddress", EmAddress.Text);
            

            vid.Open();
            purchase.ExecuteNonQuery();
            vid.Close();

        }


        if (IsPostBack)
        {
            ccard.Text = "";
            mmyy.Text = "";
            welcome.Text = "Your purchase information has been successfully submitted.";
        }
    }
}
