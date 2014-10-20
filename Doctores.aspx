<%@ Page Title="Doctores" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Doctores.aspx.cs" Inherits="Doctores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img alt="Banner Doctores" src="images/doctors.jpg" /></p>
        <p>
        
            <span class="TituloMain">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos del Doctor</span></p>
        <asp:ValidationSummary ID="vs" runat="server" HeaderText="Por favor corrija estas entradas:" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="val"/>
        <p>
        
            <span class="etiq">Nombres:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txtNombre" ID="rfvNombre" runat="server" ErrorMessage="Nombre del doctor" ForeColor="Red" CssClass="rfv" SetFocusOnError="True">El Nombre es Requerido</asp:RequiredFieldValidator><br />
    </p>
        <p>
        
            <span class="etiq">Apellidos:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ControlToValidate="txtApellido" runat="server" ErrorMessage="Apellido del Doctor" ForeColor="Red" CssClass="rfv">El Apellido es Requerido</asp:RequiredFieldValidator><br />
    </p>
        <p>
        
            <span class="etiq">Fecha Nacimiento:
            <asp:DropDownList ID="ddlMes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMes_SelectedIndexChanged" Width="87px">
                <asp:ListItem>Enero</asp:ListItem>
                <asp:ListItem>Febrero</asp:ListItem>
                <asp:ListItem>Marzo</asp:ListItem>
                <asp:ListItem>Abril</asp:ListItem>
                <asp:ListItem>Mayo</asp:ListItem>
                <asp:ListItem>Junio</asp:ListItem>
                <asp:ListItem>Julio</asp:ListItem>
                <asp:ListItem>Agosto</asp:ListItem>
                <asp:ListItem>Septiembre</asp:ListItem>
                <asp:ListItem>Octubre</asp:ListItem>
                <asp:ListItem>Noviembre</asp:ListItem>
                <asp:ListItem>Diciembre</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlDia" runat="server" Width="56px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlanio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMes_SelectedIndexChanged" Width="63px">
            </asp:DropDownList>

            </span></p>
        <p>
        
            <span class="etiq">Fecha Ingreso:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Calendar ID="calIngreso" runat="server"></asp:Calendar>
        </p>
        <p>
        
            <span class="etiq">Cargo:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlCargo" runat="server" DataSourceID="SqlDataSource1" DataTextField="CargoMedico" DataValueField="idCargo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [CargoMedico]"></asp:SqlDataSource>
    </p>
        <p>
        
            <span class="etiq">Especialidad:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlEspecialidad" runat="server" DataSourceID="SqlDataSource2" DataTextField="Especialidad" DataValueField="idEspecialidad">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [Especialidad]"></asp:SqlDataSource>
        
    </p>
        <p>
        
            <asp:Label ID="Label1" runat="server" CssClass="etiq" Text="Usuario:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="rfv" ErrorMessage="Usuario" ControlToValidate="txtUsuario">El Usuario es Requerido</asp:RequiredFieldValidator>
        
    </p>
        <p>
        
            <asp:Label ID="Label2" runat="server" CssClass="etiq" Text="Contraseña:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtContra" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="rfv" ErrorMessage="Contraseña" ControlToValidate="txtContra">La Contraseña es Requerida</asp:RequiredFieldValidator>
        
    </p>
        <p>
        
            <asp:Label ID="Label3" runat="server" CssClass="etiq" Text="Confirmar Contraseña:"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtConfirm" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirmar Contraseña" CssClass="rfv" ControlToCompare="txtContra" ControlToValidate="txtConfirm">Confirme la Contraseña</asp:CompareValidator>
        
    </p>
        <p>
        
            <br />
            <asp:Button ID="btnDoctor" runat="server" CssClass="nuevoEstilo4" OnClick="btnDoctor_Click" BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" Text="Agregar Doctor" />
            <asp:Button ID="Button1" runat="server" CssClass="nuevoEstilo4" OnClick="Button1_Click" BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" Text="Cancelar" />
        
    </p>
        <p>
        
        <br />
    </p>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="Menu">
    <ul>
        <li class="m1"><a href="Main.aspx"><span><b>Inicio</b></span></a></li>
        <li class="m2"><a href="Pacientes.aspx"><span><b>Pacientes</b></span></a></li>
        <li class="m3"><a href="Doctores.aspx" class="active"><span><b>Doctores</b></span></a></li>
        <li class="m4"><a href="Citas.aspx"><span><b>Citas</b></span></a></li>
        <li class="m5 last"><a href="AcercaDe.aspx"><span><b>Quienes Somos</b></span></a></li>
    </ul>
</asp:Content>


