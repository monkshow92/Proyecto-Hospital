using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string usuario = txtUsuario.Text;
            string contra = txtContra.Text;
            string ins = "exec autenticar_usuario_sp @usuario, @contra";
            string cadenaCon = ConfigurationManager.ConnectionStrings["ConexionHospital"].ConnectionString;
            try
            {
                using(SqlConnection con = new SqlConnection(cadenaCon)){
                using(SqlCommand cmd = new SqlCommand(ins,con)){
                    int estado = 0;
                    cmd.Parameters.AddWithValue("usuario", usuario);
                    cmd.Parameters.AddWithValue("contra", contra);
                    con.Open();
                    estado = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    if (estado == 1)
                        MessageBox.Show("Usuario Incorrecto!");
                    else if (estado == 0)
                        MessageBox.Show("Contraseña Incorrecta!");
                    else
                    {
                        Session["Usuario"] = usuario;
                        Response.Redirect("~/Main.aspx");
                    }
                }
                }
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }
    }
}