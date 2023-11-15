import React from 'react'
import Stack from '@mui/system/Stack';
import Buttons from './Buttons';
import Header from './Header';
import Box from '@mui/system/Box';


function App() {
  return (
    <Box style={{padding:"10px", border:"2px solid black", margin:"30px"}}>
      
      <Stack spacing={2}>

        <Header />
        <Buttons />

      </Stack>
      
    </Box>
  );
}

export default App;
