using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Server=MSI\\SQLEXPRESS;Integrated Security=true;Database=Northwind;");
        SqlCommand cmd;
        SqlCommand cmd1;
        string query;
        private DataTable dt = new DataTable();



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            conn.Open();
            cmd = new SqlCommand("Search_procedure", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", txt_cname.Text);
            cmd.Parameters.Add(new SqlParameter()
            {
                Direction = ParameterDirection.Output,
                ParameterName = "@status",
                SqlDbType = SqlDbType.Int
            });
            cmd.ExecuteNonQuery();
            if (cmd.Parameters["@status"].Value.ToString() == "1")
            {
                query = "select * from View_inner where CategoryName='" + txt_cname.Text + "'";
                cmd1 = new SqlCommand(query, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                adapter.Fill(dt);
                grid.DataSource = dt;
                grid.DataBind();
            }
            else
            {
                lbl_result.Text = "Data does not exist!";
            }
            conn.Close();
        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}