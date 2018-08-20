import React from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/hamburger.css';

const HamburgerMenu = (props) => {
    return (
        <div className='home'>
            <div onClick={props.hideMenu} className='right-align'>&times;</div>
            <i className='material-icons'>home</i>
            <Link to='/' onClick={props.hideMenu}>&nbsp;Home</Link><br />
            <i className='material-icons prefix'>favorite</i>
            <Link to='/favorites' onClick={props.hideMenu}>&nbsp;Favorites</Link><br />
            <i className='material-icons'>account_circle</i>
            <Link to='/login' onClick={props.hideMenu}>&nbsp;Log In</Link><br />
            <i className='material-icons'>group</i>
            <Link to='/about_us' onClick={props.hideMenu}>&nbsp;About Team</Link>
        </div>
    );
};

export default HamburgerMenu;