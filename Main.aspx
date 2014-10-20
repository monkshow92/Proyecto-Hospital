<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    </p>
        <p>
            <asp:ImageButton ID="imgbtnLogin" runat="server" CssClass="btnSesion" ImageUrl="~/images/user.png" OnClick="ImageButton4_Click" />
            <span class="Etiqueta">Iniciar Sesion
            </span>
            <asp:ImageButton ID="imgbtnLogOut" runat="server" CssClass="btnSesion" ImageUrl="~/images/lock.png" OnClick="imgbtnLogOut_Click" />
            <span class="Etiqueta">Cerrar Sesion</span></p>
        <p>
            <asp:Label ID="lblUsuario" runat="server" CssClass="etiq"></asp:Label>
        </p>
        <img src="images/tituloMain.png" alt="Titulo Bienvenida" class="nuevoEstilo6" />
        <br />
    <div>

    <div>
        <asp:ImageButton ID="imgbtnPaciente" runat="server" CssClass="btnImg" ImageUrl="~/images/paciente (2).jpg" PostBackUrl="~/Pacientes.aspx" OnClick="ImageButton1_Click" />
        <asp:ImageButton ID="imgbtnDoctor" runat="server" CssClass="btnImg" ImageUrl="~/images/medicos-03.png" PostBackUrl="~/Doctores.aspx" OnClick="ImageButton2_Click" />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="Etiqueta">Agregar Paciente</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="Etiqueta">&nbsp;&nbsp;&nbsp; Agregar Doctor</span>&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <asp:ImageButton ID="imgbtnCita" runat="server" CssClass="btnImg" ImageUrl="~/images/appointment.jpg" OnClick="ImageButton3_Click"/>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="btnImg" ImageUrl="~/images/Hospitalizar.png" OnClick="ImageButton1_Click1" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Etiqueta">Agregar Cita&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Agregar Hospitalizacion<br />
        </span>
        <p>

            <asp:ImageButton ID="btnExamenes" runat="server" CssClass="btnImg" ImageUrl="~/images/Examenes.png" OnClick="btnExamenes_Click" />

            <asp:ImageButton ID="ImageButton2" runat="server" CssClass="btnImg" ImageUrl="~/images/altar.png" OnClick="ImageButton2_Click1" />

        </p>
        <p>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" CssClass="Etiqueta" Text="Examenes"></asp:Label>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" CssClass="Etiqueta" Text="Dar de Alta"></asp:Label>

        </p>
        <p>

            &nbsp;</p>
        </div>

    </div>
</asp:Content>

