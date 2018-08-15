import React from 'react';
import '../assets/css/app.css';
import Header from './header';
import Landing from './landing';
import Results from './results';
import Recipe from './recipe';


const App = () => (
    <div>
        {/* <Header/>
        <Landing/> */}
        {/* <Header/>
        <Results/> */}
        <Header/>
        <Recipe/>
    </div>
);

export default App;
