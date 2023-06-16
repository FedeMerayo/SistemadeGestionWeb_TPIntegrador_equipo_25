﻿const currentPagePath = document.location.pathname.toLowerCase();


//******* /Mesas.aspx *******/
if (currentPagePath.toLowerCase().indexOf('/mesas.aspx') !== -1) {

    //DROPDOWN
    //const ddMesa = document.getElementById("dropdown-mesa");
    //let MESAS = cantidadMesas;


    //for (i = 0; i < MESAS; i++) {
    //    ddMesa.innerHTML += `<li><a class="dropdown-item" id="ddMesa_${i + 1}">${i + 1
    //        }</a></li>`;
    //}


    //CARGAMOS MESAS GUARDADAS
    const mesas = document.getElementById("mesas");
    let numeroMesasGuardasArray = JSON.parse(numeroMesasGuardasJSON).filter(x => x != 0);
    const cantidadMesasGuardas = numeroMesasGuardasArray.length;

    //Test
    let mesasAsignadas = new Array(cantidadMesasGuardas)
    mesasAsignadas.fill(0)

   // let mesasAsignadas = JSON.parsemesasAsignadasJSON)
     
    function CargarMesasGuardas() {

        mesas.innerHTML = "";

        for (let i = 0; i < cantidadMesasGuardas; i++) {

            mesas.innerHTML += `
                <div class="col-6 col-sm-3 d-flex justify-content-center flex-column m-4" style="height: 150px; width: 150px;">
                    <div class="w-100 h-100 border rounded-circle border-dark-subtle p-1 btn">
                        <div class="bg-dark-subtle w-100 h-100 rounded-circle d-flex justify-content-center align-items-center" id="mesa_${numeroMesasGuardasArray[i]}">
                            <i class="fa-solid fa-utensils fs-4"></i>
                        </div>
                    </div>
                    <div class=" w-100 text-light d-flex justify-content-center">
                        <div class="w-50 bg-black rounded-4 text-center">
                            <small class="fw-bold">${numeroMesasGuardasArray[i]}</small>
                        </div>
                    </div>
                </div>
            `;

        };
    }

    (function () {
        CargarMesasGuardas()
    })();


    //CARGAMOS MESAS SELECCIONADAS DESDE DROPDOWN
    function CargarMesasSeleccion(i) {
        
        mesas.innerHTML = "";

        for (let j = 0; j < i ; j++) {
            if (mesasAsignadas[j] != '0') {
                mesas.innerHTML += `
            <div class="col-6 col-sm-3 d-flex justify-content-center flex-column m-4" style="height: 150px; width: 150px;">
                <div class="w-100 h-100 border rounded-circle border-dark-subtle p-1 btn">
                    <div class="bg-warning w-100 h-100 rounded-circle d-flex justify-content-center align-items-center" id="mesa_${j + i}">
                        <i class="fa-solid fa-utensils fs-4"></i>
                    </div>
                </div>
                <div class=" w-100 text-light d-flex justify-content-center">
                    <div class="w-50 bg-black rounded-4 text-center">
                        <small class="fw-bold">${numeroMesasGuardasArray[j]}</small>
                    </div>
                </div>
            </div>
            `;
            } else {
                mesas.innerHTML += `
            <div class="col-6 col-sm-3 d-flex justify-content-center flex-column m-4" style="height: 150px; width: 150px;">
                <div class="w-100 h-100 border rounded-circle border-dark-subtle p-1 btn">
                    <div class="bg-dark-subtle  w-100 h-100 rounded-circle d-flex justify-content-center align-items-center" id="mesa_${j + i}">
                        <i class="fa-solid fa-utensils fs-4"></i>
                    </div>
                </div>
                <div class=" w-100 text-light d-flex justify-content-center">
                    <div class="w-50 bg-black rounded-4 text-center">
                        <small class="fw-bold">${numeroMesasGuardasArray[j]}</small>
                    </div>
                </div>
            </div>
            `;

            }
        }

        for (let j = 0; j < i; j++) {

            if (mesasAsignadas[j] != 0) {
                document.getElementById(`mesa_${j + i}`).addEventListener("click", () => {
                    document.getElementById(`mesa_${j + i}`).classList.toggle("bg-warning");
                    document.getElementById(`mesa_${j + i}`).classList.toggle("bg-dark-subtle");
                    mesasAsignadas[j] = 0;
                    CargarMesasSeleccion(i);
                });
            } else {
                document.getElementById(`mesa_${j + i}`).addEventListener("click", () => {
                    document.getElementById(`mesa_${j + i}`).classList.toggle("bg-dark-subtle");
                    document.getElementById(`mesa_${j + i}`).classList.toggle("bg-warning");
                    mesasAsignadas[j] = 1;
                    CargarMesasSeleccion(i);
                });
            }
        }

    }

    const asignarMesas = document.getElementById("asignarMesa");

    asignarMesas.addEventListener('click', () => {
        CargarMesasSeleccion(cantidadMesasGuardas)
    })

    //// RENDERIZAMOS MESAS
    //const tituloGerenteMesas = document.getElementById("titulo_gerente_Mesas");

    //for (let i = 0; i < MESAS; i++) {
    //    document.getElementById(`ddMesa_${i + 1}`).addEventListener("click", () => {
    //        tituloGerenteMesas.textContent = "Elija las mesas que quiere activar";
    //        CargarMesasSeleccion(i);
    //    });
    //}


    // GUARDAMOS MESAS
    //btnGuardarMesas.addEventListener('click', () => {
    //    CargarMesasGuardas()
    //    btnGuardarMesas.classList.add("invisible")
    //    tituloGerenteMesas.textContent = "Asignar Mesas a Meseros";


    //    //Enviamos datos a Mesas.aspx
    //    fetch('Mesas.aspx/GuardarMesas', {
    //        method: 'POST',
    //        headers: {
    //            'Content-Type': 'application/json'
    //        },
    //        body: JSON.stringify({ array: numeroMesasGuardasArray })
    //    })
    //        .then(function (response) {
    //            if (response.ok) {
    //                console.log('Datos enviados al código detrás');
    //            } else {
    //                console.error('Error al enviar los datos al código detrás');
    //            }
    //        })
    //        .catch(function (error) {
    //            console.error('Error al enviar los datos al código detrás:', error);
    //        });
    //});

};

