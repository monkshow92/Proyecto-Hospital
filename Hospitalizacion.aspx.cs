using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Hospitalizacion : System.Web.UI.Page
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
            for (int a = 2014; a > 1899; a--)
                ddlanio.Items.Add(new ListItem(a.ToString()));
            for (int m = 0; m < 60; m++)
                ddlMinutos.Items.Add(new ListItem(m.ToString()));
            for (int d = 1; d <= 31; d++)
                ddlDia.Items.Add(new ListItem(d.ToString()));
            ddlanio.SelectedIndex = 0;
        }
    }
    private void clear()
    {
        this.ddlanio.SelectedIndex = 0;
        this.ddlMes.SelectedIndex = 0;
        this.ddlDia.SelectedIndex = 0;
        this.ddlHora.SelectedIndex = 0;
        this.ddlMinutos.SelectedIndex = 0;
        this.ddlAmPm.SelectedIndex = 0;
        this.txtMotivo.Text = "";
        this.ddlDoctor.SelectedIndex = 0;
        this.ddlPacientes.SelectedIndex = 0;
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            MessageBox.Show(DateTime.Now.ToString());
            int nroCuenta = Convert.ToInt32(ddlPacientes.SelectedValue);
            int idDoctor = Convert.ToInt32(ddlDoctor.SelectedValue);
            DateTime fecha = ObtenerFecha();
            string motivo = txtMotivo.Text;
            string ins = "insert into Hospitalizacion " +
                    "(idHospitalizacion,nroCuenta,idDoctor,Fecha_Hora,Motivo)" +
                    " values(@idHospitalizacion,@nroCuenta,@idDoctor,@fecha,@motivo)";
            string cadenaCon = ConfigurationManager.ConnectionStrings["ConexionHospital"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(cadenaCon))
                {
                    using (SqlCommand cmd = new SqlCommand(ins, con))
                    {
                        int idHospitalizacion = 1;
                        string sel = "select MAX(idHospitalizacion) as id from Hospitalizacion";
                        SqlCommand select = new SqlCommand(sel, con);
                        con.Open();
                        idHospitalizacion = Convert.ToInt32(select.ExecuteScalar());
                        con.Close();
                        cmd.Parameters.AddWithValue("idHospitalizacion", idHospitalizacion + 1);
                        cmd.Parameters.AddWithValue("nroCuenta", nroCuenta);
                        cmd.Parameters.AddWithValue("idDoctor", idDoctor);
                        cmd.Parameters.AddWithValue("fecha", fecha);
                        cmd.Parameters.AddWithValue("motivo", motivo);
                        con.Open();
                        int res = cmd.ExecuteNonQuery();
                        con.Close();
                        if (res == 1)
                        {
                            MessageBox.Show("Hospitalizacion registrada exitosamente!");
                            Response.Redirect("~/Hospitalizacion.aspx");
                        }
                    }
                }
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
            clear();

        }
    }
    protected DateTime ObtenerFecha()
    {
        int mes = ddlMes.SelectedIndex + 1;
        int anio = Convert.ToInt32(ddlanio.SelectedValue);
        int dia = ddlDia.SelectedIndex + 1;
        int hora = Convert.ToInt32(ddlHora.SelectedValue);
        if (ddlAmPm.SelectedIndex == 1)
            hora += 12;
        int minuto = ddlMinutos.SelectedIndex;
        DateTime fecha = new DateTime(anio, mes, dia, hora, minuto, 0);
        return fecha;
    }
    protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDia.Items.Clear();
        int dias = 30;
        int mes = ddlMes.SelectedIndex;
        int anio = Convert.ToInt32(ddlanio.SelectedValue);
        if ((mes < 7 && mes % 2 == 0) || (mes > 6 && mes % 2 == 1))
            dias = 31;
        if (mes == 1)
        {
            dias = 28;
            if (anio % 4 == 0)
                dias = 29;
        }
        for (int d = 1; d <= dias; d++)
            ddlDia.Items.Add(new ListItem(d.ToString()));
    }
}