<%@ Page Title="Inicio de Sesion" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .txt {
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
    <ul>
        <li class="m1"><a href="Main.aspx"><span><b>Inicio</b></span></a></li>
        <li class="m2"><a href="Pacientes.aspx"><span><b>Pacientes</b></span></a></li>
        <li class="m3"><a href="Doctores.aspx"><span><b>Doctores</b></span></a></li>
        <li class="m4"><a href="Citas.aspx"><span><b>Citas</b></span></a></li>
        <li class="m5 last"><a href="AcercaDe.aspx"><span><b>Quienes Somos</b></span></a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
        <p>
        </p>
        <p>
            <img alt="" class="nuevoEstilo5" src="images/users.png" /></p>
        <p>
            <asp:Label ID="Label1" runat="server" CssClass="etiq" Text="Usuario:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="txt" Width="120px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" CssClass="rfv" ControlToValidate="txtUsuario" ErrorMessage="Ingrese el Usuario" Display="Dynamic"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" CssClass="etiq" Text="Contraseña:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtContra" runat="server" CssClass="txt" TextMode="Password" Width="120px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="rfv" ErrorMessage="Ingrese la contraseña" ControlToValidate="txtContra" Display="Dynamic"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesion" OnClick="btnLogin_Click" BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" />
        </p>
        <p>
            &nbsp;</p>
</asp:Content>

