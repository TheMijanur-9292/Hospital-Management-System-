using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ipd_Default10 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethodAttribute(),
    System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] getlist(string prefixText, int count, string contextKey)
    {
        string strcenid = System.Web.HttpContext.Current.Session["centerid"].ToString();
        List<string> returndata = new List<string>();
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["consql"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("select distinct wardname from warddetails where wardname like  '%" + prefixText + "%' and centerid='" + strcenid + "'", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            returndata.Add(dr[0].ToString());

        }
        cmd.Dispose();
        con.Close();
        return returndata.ToArray();


    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        txtwardname.Text = string.Empty;
    }



    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {

    }
}