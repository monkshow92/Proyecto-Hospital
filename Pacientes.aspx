<%@ Page Title="Pacientes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pacientes.aspx.cs" Inherits="Pacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <p>
            <img alt="Banner Pacientes" class="margenIzq" src="images/paciente_datos.jpg" /></p>
        <p>
            <span class="TituloMain">Datos del Paciente</span></p>
        <asp:ValidationSummary ID="vs" runat="server" HeaderText="Por favor corrija estas entradas:" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="val" ForeColor="Red"/>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label1" runat="server" CssClass="etiq" Text="Nombres:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="txtNombre" runat="server" CssClass="txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" CssClass="rfv" ErrorMessage="Nombre" SetFocusOnError="True" Display="Dynamic">Nombre Requerido</asp:RequiredFieldValidator>
            </p>
        <p>
            <asp:Label ID="Label2" runat="server" CssClass="etiq" Text="Apellidos:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtApellido" runat="server" CssClass="txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" CssClass="rfv" ErrorMessage="Apellido" Display="Dynamic">Apellido Requerido</asp:RequiredFieldValidator>
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
            <asp:Calendar ID="calIngreso" runat="server" SelectedDate="03/26/2014 05:39:46"></asp:Calendar>
        </p>
        <p>
        
            <asp:Label ID="Label3" runat="server" CssClass="etiq" Text="Estado Civil:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="ddl" DataSourceID="SqlDataSource1" DataTextField="nombreEstado" DataValueField="idEstado">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [EstadoCivil]"></asp:SqlDataSource>
        </p>
        <p>
        
            <asp:Label ID="Label4" runat="server" CssClass="etiq" Text="Sexo:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="ddl" DataSourceID="SqlDataSource2" DataTextField="sexo" DataValueField="idSexo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [Sexo]"></asp:SqlDataSource>
        </p>
        <p>
        
            <asp:Label ID="Label5" runat="server" CssClass="etiq" Text="Tipo Sangre:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlSangre" runat="server" CssClass="ddl" DataSourceID="SqlDataSource3" DataTextField="TipoSangre" DataValueField="idTipoSangre">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [TipoSangre]"></asp:SqlDataSource>
        </p>
        <p>
        
            <asp:Label ID="Label6" runat="server" CssClass="etiq" Text="Pais:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlPais" runat="server" CssClass="ddl" DataSourceID="SqlDataSource4" DataTextField="Pais" DataValueField="idPais">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [Pais]"></asp:SqlDataSource>
        </p>
        <p>
        
            <asp:Label ID="Label7" runat="server" CssClass="etiq" Text="Religion:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlReligion" runat="server" CssClass="ddl" DataSourceID="SqlDataSource5" DataTextField="NombreReligion" DataValueField="idReligion">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [Religion]"></asp:SqlDataSource>
        </p>
        <p>
        
            <span class="etiq">No. S.S.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtNumSS" runat="server" Height="17px" Width="120px" ToolTip="mm/dd/aaaa"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvNumSS" ControlToValidate="txtNumSS" runat="server" CssClass="rfv" ErrorMessage="No. Seguro Social" SetFocusOnError="True" Display="Dynamic">Se requiere el numero de seguro</asp:RequiredFieldValidator>

            </span></p>
        <p>
        
            <asp:Label ID="Label8" runat="server" CssClass="etiq" Text="Usuario:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="rfv" ErrorMessage="Usuario" ControlToValidate="txtUsuario">El Usuario es Requerido</asp:RequiredFieldValidator>
        
    </p>
        <p>
        
            <asp:Label ID="Label9" runat="server" CssClass="etiq" Text="Contraseña:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtContra" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="rfv" ErrorMessage="Contraseña" ControlToValidate="txtContra">La Contraseña es Requerida</asp:RequiredFieldValidator>
        
    </p>
        <p>
        
            <asp:Label ID="Label10" runat="server" CssClass="etiq" Text="Confirmar Contraseña:"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtConfirm" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirmar Contraseña" CssClass="rfv" ControlToCompare="txtContra" ControlToValidate="txtConfirm">Confirme la Contraseña</asp:CompareValidator>
        
    </p>
        <p>
        
            &nbsp;</p>
        <p>
        
            <asp:Button ID="btnPaciente" runat="server" CssClass="nuevoEstilo4" OnClick="btnDoctor_Click" BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" Text="Agregar Paciente" />
            <asp:Button ID="Button1" runat="server" CssClass="nuevoEstilo4" OnClick="Button1_Click" BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" Text="Cancelar" />
        
        </p>
        <p>
        
            &nbsp;</p>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="Menu">
    <ul>
        <li class="m1"><a href="Main.aspx"><span><b>Inicio</b></span></a></li>
        <li class="m2"><a href="Pacientes.aspx"  class="active"><span><b>Pacientes</b></span></a></li>
        <li class="m3"><a href="Doctores.aspx"><span><b>Doctores</b></span></a></li>
        <li class="m4"><a href="Citas.aspx"><span><b>Citas</b></span></a></li>
        <li class="m5 last"><a href="AcercaDe.aspx"><span><b>Quienes Somos</b></span></a></li>
    </ul>
</asp:Content>


