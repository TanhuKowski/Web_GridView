using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Server=MSI\\SQLEXPRESS;Integrated Security=true;Database=Northwind;");
        SqlCommand cmd;
        bool TextChange = false;
        DataTable dt = new DataTable();




        protected void Page_Load(object sender, EventArgs e)
        {
              if(!this.IsPostBack)
            {
                this.DataBind();
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (TextChange)
            {
                Session["data"] = null;
            }
            this.Bind_Grid();
            TextChange = false;
        }

        private void Bind_Grid()
        {
            if (Session["data"] == null)
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
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                    Session["data"] = dt;
                    lbl_result.Text = "";

                }
                else
                {
                    lbl_result.Text = "Data does not exist!";
                    grid.DataSource = null;
                    grid.DataBind();
                }
                conn.Close();
            }

            grid.DataSource = Session["data"];
            grid.DataBind();
        }
        

        protected void txt_cname_TextChanged(object sender, EventArgs e)
        {
            TextChange = true;
        }

       
        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid.PageIndex = e.NewPageIndex;
            this.Bind_Grid();
        }
    }
}