<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formUbicaciones.aspx.cs" Inherits="CRUD_map_api.formUbicaciones" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!-- título de la página -->
    <title>Control de ubicaciones</title>

    <!-- Boostrap y jQuery-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <!-- Complemento -->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyDlv2PNwLztXH4VUYD9J9jW5vuv-T6YzRs'></script>

    <!-- javaScript - locationpicker.jquery.js -->
    <script src="javaScript/locationpicker.jquery.js"></script>
    <!-- style -->

</head>

<body>

    <form id="form1" runat="server">       
        
        <!-- contenedor -->
        <div class="container">

            <!-- fila -->
            <div class="row">

                <!-- columna 1 -->
                <div class="col-md-4">
                    <div class="form-group">
                        <!-- se mostrara la ubicación -->
                        <label for="labelUbicacion">Ubicación</label>
                        <!-- elemento hidden que nos permitira manipular los datos en la Base de Datos -->
                        <asp:HiddenField ID="txtID" runat="server" />
                        <!-- TextBox -->
                        <asp:TextBox ID="txtUbicacion" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- selección de ubicación -->
                    <div class="form-group">
                        <div id="ModalMapPreview" style="width: 100%; height: 300px;"></div>
                    </div>

                    <div class="form-group">

                        <!-- latitud -->
                        <label for="labelat">Lat:</label>
                        <asp:TextBox ID="txtLat" Text="27.4827" CssClass="form-control" runat="server"></asp:TextBox>

                        <!-- longitud -->
                        <label for="labelong">Long:</label>
                        <asp:TextBox ID="txtLong" Text="-109.9306" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                    <!-- CRUD - botones -->
                    <div class="form-group">

                        <asp:Button ID="btnAgregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false" />
                        <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" enabled="false"/>
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" UseSubmitBehavior="false" enabled="false"/>
                        <asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false" />

                    </div>

                </div>

                <!-- columna 2 -->
                <div class="col-md-8">

                    <br />
                    <h1>Ubicaciones</h1>

                </div>

                <script>
                    /* muestra el mapa */
                    $('#ModalMapPreview').locationpicker({

                        /* ubicación */
                        location: {

                            /* latitud */
                            latitude: $('#<%=txtLat.ClientID%>').val(),
                            /* longitud */
                            longitude: $('#<%=txtLong.ClientID%>').val()

                        },

                        /* buscador */
                        inputBinding: {
                        latitudeInput: $('#<%=txtLat.ClientID%>'),
                        longitudeInput: $('#<%=txtLong.ClientID%>'),
                        locationNameInput: $('#<%=txtUbicacion.ClientID%>')
                        },

                        /* guarda la ultima ubicación marcada */
                        onchanged: function (currentLocation, radius, isMarkerDropped) {
                        $('#ubicacion').html($('#<%=txtUbicacion.ClientID%>').val());
                        }

                    });

                    $('ModalMap').on('show.bs.modal', function () {
                        $('#ModalMapPreview').locationpicker('autosize');
                    })
                </script>

            </div>

        </div>

    </form>

</body>

</html>
