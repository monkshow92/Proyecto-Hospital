<%@ Page Title="Examenes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Examenes.aspx.cs" Inherits="Examenes" %>

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
        <img alt="Banner Cita Medica" src="images/Examinar.png" class="margenIzq" /></p>
        <p>
            <span class="auto-style1">Datos del Examen</span></p>
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

            <asp:CheckBox ID="cbPaciente" runat="server" CssClass="margen" ForeColor="Black" Text="Paciente Registrado" />

        </p>
    <p>

            <asp:Label ID="Label2" runat="server" CssClass="etiq" Text="Precio:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="txt" TextMode="Number"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio" CssClass="rfv" ErrorMessage="Precio Requerido"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrecio" CssClass="rfv" ErrorMessage="Dinero" ValidationExpression="\d+(.\d{2})?"></asp:RegularExpressionValidator>

        </p>
    <p>

            <asp:Label ID="Label3" runat="server" CssClass="etiq" Text="Tipo:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlTipoExamen" runat="server" DataSourceID="SqlDataSource2" DataTextField="TipoExamen" DataValueField="idTipoExamen" Height="16px" Width="274px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [TipoExamen]"></asp:SqlDataSource>

        </p>
    <hr />
    <p>

&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Label ID="Label4" runat="server" CssClass="parriba" Text="Instrucciones:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:ListBox ID="lstInstrucciones" runat="server" DataSourceID="SqlDataSource3" DataTextField="Instruccion" DataValueField="idInstruccion" SelectionMode="Multiple" Width="273px"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT * FROM [Instruccion]" InsertCommand="INSERT INTO Instruccion(idInstruccion, Instruccion) VALUES (@id, @instruccion)">
                <InsertParameters>
                    <asp:Parameter Name="id" />
                    <asp:Parameter Name="instruccion" />
                </InsertParameters>
            </asp:SqlDataSource>

        </p>
    <p>

            <asp:Label ID="Label5" runat="server" CssClass="etiq" Text="Nueva Instruccion:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtInstruccion" runat="server" Width="232px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" ID="btnAdd" runat="server" Text="Añadir" OnClick="btnAdd_Click" />

        </p>
    <hr />
        <p>

            <asp:GridView ID="dgvCitas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" CssClass="dgv">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                    <asp:BoundField DataField="TipoExamen" HeaderText="Tipo Examen" SortExpression="TipoExamen" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionHospital %>" SelectCommand="SELECT P.nombres + ' ' +P.apellidos as Paciente,  T.TipoExamen, E.Precio
FROM Examen E left join Cuenta Cu
on Cu.numCuenta = E.nroCuenta
left join Paciente P 
on P.idPaciente = Cu.idPaciente
left join TipoExamen T
on T.idTipoExamen = E.idTipo
"></asp:SqlDataSource>

        </p>
    <p>

            &nbsp;</p>
    <p>

            <asp:Button BackColor="#00CCFF" BorderColor="Aqua" BorderStyle="Solid" Font-Bold="True" ForeColor="Yellow" ID="btnRegistrar" runat="server" CssClass="nuevoEstilo4" Text="Registrar" OnClick="btnRegistrar_Click" />

        </p>
    <p>

            &nbsp;</p>
</asp:Content>

