import React, { Component } from 'react';
import '../assets/css/header.css';
import logo from '../assets/images/logo_placeh.jpg';
import hamicon from '../assets/images/hamicon.png';
import HamburgerMenu from '../components/hamburger_menu';
import { Link } from 'react-router-dom';
import backButton from '../assets/images/back_arrow.png'

class Header extends Component {
    constructor(props) {
        super(props);
        this.state = {
            menuShow: false
        }
    }

    hamburgerMenu(){
        this.setState({
            menuShow: !this.state.menuShow,
        });
    }

    backdropClicked(event){
        if(event.target.className === 'menu_backdrop'){
            this.setState({
                menuShow: !this.state.menuShow,
            });
        }
    }

    goBack(){
        console.log('this.props in goback:', this.props);
        this.props.history.goBack();
    }

    displayLogInBtn(){
        if(this.props.location.pathname === '/'){
           return( <Link to='/login'>
                <button className='btn btn-flat purple white-text btn-small headerBtn'>Login</button>
        </Link> )
        } else {
            return (
                <button onClick={this.goBack.bind(this)} className='backBtn'>
                    <img src={backButton} className='btn btn-small' />
                </button>
            )
        }
    }
    render() {
        let menuClass = this.state.menuShow ? ['menu', 'menu_backdrop'] : ['no_menu', 'no_menu'];
        return (
            <div className='header'>
                {this.displayLogInBtn()}
                <div>
                    <Link to='/'>
                        <img src={logo} className='logo'/>
                    </Link>
                </div>
                <div>
                    <img src={hamicon} className='hamicon' onClick={()=>this.hamburgerMenu()}/>
                </div>
                <div className={menuClass[1]} onClick={(event)=>this.backdropClicked(event)}>
                    <div className={menuClass[0]}>
                        <HamburgerMenu hideMenu={()=>this.hamburgerMenu()}/>
                    </div>
                </div>
            </div>
        )
    }
}

export default Header;
