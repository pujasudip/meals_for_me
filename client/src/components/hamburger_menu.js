import React from 'react';
import { Link } from 'react-router-dom';

const HamburgerMenu = (props) => {
    return (
        <div>
            <div onClick={props.hideMenu} className='right-align'>X</div>
            <Link to='/' onClick={props.hideMenu}>Home</Link><br />
            <Link to='/favorites' onClick={props.hideMenu}>Favorites</Link><br />
            <Link to='/login' onClick={props.hideMenu}>Log In</Link><br />
            <Link to='/about_us' onClick={props.hideMenu}>About Team</Link>
        </div>
    );
};

export default HamburgerMenu;