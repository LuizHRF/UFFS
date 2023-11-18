import React from "react";
import axios from "axios";
import Button from '@mui/material/Button';
import BookmarkIcon from '@mui/icons-material/Bookmark';

function Btn_follow(){

    let basics = {backgroundColor: 'white',
        border: '0.5px solid black',
        borderRadius: '10px',
        width: '300px',
        transition: 'all 1s ease',
        margin: '10px'}

    let blue_btn = {color: 'primary.main'};
    let grey_btn = {color: 'grey.500'};

    const [btn_text, setNewBtn_text] = React.useState("Follow");
    const [sx_current, setSx_current] = React.useState(grey_btn);

    function shift(){
        if(btn_text==="Follow"){
            setNewBtn_text("Following");
            axios.post('/follow', {});
            setSx_current(grey_btn); 

        }else{
            setNewBtn_text("Follow");
            axios.post('/unfollow', {});
            setSx_current(blue_btn);

        }
    }
    
    return(
        <Button style={basics} sx={sx_current} variant="outlined" startIcon={<BookmarkIcon />} class="btn_follow" onClick={shift}>{btn_text}</Button>
    )

}

export default Btn_follow;