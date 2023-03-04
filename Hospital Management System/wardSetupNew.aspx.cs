using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ipd_Default11 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();

        }
        catch(Exception ex)
        {
            if (ex.Message.IndexOf("PRIMARY KEY") != -1)
                lblmsg.Text = "This record already exists";
        }
    }

    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string strmsg = null;
        if(e.AffectedRows>0)
        {
            strmsg = "Record added successfully";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + strmsg + "');", true);
            cleardata();
        }
        else
        {
            strmsg = "Record could not be added, try again";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + strmsg + "');", true);
        }
    }

    private void cleardata()
    {
        txtbuildnm.Text = txtfloor.Text = txtwardname.Text = lblmsg.Text = string.Empty;
    }
}