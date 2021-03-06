﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Unidades.aspx.cs" Inherits="CustomerCare.Administracion.Unidades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Estilos/Usuarios.css" rel="stylesheet" />
    <title></title>
    <link href="Estilos/Unidades.css" rel="stylesheet" />
    <script type="text/javascript">
        function tam_fram() {
            if (window.innerHeight) {
                //navegadores basados en mozilla 
                espacio_iframe = window.innerHeight - 33
            } else {
                if (document.body.clientHeight) {
                    //Navegadores basados en IExplorer, es que no tengo innerheight 
                    espacio_iframe = document.body.clientHeight - 33
                } else {
                    //otros navegadores 
                    espacio_iframe = 478
                }
            }
            var valor;
            valor = espacio_iframe.toString() + "px";
            document.getElementById("list").style.height = valor;
            //document.getElementById("Lista").style.height = (espacio_iframe-200).To()+"px";
            document.getElementById("det").style.height = valor;
            //document.write('<iframe frameborder="0" src="recursos/PDFs/AntecedentesRevolcucion.pdf" class="pdf" height="' + espacio_iframe + '">')

        }

        function estado() {
            if (document.getElementById("Requiriente").checked == true) {
                document.getElementById("Unidades").style.display = "block";
                document.getElementById("etqUnidad").style.display = "block";
            }
            else {
                document.getElementById("Unidades").style.display = "none";
                document.getElementById("etqUnidad").style.display = "none";
            }
        }

        function oculta() {
            document.getElementById("alerta_fondo").style.display = "none";
            document.getElementById("alerta_mns").style.display = "none";
        }

        function confirmacion() {
            document.getElementById("aef").style.display = "inline";
            document.getElementById("aem").style.display = "inline";
            document.getElementById("emns").textContent = "¿Esta seguro que desea eliminar el registro del usuario " + document.getElementById("Lista").SelectedText + "?";
        }

        function cancela() {
            document.getElementById("aef").style.display = "none";
            document.getElementById("aem").style.display = "none";
        }

        function SearchList() {
            var l = document.getElementById("Lista");
            var tb = document.getElementById("Buscar");
            //console.log("l: " + tb.value)
            for (var i = 0; i < l.options.length; i++)
                l.options[i].style.display="block";

            if (tb.value == "") {
                for (var i = 0; i < l.options.length; i++) {
                    //l.options[i].style.display = "block";
                    l.options[i].className = "normal";
                }
            }
            else {
                for (var i = 0; i < l.options.length; i++) {
                    if (l.options[i].textContent.toLowerCase().indexOf(tb.value.toLowerCase()) != -1) {
                        //l.options[i].style.display = "block";
                        l.options[i].className = "resaltar";
                    }
                    else {
                        l.options[i].style.display = "none";
                      //  l.options[i].display = "none";
                        l.options[i].className = "difuminar";
                    }
                }
            }
        }

        function ClearSelection(lb) {
            lb.selectedIndex = -1;
        }

    </script>
