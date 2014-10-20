using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Doctores : System.Web.UI.Page
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

    private void clear(){
        this.ddlanio.SelectedIndex = 0;
        this.ddlMes.SelectedIndex = 0;
        this.ddlDia.SelectedIndex = 0;
        txtApellido.Text="";
        txtNombre.Text="";
        ddlCargo.SelectedIndex=0;
        ddlEspecialidad.SelectedIndex=0;
        calIngreso.SelectedDate=DateTime.Today;
    }
    protected void btnDoctor_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
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
                        int estado = 0;
                        cmd.Parameters.AddWithValue("usuario", usuario);
                        con.Open();
                        estado = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        if (estado == 0){
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
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            DateTime fechaNac = ObtenerFecha();
            DateTime fechaReg = calIngreso.SelectedDate;
            int idCargo = Convert.ToInt32(ddlCargo.SelectedValue);
            int idEspec = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            ins = "insert into Doctor " +
                "(idDoctor,Nombres,Apellidos,FechaIngreso,FechaNac,idCargo,idEspecialidad)" +
                " values(@idDoctor,@nombre,@apellido,@fechaReg,@fechaNac,@idCargo,@idEspec)";
            try
            {
                using(SqlConnection con = new SqlConnection(cadenaCon)){
                using(SqlCommand cmd = new SqlCommand(ins,con)){
                    int idDoctor = 1;
                    string sel = "select MAX(idDoctor) as id from Doctor";
                    SqlCommand select = new SqlCommand(sel, con);
                    con.Open();
                    idDoctor = Convert.ToInt32(select.ExecuteScalar());
                    con.Close();
                    cmd.Parameters.AddWithValue("nombre", nombre);
                    cmd.Parameters.AddWithValue("apellido", apellido);
                    cmd.Parameters.AddWithValue("fechaReg", fechaReg);
                    cmd.Parameters.AddWithValue("fechaNac", fechaNac);
                    cmd.Parameters.AddWithValue("idCargo", idCargo);
                    cmd.Parameters.AddWithValue("idEspec", idEspec);
                    cmd.Parameters.AddWithValue("idDoctor", idDoctor + 1);
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    con.Close();
                    //usuario
                    ins = "insert into Usuario " +
                " values(@usuario,@contra,'5',@idDoctor,null)";
                    SqlCommand cmd2 = new SqlCommand(ins, con);
                    cmd2.Parameters.AddWithValue("usuario", usuario);
                    cmd2.Parameters.AddWithValue("contra", contra);
                    cmd2.Parameters.AddWithValue("idDoctor", idDoctor + 1);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    Session["Usuario"] = usuario;
                    if (res == 1)
                        MessageBox.Show("Doctor agregado exitosamente!");                    
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
protected void Button1_Click(object sender, EventArgs e)
{
    clear();
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