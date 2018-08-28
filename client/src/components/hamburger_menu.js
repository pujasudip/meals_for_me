import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/hamburger.css';
import { connect } from 'react-redux';

class HamburgerMenu extends Component{
    render() {
        let username = '';
        let success = false;
        if(this.props.loginResponse){
            username = this.props.loginResponse.username;
            success = this.props.loginResponse.success;
        }
        return (
            <div className='home'>
                <div className='right-align'>
                    <i className='material-icons closeIcon'
                       onClick={this.props.hideMenu}>close</i>
                </div>
                <div>Hello, {username}</div>
                <i className='material-icons'>home</i>
                <Link to='/'
                      onClick={this.props.hideMenu}>&nbsp;Home</Link><br/>
                <i className='material-icons prefix'>favorite</i>
                <Link to='/favorites'
                      onClick={this.props.hideMenu}>&nbsp;Favorites</Link><br/>

                { success ? ''
                    :
                    <div>
                        <i className='material-icons'>account_circle</i>
                        < Link to='/login'
                        onClick={this.props.hideMenu}>&nbsp;Log In</Link><br/>
                    </div>
                }
                <i className='material-icons'>group</i>
                <Link to='/about_us'
                      onClick={this.props.hideMenu}>&nbsp;About Team</Link>
            </div>
        );
    }
}

function mapStateToProps(state){
    return {
        loginResponse: state.userLoginResponse.userLoginResponse.data
    }
}

export default connect(mapStateToProps, {})(HamburgerMenu);