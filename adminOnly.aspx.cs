using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_adminOnly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["New"] == null)
        {
            Response.Redirect("adminLogin.aspx");
        }

        if (!this.IsPostBack)
        {
            if (Session["New"] != null)
            {
                this.Label_welcome.Text = string.Format("Welcome {0}", Session["New"].ToString());
            }
        }
    }

    protected void logoutbutton_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("adminLogin.aspx");
    }
}