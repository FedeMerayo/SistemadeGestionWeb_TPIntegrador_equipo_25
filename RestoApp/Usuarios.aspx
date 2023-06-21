﻿<%@ Page Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="RestoApp.Usuarios"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  <div class="container">

    <div class="row" style="justify-content:center; margin-top:20px;">
        <div class="col-6">
   <div class="input-group mb-3" style="box-shadow:0 2px 4px rgba(0, 0, 0, 0.3)">
  <asp:Textbox type="text" class="form-control" placeholder="Ingresa tu busqueda" id="TxtBusqueda" runat="server"></asp:Textbox>
  <asp:LinkButton class="btn btn-dark" type="button" id="BtnBusqueda" runat="server"><i class="fa-solid fa-magnifying-glass"></i></asp:LinkButton>
    </div>
            </div>
                </div>
      <div class="row" style="margin-top:20px; justify-content:center;">
          <div class="col-9" style="height:500px; overflow-y: auto;">
      <asp:GridView ID="GDVEmpleados" runat="server" style="border-radius:5px; margin-right:0px;padding-right:0px;" BackColor="Ivory" AllowSorting=true OnSorting="GDVEmpleados_Sorting" OnRowDataBound="GDVEmpleados_RowDataBound" OnSelectedIndexChanged="GDVEmpleados_SelectedIndexChanged" AutoPostBack="true" DataKeyNames="IdUsuario" OnRowCommand="GDVEmpleados_RowCommand" >
            <HeaderStyle HorizontalAlign="Center" BackColor="#212529" BorderColor="#666666" cssClass="celda" ForeColor="#CCCCCC" />
             <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" cssClass="celda"/>

             <Columns>

                             <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnEliminarusuario" runat="server" class="btn btn-dark" OnClick="BtnEliminarusuario_Click"><i class="fa-solid fa-user-minus"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                 <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnModificarusuario" runat="server" class="btn btn-dark">  <i class="fa-solid fa-user-gear"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>


   
      </asp:GridView>
           </div>      





 <div class="row" style="justify-content:center;">
    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-dark dropdown-toggle" style="margin-left:20px; margin-bottom:10px; height:40px; width:77%;" data-bs-toggle="dropdown" data-bs-theme="dark"></asp:LinkButton>
    <asp:Panel ID="DropdownPanel" runat="server" CssClass="dropdown-menu" style="width:64%; background-color:#343a40" ForeColor="#CCCCCC">
        <div class="col">
            <div class="row">
        <asp:Label ID="LblId" runat="server" Text="Id:"></asp:Label>
        <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" style="width:80%; margin-left:14px;"></asp:TextBox>
                </div>
            <div class="row">
             <asp:Label ID="LblMail" runat="server" Text="Mail:"></asp:Label>
        <asp:TextBox ID="TxtMail" runat="server" CssClass="form-control" style="width:80%; margin-left:14px;"></asp:TextBox>   
          </div>
           <div class="row">
         <asp:Label ID="LblNombres" runat="server" Text="Nombres:"></asp:Label>
        <asp:TextBox ID="TxtNombres" runat="server" CssClass="form-control" style="width:80%; margin-left:14px;"></asp:TextBox>
</div>
                <div class="row">
         <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" TextMode="Password" style="width:80%; margin-left:14px;"></asp:TextBox> 
  </div>
            <div class="row">
        <asp:Label ID="LblApellidos" runat="server" Text="Apellidos:"></asp:Label>
        <asp:TextBox ID="TxtApellidos" runat="server" CssClass="form-control" style="width:80%; margin-left:14px;"></asp:TextBox>  
                </div>
            <div class="row">
          <asp:Label ID="LblFdA" runat="server" Text="Fecha de alta:"></asp:Label>
        <asp:TextBox ID="TxtFdA" runat="server" CssClass="form-control" style="width:80%; margin-left:14px;"></asp:TextBox>   
     </div>
  <div class="row">
                    <asp:Label ID="LblFdB" runat="server" Text="Fecha de baja:"></asp:Label>
        <asp:TextBox ID="TxtFdB" runat="server" CssClass="form-control" style="width:80%; margin-left:14px;"></asp:TextBox>  
      </div>
            </div>
    </asp:Panel>
      </div>
</div>
</asp:Content>

