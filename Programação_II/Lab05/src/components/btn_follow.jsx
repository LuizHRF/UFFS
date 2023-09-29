import React from "react";

function Btn_follow(){

    const [btn_text, setNewBtn_text] = React.useState("Follow");


    function shift(){
        if(btn_text==="Follow"){
            setNewBtn_text("Following");
        }else{
            setNewBtn_text("Follow");
        }
    }
    
    return(
        <button id="btn_follow" onClick={shift}>{btn_text}</button>
    )

}

export default Btn_follow;