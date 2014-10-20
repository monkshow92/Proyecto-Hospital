using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pacientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            calIngreso.SelectedDate = DateTime.Now;
            for (int a = 2014; a > 1899; a--)
                ddlanio.Items.Add(new ListItem(a.ToString()));
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
        txtApellido.Text = "";
        txtNombre.Text = "";
        calIngreso.SelectedDate = DateTime.Today;
        txtNumSS.Text = "";
        ddlEstado.SelectedIndex = 0;
        ddlPais.SelectedIndex = 0;
        ddlReligion.SelectedIndex = 0;
        ddlSangre.SelectedIndex = 0;
        ddlSexo.SelectedIndex = 0;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void btnDoctor_Click(object sender, EventArgs e)
    {
        if(IsValid){
            string usuario = txtUsuario.Text;
            string contra = txtContra.Text;
            string ins = "exec registrar_usuario_sp @usuario";
            string cadenaCon = ConfigurationManager.ConnectionStrings["ConexionHospital"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(cadenaCon))
                {
                    using (SqlCommand cmd = new SqlCommand(ins, con))
                    {
                        int estado2 = 0;
                        cmd.Parameters.AddWithValue("usuario", usuario);
                        con.Open();
                        estado2 = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        if (estado2 == 0)
                        {
                            MessageBox.Show("Usuario ya registrado! Utilice otro, por favor.");
                            txtUsuario.Focus();
                            return;
                        }
                    }
                }
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
            string nombres = txtNombre.Text;
            string apellidos = txtApellido.Text;
            DateTime fechaNac = ObtenerFecha();
            DateTime fechaReg = calIngreso.SelectedDate;
            int estado = Convert.ToInt32(ddlEstado.SelectedValue);
            int sexo = Convert.ToInt32(ddlSexo.SelectedValue);
            int sangre = Convert.ToInt32(ddlSangre.SelectedValue);
            int religion = Convert.ToInt32(ddlReligion.SelectedValue);
            int pais = Convert.ToInt32(ddlPais.SelectedValue);
            string numSS = txtNumSS.Text;
            string ins1 = "insert into Paciente " +
                "(idPaciente,Nombres,Apellidos,FechaReg,FechaNac,idEstado,idSexo,idTipoSangre,idReligion,idPais)" +
                " values(@idPaciente,@nombres,@apellidos,@fechaReg,@fechaNac,@idEstado,@idSexo,@idSangre,@idReligion,@idPais)";
            try
            {
                using(SqlConnection con = new SqlConnection(cadenaCon)){
                using(SqlCommand cmd = new SqlCommand(ins1,con)){
                    int idPaciente = 1;
                    string sel = "select MAX(idPaciente) as id from Paciente";
                    SqlCommand select = new SqlCommand(sel, con);
                    con.Open();
                    idPaciente = Convert.ToInt32(select.ExecuteScalar());
                    con.Close();
                    cmd.Parameters.AddWithValue("nombres", nombres);
                    cmd.Parameters.AddWithValue("apellidos", apellidos);
                    cmd.Parameters.AddWithValue("fechaReg", fechaReg);
                    cmd.Parameters.AddWithValue("fechaNac", fechaNac);
                    cmd.Parameters.AddWithValue("idEstado", estado);
                    cmd.Parameters.AddWithValue("idSexo", sexo);
                    cmd.Parameters.AddWithValue("idSangre", sangre);
                    cmd.Parameters.AddWithValue("idReligion", religion);
                    cmd.Parameters.AddWithValue("idPais", pais);
                    cmd.Parameters.AddWithValue("idPaciente", idPaciente + 1);
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    con.Close();

                    //Cuenta del Paciente
                    int nroCuenta = 1;
                    sel = "select MAX(numCuenta) as nro from Cuenta";
                    select = new SqlCommand(sel, con);
                    con.Open();
                    nroCuenta = Convert.ToInt32(select.ExecuteScalar());
                    con.Close();
                    string ins2 = "insert into Cuenta (numCuenta,numSS,idPaciente) " +
                        " values(@nroCuenta,@numSS,@idPaciente)";
                    SqlCommand cmd2 = new SqlCommand(ins2, con);
                    cmd2.Parameters.AddWithValue("nroCuenta",nroCuenta+1);
                    cmd2.Parameters.AddWithValue("numSS", numSS);
                    cmd2.Parameters.AddWithValue("idPaciente",idPaciente + 1);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    //usuario
                    ins = "insert into Usuario " +
                " values(@usuario,@contra,'6',null,@idPac)";
                    cmd2 = new SqlCommand(ins, con);
                    cmd2.Parameters.AddWithValue("usuario", usuario);
                    cmd2.Parameters.AddWithValue("contra", contra);
                    cmd2.Parameters.AddWithValue("idPac", idPaciente + 1);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    Session["Usuario"] = usuario;
                    if (res == 1)
                        MessageBox.Show("Paciente agregado exitosamente!");                    
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
        DateTime fecha = new DateTime(anio, mes, dia);
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