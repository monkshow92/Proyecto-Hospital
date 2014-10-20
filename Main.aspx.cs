using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string usuario = (Session["Usuario"] != null) ? Session["Usuario"].ToString() : null;
        if (usuario != null)
            lblUsuario.Text = "Bienvenid@ " + usuario + "!";
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Pacientes.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Doctores.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Usuario"] != null)
            Response.Redirect("~/Citas.aspx");
        else
            MessageBox.Show("Inicie Sesion primero!");
    }
    protected void imgbtnLogOut_Click(object sender, ImageClickEventArgs e)
    {
        Session["Usuario"] = null;
        lblUsuario.Text = "";
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        if (Session["Usuario"] != null)
            Response.Redirect("~/Hospitalizacion.aspx");
        else
            MessageBox.Show("Inicie Sesion primero!");
    }
    protected void btnExamenes_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Usuario"] != null)
            Response.Redirect("~/Examenes.aspx");
        else
            MessageBox.Show("Inicie Sesion primero!");
    }
    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {
        if (Session["Usuario"] != null)
            Response.Redirect("~/Alta.aspx");
        else
            MessageBox.Show("Inicie Sesion primero!");
    }
}