</head>
<body onclick="tam_fram();" onkeypress="tam_fram();" onload="tam_fram();" onresize="tam_fram();" onchange="tam_fram();" onsubmit="tam_fram();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="aef" class="alerta_fondo">
        </div>
        <div id="aem" class="alerta_mns">
            <div class="alerta_texto">
                <asp:Label ID="emns" runat="server" Text="" ClientIDMode="Static"></asp:Label>
            </div>
            <%--<div class="alerta_btn">
                <asp:Button ID="Si" CssClass="btn_mediano" runat="server" Text="Si" OnClick="Si_Click" />
                <input id="No" type="button" value="No" class="btn_mediano" onclick="cancela();" />
            </div>--%>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="Operacion" runat="server" />
                <asp:HiddenField ID="NumPerfil" runat="server" />
                <div id="alerta_fondo" runat="server" style="display: none !important;" class="alerta_fondo">
                </div>
                <div id="alerta_mns" runat="server" style="display: none !important;" class="alerta_mns">
                    <div class="alerta_texto">
                        <asp:Label ID="mns" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                    </div>
                    <div class="alerta_btn">
                        <input id="Aceptar" type="button" value="Aceptar" class="btn_mediano" onclick="oculta();" />
                    </div>
                </div>
                <div id="list" class="cont" style="width:240px;min-width:220px">
                    <div class="botones">
                        <asp:ImageButton ID="Nuevo" runat="server" ImageUrl="~/Administracion/Estilos/Imagenes/nuevo-usuario-icono-8071-32.png" ToolTip="Nueva Unidad" OnClientClick="tamfram();" ClientIDMode="Static" OnClick="Nuevo_Click" />
                        <asp:ImageButton ID="Modificar" runat="server" ImageUrl="~/Administracion/Estilos/Imagenes/editar-un-marcador-de-nombre-icono-8476-32.png" ToolTip="Modificar Datos de la Unidad" OnClick="Modificar_Click" ClientIDMode="Static" />
                        <%--<asp:ImageButton ID="Eliminar" runat="server" ImageUrl="~/Administracion/Estilos/Imagenes/eliminar-usuario-icono-5252-32.png" ToolTip="Eliminar Datos del Usuario" ClientIDMode="Static" OnClientClick="confirmacion();" />--%>
                    </div>
                    <div class="lista" >
                        <asp:CheckBox ID="bActivos" runat="server" Text="Mostrar solo activos" ClientIDMode="Static" Checked="True" AutoPostBack="True" OnCheckedChanged="bActivos_CheckedChanged" />
                        <asp:TextBox ID="Buscar" runat="server" onkeyup="SearchList();" Text="" CssClass="busc" ClientIDMode="Static" />
                        <asp:ListBox ID="Lista" CssClass="lista"  name="lista" runat="server" ClientIDMode="Static" OnSelectedIndexChanged="Lista_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
                    </div>
                </div>
                <div id="det" class="detalle" style="min-width:300px">
                    <div class="campo_boton">
                        <asp:Button ID="Guardar" runat="server" Text="Guardar" CssClass="btn" UseSubmitBehavior="False" OnClick="Guardar_Click" />
                        <asp:Button ID="Cancelar" runat="server" Text="Cancelar" CssClass="btn" UseSubmitBehavior="False" OnClick="Cancelar_Click" />
                    </div>
                    <div class="division">
                        <div class="campo">
                        <table>
                            <tr>
                                <td><asp:Label ID="tCodigo" Text="Código de unidad" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="Codigo" runat="server" ClientIDMode="Static" ReadOnly="True" style="width: 50px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Nombre de unidad
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Nombre_Unidad" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Alias
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Alias" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo_check">
                            <asp:CheckBox ID="Activo" runat="server" Text="Activo" ClientIDMode="Static" />
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Producto o servicio instalado
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="Productos" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Cliente al que pertenece
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="Clientes" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Sitio
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="Sitios" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    <%--    <div class="campo">
                            <table>
                                <tr>
                                    <td>Zona
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Zona" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Teléfono unidad
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TelefonoUnidad" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Fecha de Registro
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="FechaRegistro" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Fecha última actualización
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="FechaActualizacion" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Licitación
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Licitacion" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Técnico que atiende
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TecnicoAtiende" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Institución
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Instutucion" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>Contrato
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Contrato" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div> --%>
                    </div>
                    <div id="denc" runat="server" class="division">
                        <div class="campo_check">
                            <asp:CheckBox ID="esEncuestado" runat="server" Text="Encuestado" ClientIDMode="Static" />
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="LSesion" runat="server" Text="Sesión"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Sesion" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td><asp:Label ID="LDomicilio" runat="server" Text="Proyecto/Licitación"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Domicilio" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td><asp:Label ID="LCiudad" runat="server" Text="Ciudad"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Ciudad" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td><asp:Label ID="LResponsable" runat="server" Text="Mensaje de saludos"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Responsable" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td><asp:Label ID="LContacto" runat="server" Text="Ejecutivo de cuenta"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Contacto" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="campo">
                            <table>
                                <tr>
                                    <td><asp:Label ID="LHora" runat="server" Text="Hora Final"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Hora" runat="server" type="number" max="23" min="0" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background"></div>
                <div id="Progress">
                    <div class="windows8">
                        <div class="wBall" id="wBall_1">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_2">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_3">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_4">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_5">
                            <div class="wInnerBall">
                            </div>
                        </div>
                    </div>

                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
