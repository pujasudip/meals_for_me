import React from 'react';
import '../assets/css/login.css';
import { Link } from 'react-router-dom';
import axios from 'axios';
import { connect } from 'react-redux';
import { userLogin } from "../actions";


class Login extends React.Component{

    userLoggingIn = () =>{
        this.props.userLogin('leah', 'abc');
    };

    componentDidMount(){
        console.log('login_status:', this.props.login_status);

    }

    async logOutUser(){
        const dataToSend = new URLSearchParams;

        dataToSend.append('logout', 'true');
        const resp = await axios.post('http://localhost:8000/user_info.php', dataToSend);
        console.log(resp);
        if(resp.data.success){
            console.log('logged in');
        } else {
            console.log('you are not logged in');
        }
    }

    render(){
        const resp = this.props.loginResponse.userLoginResponse.data;
        let userLoggedIn = false;
        if(resp){
            userLoggedIn =  resp.success;
        }

        return (
            userLoggedIn ? 'logged in'
                :
           <div className='container login'>
               <form className='col'>
                   <div className='input-field col s6'>
                   <i className="material-icons prefix">account_circle</i>
                   <input id='icon_prefix'
                          type='text'
                          className='validate' />
                       <label htmlFor='icon_prefix'>Full Name</label>
                   </div>
                   <div className='input-field col s6'>
                       <i className="material-icons prefix">email</i>
                       <input id='icon_email'
                              type='tel'
                              className='validate' />
                           <label htmlFor='icon_email'>Email</label>
                   </div>
               <button type='button' className='btn btn-block center-block' onClick={this.userLoggingIn}>Log In</button>
               </form>
               <div className='center'>
                <Link to='/signup'>Sign Up</Link>
               </div>
               <button type='button' onClick={this.logOutUser}>Log out</button>
           </div>
        );
    }
}

function mapStateToProps(state){
    return {
        loginResponse: state.userLoginResponse,
    }
}

export default connect(mapStateToProps, {userLogin: userLogin})(Login);