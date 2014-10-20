<%@ Page Title="Hospitalizacion" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hospitalizacion.aspx.cs" Inherits="Hospitalizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <img alt="" class="margenIzq" src="images/hospitalizacion.png" /></p>
<p>
            <span class="auto-style1">Datos de la Hospitalizacion</span></p>
            &nbsp;<br />
        <p>

            <asp:Label ID="Label1" runat="server" CssClass="etiq" Text="Paciente:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="ddlPacientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreC" DataValueField="nroCuenta" Width="50%">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="select C.numCuenta as nroCuenta, P.Nombres + ' ' + P.Apellidos as NombreC 
from Cuenta C inner join Paciente P on P.idPaciente = C.idPaciente"></asp:SqlDataSource>

        </p>
        <p>

            <asp:Label ID="Label2" runat="server" CssClass="etiq" Text="Doctor:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlDoctor" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreC" DataValueField="idDoctor" Width="50%">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="select idDoctor, Nombres + ' ' + Apellidos as nombreC from Doctor"></asp:SqlDataSource>

        </p>
        <p>

            <asp:Label ID="Label5" runat="server" CssClass="etiq" Text="Fecha:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

        </p>
        <p>

            <asp:Label ID="Label6" runat="server" CssClass="etiq" Text="Hora:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlHora" runat="server" Width="46px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem Value="0">12</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlMinutos" runat="server" Width="56px">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlAmPm" runat="server">
                <asp:ListItem>a.m.</asp:ListItem>
                <asp:ListItem>p.m.</asp:ListItem>
            </asp:DropDownList>

        </p>
        <p>

            <asp:Label ID="Label4" runat="server" CssClass="etiq" Text="Motivo:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtMotivo" runat="server" TextMode="MultiLine" Width="171px"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvFecha0" ControlToValidate="txtMotivo" runat="server" CssClass="rfv" ErrorMessage="Motivo" SetFocusOnError="True" Display="Dynamic">El Motivo es Requerido</asp:RequiredFieldValidator>

        </p>
        <p>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:GridView ID="dgvCitas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" CssClass="dgv">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                    <asp:BoundField DataField="Doctor" HeaderText="Doctor" ReadOnly="True" SortExpression="Doctor" />
                    <asp:BoundField DataField="Fecha_Hora" HeaderText="Fecha_Hora" SortExpression="Fecha_Hora" />
                    <asp:BoundField DataField="Motivo" HeaderText="Motivo" SortExpression="Motivo" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT P.nombres + ' ' +P.apellidos as Paciente, D.nombres + ' ' +D.apellidos as Doctor, [Fecha_Hora], [Motivo] FROM [Hospitalizacion] H inner join Cuenta Cu
on Cu.numCuenta = H.nroCuenta
inner join Paciente P 
on P.idPaciente = Cu.idPaciente
inner join Doctor D 
on D.idDoctor = H.idDoctor"></asp:SqlDataSource>

        </p>
        <p>

            <asp:Button ID="btnRegistrar" runat="server" CssClass="nuevoEstilo4" OnClick="btnRegistrar_Click" BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" Text="Registrar" />

        </p>
        <p>

            &nbsp;</p>
</asp:Content>

