<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CustomerCare.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CustomerCare</title>
    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="favicon.ico" rel="icon" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <img id="background" alt="" src="<%=ImagesFolder%>background.png" />
        <div id="scroller" style="text-align: center; align-content: center; align-items: center;">
            <img id="agua1" src="<%=ImagesFolder%>agua1.png" />
            <img id="agua2" src="<%=ImagesFolder%>agua2.png" />
            <img id="logo" alt="" src="<%=ImagesFolder%>logo.png" /><br />
            <br />
            <asp:HiddenField
                ID="hfdUsu" runat="server" />
            <table style="width: 100%">
                <tr>
                    <td></td>
                    <td style="width: 300px;">
                        <asp:Panel ID="Panel1" runat="server" Height="250px" Width="350px" HorizontalAlign="Center">
                            <%-- <ASP:Panel id="panDatos" runat="server" backimageurl="" height="520px" width="540px">--%>
                            <table style="width: 100%;">
                                <tr>
                                    <td style="height: 27px; vertical-align: bottom; text-align: center;" colspan="4">
                                        <asp:CustomValidator ID="Validador" runat="server" ErrorMessage="¡Nombre de usuario o contraseña incorrecta!" ForeColor="White" OnServerValidate="Validador_ServerValidate" Enabled="true" Visible="true" Display="Static" />
                                        <asp:CustomValidator ID="ValidadorCambioContrasena" runat="server" ErrorMessage="¡Contraseña incorrecta!" ForeColor="White" OnServerValidate="ValidadorCambioContrasena_ServerValidate" Enabled="false" Visible="false" />
                                    </td>
                                </tr>
                                <tr style="height: 26px">
                                    <td style="width: 150px"></td>
                                    <td style="width: 90px; text-align: left; font-size: 12px;">
                                        <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="edUsuario" runat="server" Width="150px" MaxLength="20" ToolTip="Escribe tu nombre de usuario"></asp:TextBox></td>
                                    <td style="width: 150px;"></td>
                                </tr>
                                <tr>
                                    <td style="HEIGHT: 26px"></td>
                                    <td style="HEIGHT: 26px; width: 90px; text-align: left; font-size: 12px;">
                                        <asp:Label ID="Label4" runat="server" Text="Contraseña"></asp:Label>
                                    </td>
                                    <td style="HEIGHT: 26px; text-align: right;">
                                        <asp:TextBox ID="edPassword" runat="server" Width="150px" MaxLength="30" ToolTip="Introduce tu contraseña" TextMode="Password"></asp:TextBox></td>
                                    <td style="HEIGHT: 26px; width: 30px;"></td>
                                </tr>
                                <tr style="height: 22px">
                                    <td></td>
                                    <td style="text-align: left; font-size: 12px;">
                                        <asp:Label ID="Label5" runat="server" Text="Repetir" Visible="false"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chbRecuerdame" runat="server" Text="Recuérdame" />
                                        <asp:TextBox ID="edPassword2" runat="server" Width="150px" MaxLength="30"
                                            ToolTip="Repite la contraseña nueva"
                                            TextMode="Password" Visible="false"></asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr style="height: 36px">
                                    <td></td>
                                    <td style="text-align: left; vertical-align: bottom;" colspan="2">
                                        <asp:Button ID="btnLogin" runat="server" Text="Continuar" Width="100%" OnClick="btnLogin_Click"></asp:Button>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="HEIGHT: 120px; vertical-align: top; text-align: center;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="¡Escriba su nombre de usuario!" ControlToValidate="edUsuario" ForeColor="White" Font-Size="X-Small" Enabled="true" Visible="true"></asp:RequiredFieldValidator><asp:CompareValidator
                                            ID="Iguales" runat="server" Font-Size="X-Small" ErrorMessage="¡Las contraseñas no son iguales!" Enabled="false" ControlToValidate="edPassword2" ControlToCompare="edPassword" Visible="false"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="vertical-align: top; text-align: center;">
                                        <asp:Label ID="Label2" runat="server" ForeColor="White" Font-Size="Larger">Su sesión ha caducado</asp:Label><asp:Label ID="Label6" runat="server" ForeColor="White" Font-Size="Larger" Visible="false">Debe cambiar su contraseña</asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="vertical-align: top; text-align: center;">
                                        <asp:Label ID="Label3" runat="server" ForeColor="White" Font-Size="X-Small">Por favor reingrese su usuario y contraseña</asp:Label></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
