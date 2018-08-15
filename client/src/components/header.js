import React, { Component } from 'react';
import '../assets/css/header.css';

class Header extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='header'>
                <button>Login</button>
                <div>Logo</div>
                <div>Hamburger Menu</div>
            </div>
        )
    }
}

export default Header;
