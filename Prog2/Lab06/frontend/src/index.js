import React from "react";
import ReactDOM from "react-dom/client";
import Page from "./components/page";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <React.StrictMode>
        <Page />
    </React.StrictMode>
);

//Para iniciar o server é ncessário ter o index.js dentro da pasta src
//e o comando utilizado é "yarn start"