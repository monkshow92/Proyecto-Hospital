using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Alta : System.Web.UI.Page
{
    private List<Medicina> list = new List<Medicina>();
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
        this.ddlDoctor.SelectedIndex = 0;
        this.ddlPacientes.SelectedIndex = 0;
        this.txtHonorarios.Text = "";
        this.txtPrecio.Text = "";
        clearM();
    }
    private void clearM()
    {
        this.txtCantidad.Text = "";
        this.txtDosis.Text = "";
        this.ddlMedicina.SelectedIndex = 0;
        this.ddlVia.SelectedIndex = 0;
    }
    protected void btnMedicina_Click(object sender, EventArgs e)
    {
        if (txtDosis.Text.Length > 0 && txtCantidad.Text.Length > 0)
        {
            Medicina m = new Medicina();
            m.idMedicina = ddlMedicina.SelectedValue;
            m.idVia = ddlVia.SelectedValue;
            m.Dosis = txtDosis.Text;
            m.cant = txtCantidad.Text;
            list.Add(m);
            lstMedicina.Items.Add(ddlMedicina.SelectedItem.Text);
            clearM();
        }
    }
    protected void btnAltar_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            int nroCuenta = Convert.ToInt32(ddlPacientes.SelectedValue);
            int idDoctor = Convert.ToInt32(ddlDoctor.SelectedValue);
            DateTime fecha = ObtenerFecha();
            decimal honorarios = Convert.ToDecimal(txtHonorarios.Text);
            decimal precio = Convert.ToDecimal(txtPrecio.Text);
            string ins = "update Hospitalizacion " +
                    "set Honorarios=@Honorarios, Fecha_Hora_Alta=@fecha,Precio_Internado=@precio"
                    +" where idHospitalizacion = @idHospitalizacion";
            string cadenaCon = ConfigurationManager.ConnectionStrings["ConexionHospital"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(cadenaCon))
                {
                    using (SqlCommand cmd = new SqlCommand(ins, con))
                    {
                        int idHospitalizacion = 1;
                        string sel = "select idHospitalizacion as id from Hospitalizacion"
                            + " where nroCuenta = @nroCuenta and idDoctor =@idDoctor";
                        SqlCommand select = new SqlCommand(sel, con);
                        select.Parameters.AddWithValue("nroCuenta",nroCuenta);
                        select.Parameters.AddWithValue("idDoctor",idDoctor);
                        con.Open();
                        //SqlDataReader dr = select.ExecuteReader();
                        //while (dr.Read())
                        //{
                        //    idHospitalizacion = dr.GetInt32(0);
                        //}
                        //dr.Close();
                        idHospitalizacion = Convert.ToInt32(select.ExecuteScalar());
                        con.Close();
                        cmd.Parameters.AddWithValue("idHospitalizacion", idHospitalizacion);
                        cmd.Parameters.AddWithValue("fecha", fecha);
                        cmd.Parameters.AddWithValue("Honorarios", honorarios);
                        cmd.Parameters.AddWithValue("precio", precio);
                        con.Open();
                        int res = cmd.ExecuteNonQuery();
                        con.Close();
                        sel = "insert into Medicamentos_Hospitalizaciones values"
                        + " (@idM,@idH,@idVia,@dosis,@cant)";
                        for (int i = 0; i < list.Count; i++)
                        {
                            select = new SqlCommand(sel, con);
                            select.Parameters.AddWithValue("idM",list[i].idMedicina);
                            select.Parameters.AddWithValue("idH",idHospitalizacion);
                            select.Parameters.AddWithValue("idVia",list[i].idVia);
                            select.Parameters.AddWithValue("dosis",list[i].Dosis);
                            select.Parameters.AddWithValue("cant",list[i].cant);
                            con.Open();
                            select.ExecuteNonQuery();
                            con.Close();
                        }
                            if (res == 1)
                            {
                                MessageBox.Show("Paciente dad@ de alta!");
                                Response.Redirect("~/Alta.aspx");
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