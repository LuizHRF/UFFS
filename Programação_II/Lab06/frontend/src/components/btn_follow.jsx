import React from "react";
import axios from "axios";
import Button from '@mui/material/Button';
import BookmarkIcon from '@mui/icons-material/Bookmark';

function Btn_follow(){

    const [btn_text, setNewBtn_text] = React.useState("Follow");


    function shift(){
        if(btn_text==="Follow"){
            setNewBtn_text("Following");
            axios.post('/follow', {});
        }else{
            setNewBtn_text("Follow");
            axios.post('/unfollow', {});
        }
    }
    
    return(
        <Button color = "inherit" variant="outlined" startIcon={<BookmarkIcon />} id="btn_follow" onClick={shift}>{btn_text}</Button>
    )

}

export default Btn_follow;