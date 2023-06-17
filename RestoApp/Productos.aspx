﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="RestoApp.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentProductos" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h4 class="text-gray-100">Hola, <%= usuario?.Nombres %> <%= usuario?.Apellidos %> (<%= usuario?.Tipo %>)</h4>

    <div class="row bg-white rounded m-2 p-4">

        <div class="row p-2">
            <div class="col-2"> <p class="h2">Filtrar lista</p> </div>
            <asp:TextBox CssClass="col m-1 form-control" placeholder="Buscar" id="TxtBuscar" runat="server"></asp:TextBox>
              <asp:LinkButton runat="server" CssClass="col-2 btn btn-dark m-1"> <i class="fa-solid fa-magnifying-glass"></i></asp:LinkButton>
        </div>
      
        <br /><br />

        <div class="row">
            
        <div class="col-2 ">
            <div class="row p-1">
            <asp:DropDownList ID="DDLEstado" runat="server" CssClass="btn btn-dark btn-sm"></asp:DropDownList>
            </div>

        <div class="row p-1">
            <asp:DropDownList ID="DDLCategorias" runat="server" CssClass="btn btn-dark btn-sm"></asp:DropDownList>
        </div>
        </div>



           <div class="col-2">
               <div class="row-2 ">
                   PRECIO
                   <asp:TextBox runat="server" CssClass=" col-md-2"></asp:TextBox>
                   - <asp:TextBox runat="server" CssClass=" col-md-2"></asp:TextBox>
               </div>
                  <div class="row-2 mt-2">
                     <asp:DropDownList ID="DDLPrecios" runat="server" CssClass="btn btn-dark btn-sm"></asp:DropDownList>
                    </div>
            </div>
          <div class="col-2">
               <div class="row-2 ">
                   STOCK
                   <asp:TextBox runat="server" CssClass=" col-md-2"></asp:TextBox>
                   - <asp:TextBox runat="server" CssClass=" col-md-2"></asp:TextBox>
               </div>
                  <div class="row-2 mt-2">
                     <asp:DropDownList ID="DDLStock" runat="server" CssClass="btn btn-dark btn-sm"></asp:DropDownList>
                    </div>
            </div>

                <div class="col-2">

                    <asp:CheckBoxList ID="CheckBoxAtributos" runat="server"></asp:CheckBoxList>

         </div>

        <div class="col-2 p">
            <div class="row">
                <asp:Button runat="server" CssClass="btn btn-dark" Text="Aplicar filtros"/>
            </div>
               <div class="row pt-1">
                <asp:Button runat="server" CssClass="btn btn-dark" Text="Limpiar filtros"/>
            </div>
        </div>
        

            </div>

        </div>

             <div class="row bg-white rounded m-2 p-4">
                 <asp:GridView ID="GVProductos" CssClass="table" runat="server">
                     

                 </asp:GridView>
                 </div>




</asp:Content>
