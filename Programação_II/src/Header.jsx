import React from "react";
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import AccountCircle from '@mui/icons-material/AccountCircle';

export default function Header(){
    return(
        <AppBar position="static">
        <Toolbar>
          <AccountCircle />
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
            Bem vindo novamente!
          </Typography>
          
        </Toolbar>
      </AppBar>
    )
}