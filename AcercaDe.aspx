<%@ Page Title="Quienes Somos" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AcercaDe.aspx.cs" Inherits="AcercaDe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <p class="aligncenter">
            <br />
            <span class="auto-style1">UNIVERSIDAD NACIONAL AUTONOMA DE HONDURAS</span></p>
        <p class="auto-style1">
            ESCUELA DE MATEMATICA</p>
        <p class="auto-style1">
            CARRERA DE MATEMATICA</p>
        <asp:BulletedList ID="BulletedList1" runat="server" CssClass="nuevoEstilo5" ForeColor="Black" Width="401px">
            <asp:ListItem>Clase:       Programacion Comercial</asp:ListItem>
            <asp:ListItem>       </asp:ListItem>
            <asp:ListItem>Seccion: 0800</asp:ListItem>
            <asp:ListItem>    </asp:ListItem>
            <asp:ListItem>Catedratico: Juan Carlos Leonardo Vargas</asp:ListItem>
            <asp:ListItem>    </asp:ListItem>
            <asp:ListItem>Roman Josue de las Heras Torres</asp:ListItem>
        </asp:BulletedList>
        <br />
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="Menu">
    <ul>
        <li class="m1"><a href="Main.aspx"><span><b>Inicio</b></span></a></li>
        <li class="m2"><a href="Pacientes.aspx"><span><b>Pacientes</b></span></a></li>
        <li class="m3"><a href="Doctores.aspx"><span><b>Doctores</b></span></a></li>
        <li class="m4"><a href="Citas.aspx"><span><b>Citas</b></span></a></li>
        <li class="m5 last"><a href="AcercaDe.aspx"  class="active"><span><b>Quienes Somos</b></span></a></li>
    </ul>
</asp:Content>


