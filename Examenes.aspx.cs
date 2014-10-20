using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Examenes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            MessageBox.Show("Inicie Sesion primero!");
            Response.Redirect("~/Login.aspx", true);
        }
        if (!IsPostBack)
        {
            txtPrecio.Text = "0.00";
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtInstruccion.Text.Length > 0)
        {
            string ins = "insert into Instruccion (idInstruccion,Instruccion) "+
                " values(@idInstruccion,@Instruccion)";
            string cadenaCon = ConfigurationManager.ConnectionStrings["ConexionHospital"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(cadenaCon))
                {
                    using (SqlCommand cmd = new SqlCommand(ins, con))
                    {
                        int idInstruccion = 1;
                        string sel = "select MAX(idInstruccion) as id from Instruccion";
                        SqlCommand select = new SqlCommand(sel, con);
                        con.Open();
                        idInstruccion = Convert.ToInt32(select.ExecuteScalar());
                        con.Close();
                        cmd.Parameters.AddWithValue("idInstruccion", idInstruccion + 1);
                        cmd.Parameters.AddWithValue("Instruccion", txtInstruccion.Text);
                        con.Open();
                        int res = cmd.ExecuteNonQuery();
                        con.Close();
                        if (res == 1)
                        {
                            Response.Redirect("~/Examenes.aspx");
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
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string nroCuenta = "null";
            if(cbPaciente.Checked)
                nroCuenta = "'" + ddlPacientes.SelectedValue + "'";
            decimal precio = Convert.ToDecimal(txtPrecio.Text);
            int idTipo = Convert.ToInt32(ddlTipoExamen.SelectedValue);
            int[] indices = lstInstrucciones.GetSelectedIndices();
            string ins = "insert into Examen (idExamen,nroCuenta,idTipo,Precio) " +
                " values(@idExamen,"+nroCuenta+",@idTipo,@Precio)";
            string cadenaCon = ConfigurationManager.ConnectionStrings["ConexionHospital"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(cadenaCon))
                {
                    using (SqlCommand cmd = new SqlCommand(ins, con))
                    {
                        int idExamen = 1;
                        string sel = "select MAX(idExamen) as id from Examen";
                        SqlCommand select = new SqlCommand(sel, con);
                        con.Open();
                        idExamen = Convert.ToInt32(select.ExecuteScalar());
                        con.Close();
                        cmd.Parameters.AddWithValue("idExamen", idExamen + 1);
                        cmd.Parameters.AddWithValue("idTipo", idTipo);
                        cmd.Parameters.AddWithValue("Precio", precio);
                        con.Open();
                        int res = cmd.ExecuteNonQuery();
                        con.Close();
                        SqlCommand cmd2;
                        for (int i = 0; i < indices.Length; i++)
                        {
                            string idInstruccion = lstInstrucciones.Items[indices[i]].Value;
                                string ins2 = "insert into Instrucciones_Examenes values "
                        + "("+(idExamen + 1)+","+idInstruccion+")";
                                cmd2 = new SqlCommand(ins2, con);
                                con.Open();
                                cmd2.ExecuteNonQuery();
                                con.Close();
                        }
                        MessageBox.Show("Examen registrado!");
                        Response.Redirect("~/Examenes.aspx");
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