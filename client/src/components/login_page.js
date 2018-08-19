import React from 'react';
import '../assets/css/login.css';
import { Link } from 'react-router-dom';

class Login extends React.Component{
    render(){
        return (
           <div className='container login'>
               <form className='col'>
                   <div className='input-field col s6'>
                   <input id='icon_prefix'
                          type='text'
                          className='validate' />
                       <label htmlFor='icon_prefix'>Full Name</label>
                   </div>
                   <div className='input-field col s6'>
                       <input id='icon_email'
                              type='tel'
                              className='validate' />
                           <label htmlFor='icon_email'>Email</label>
                   </div>
               <button className='btn btn-block center-block'>Log In</button>
               </form>
               <div className='center'>
                <Link to='/signup'>Sign Up</Link>
               </div>
           </div>
        );
    }
}

export default Login;