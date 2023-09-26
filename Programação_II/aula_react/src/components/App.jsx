import React from "react";

function App(){

    const [Count, setNewCount] = React.useState(0);


    function counterMore(){
        setNewCount(Count + 1);
    }

    function counterLess(){
        setNewCount(Count - 1);
    }

   


    return (
        <div>

            <p>New Count: {Count}</p>
            <button onClick={counterLess}>Diminua</button>
            <button onClick={counterMore}>Soma</button>

        </div>
    );
}

export default App;