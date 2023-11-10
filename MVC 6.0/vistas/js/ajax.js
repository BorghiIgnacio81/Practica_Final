function sendLogin() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    var data = {
        username: username,
        password: password
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "process.php", true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText); //el json que envía el servidor

            /* Area para imprimir la información en la página */
            //document.getElementById("result").innerHTML = "Name: " + response.name + "<br>LastName: " + response.lastname + "<br>Age: " + response.age;

        } else if (xhr.readyState == 4 && xhr.status != 200) {
            console.error("Error en la solicitud: " + xhr.status);
        }
    };

    xhr.send(JSON.stringify(data)); //Envía la info al servidor en formato string de json
}