//******* FIN /Mesas.aspx *******/


//******* /MesaHabilitar.aspx *******/
if (currentPagePath.toLowerCase().indexOf('/mesahabilitar.aspx') !== -1) {

    //CARGAMOS MESAS GUARDADAS
    const mesas = document.getElementById("mesas");
    let numeroMesasGuardasArray = JSON.parse(numeroMesasGuardasJSON)


    //RENDERIZAMOS LAS MESAS
    function CargarMesasSeleccion(i, events) {

        mesas.innerHTML = "";

        for (let j = 0; j < i + 1; j++) {
            if (numeroMesasGuardasArray[j] != '0') {
                mesas.innerHTML += `
            <div class="col-6 col-sm-3 d-flex justify-content-center flex-column m-4" style="height: 150px; width: 150px;">
                <div class="w-100 h-100 border rounded-circle border-dark-subtle p-1 btn">
                    <div class="${events ? "bg-warning" : "bg-success"} w-100 h-100 rounded-circle d-flex justify-content-center align-items-center" id="mesa_${j + i}">
                        <i class="fa-solid fa-utensils fs-4"></i>
                    </div>
                </div>
                <div class=" w-100 text-light d-flex justify-content-center">
                    <div class="w-50 bg-black rounded-4 text-center">
                        <small class="fw-bold">${j + 1}</small>
                    </div>
                </div>
            </div>
            `;
            } else {
                mesas.innerHTML += `
            <div class="col-6 col-sm-3 d-flex justify-content-center flex-column m-4" style="height: 150px; width: 150px;">
                <div class="w-100 h-100 border rounded-circle border-dark-subtle p-1 btn">
                    <div class="bg-dark-subtle w-100 h-100 rounded-circle d-flex justify-content-center align-items-center" id="mesa_${j + i}">
                        <i class="fa-solid fa-utensils fs-4"></i>
                    </div>
                </div>
                <div class=" w-100 text-light d-flex justify-content-center">
                    <div class="w-50 bg-black rounded-4 text-center">
                        <small class="fw-bold">${j + 1}</small>
                    </div>
                </div>
            </div>
            `;

            }
        }

        if (events) {
            for (let j = 0; j < i + 1; j++) {

                if (numeroMesasGuardasArray[j] != 0) {
                    document.getElementById(`mesa_${j + i}`).addEventListener("click", () => {
                        document.getElementById(`mesa_${j + i}`).classList.toggle("bg-warning");
                        document.getElementById(`mesa_${j + i}`).classList.toggle("bg-dark-subtle");
                        numeroMesasGuardasArray[j] = 0;
                    });
                } else {
                    document.getElementById(`mesa_${j + i}`).addEventListener("click", () => {
                        document.getElementById(`mesa_${j + i}`).classList.toggle("bg-dark-subtle");
                        document.getElementById(`mesa_${j + i}`).classList.toggle("bg-warning");
                        numeroMesasGuardasArray[j] = 1;
                    });
                }
            }
        }

    }

    const btnHabilitarMesas = document.getElementById("btnHabilitarMesas");
    const btnGuardarMesas = document.getElementById("btnGuardarMesas");

    //Cargamos Mesas con eventos
    btnHabilitarMesas.addEventListener('click', () => {
        btnGuardarMesas.disabled = false;
        CargarMesasSeleccion(cantidadMesas - 1, true)
    })

    //Cargamos Mesas sin eventos al inicio de la página
    CargarMesasSeleccion(cantidadMesas - 1, false)

    // GUARDAMOS MESAS
    btnGuardarMesas.addEventListener('click', () => {
        btnGuardarMesas.disabled = true;

        //Sacamos eventos a las masas
        CargarMesasSeleccion(cantidadMesas - 1, false)

        //Enviamos datos a Mesas.aspx
        fetch('Mesas.aspx/GuardarMesas', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ array: numeroMesasGuardasArray })
        })
            .then(function (response) {
                if (response.ok) {
                    console.log('Datos enviados al código detrás');
                } else {
                    console.error('Error al enviar los datos al código detrás');
                }
            })
            .catch(function (error) {
                console.error('Error al enviar los datos al código detrás:', error);
            });
    });

}
